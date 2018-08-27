import numpy as np
import tensorflow as tf
from time import time
import math
import huffman
import kcenter
import kmeans
from tensorflow.python.framework import graph_util
from tensorflow.python.framework import graph_io
from tt_conv import tt_conv
from tt_conv_restore import tt_conv_restore
from include.data import get_data_set
from include.model import lr


train_x, train_y = get_data_set("train")
test_x, test_y = get_data_set("test")
tf.set_random_seed(21)

x = tf.placeholder(tf.float32, shape=[None, 32 * 32 * 3], name='Input')
y = tf.placeholder(tf.float32, shape=[None, 10], name='Output')
x_image = tf.reshape(x, [-1, 32, 32, 3], name='images')

global_step = tf.Variable(initial_value=0, trainable=False, name='global_step')
learning_rate = tf.placeholder(tf.float32, shape=[], name='learning_rate')

model = tt_conv(x_image, 10)

# define activation of last layer as score
score = model.fc7

# create op to calculate softmax
softmax = tf.nn.softmax(score)

global_accuracy = 0
epoch_start = 0


# PARAMS
_BATCH_SIZE = 128
_EPOCH = 1
_LOAD_PATH = "./tensorboard/cifar-10-v1.0.0/"
_SAVE_PATH = "./tensor/cifar-10-v1.0.0/"

labels_all = {}
centers_all = {}
index_all = {}  # num % 8 = 0
shapes_all = {}
freq_all = {}
conv_biases = {}
fc_weights = {}
fc_biases = {}

# LOSS AND OPTIMIZER
loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(logits=softmax, labels=y))
optimizer = tf.train.AdamOptimizer(learning_rate=learning_rate,
                                   beta1=0.9,
                                   beta2=0.999,
                                   epsilon=1e-08).minimize(loss, global_step=global_step)


# PREDICTION AND ACCURACY CALCULATION
correct_prediction = tf.equal(tf.argmax(softmax, axis=1), tf.argmax(y, axis=1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))


# SAVER
merged = tf.summary.merge_all()
saver = tf.train.Saver()
with tf.device("/gpu:0"):
    sess = tf.Session()
    train_writer = tf.summary.FileWriter(_LOAD_PATH, sess.graph)


try:
    print("\nTrying to restore last checkpoint ...")
    last_chk_path = tf.train.latest_checkpoint(checkpoint_dir=_LOAD_PATH)
    saver.restore(sess, save_path=last_chk_path)
    print("Restored checkpoint from:", last_chk_path)
except ValueError:
    print("\nFailed to restore checkpoint. Initializing variables instead.")
    sess.run(tf.global_variables_initializer())


def cluster_conv(weight, n_clusters, seed, name, epoch):
    from sklearn.metrics import mean_squared_error
    # weight: cuda tensor
    filters_num = weight.shape[0]
    filters_channel = weight.shape[1]
    filters_size = weight.shape[2]

    weight_vector = weight.reshape(-1, filters_size)

    weight_vector_clustered, labels_all[name], centers_all[name] = kcenter.k_center_vector_fp32(weight_vector.astype('float32'), n_clusters, verbosity=0, seed=seed, labels_new=labels_all[name], centers_new=centers_all[name], epoch=epoch)
    # weight_vector_clustered, labels_all[name], centers_all[name] = kmeans.k_means_vector_gpu_fp32(weight_vector.astype('float32'), n_clusters, verbosity=0, seed=seed, gpu_id=0, labels_new=labels_all[name], centers_new=centers_all[name], epoch=epoch)

    unique, counts = np.unique(labels_all[name], return_counts=True)
    times = {}
    for i in range(n_clusters):
        times[str(i)] = counts[i]
    h = huffman.HuffmanCoding()
    huffman_dict = h.compress(times)
    huffman_code = ''
    for i in labels_all[name]:
        huffman_code += huffman_dict[str(i)]
    appendix_len = 8 - len(huffman_code) % 8
    for i in range(appendix_len % 8):
        huffman_code += '0'
    appendix_string = ''
    for i in range(8):
        if i == appendix_len % 8:
            appendix_string += '1'
        else:
            appendix_string += '0'
    huffman_code += appendix_string

    # string to int8 array
    assert len(huffman_code) % 8 == 0
    huffman_int8 = np.ones((int(len(huffman_code) / 8), ), dtype=np.int8)
    for i in range(len(huffman_int8)):  # converted automatically
        string_tmp = huffman_code[i * 8: i * 8 + 8]
        huffman_int8[i] = int(string_tmp, 2)

    index_all[name] = huffman_int8
    freq_arr = np.ones((len(times.keys()),), dtype=np.int32)
    for i in range(len(freq_arr)):
        freq_arr[i] = np.int32(times[str(i)])
    freq_all[name] = freq_arr

    all_count = labels_all[name].shape[0]
    prob = counts / all_count
    huffman_length = np.sum([- p * np.log2(p) for p in prob])

    print('huffman_length: {}'.format(huffman_length))
    print('log2: {}'.format(np.log2(n_clusters)))
    print('prob_max: ', np.max(prob))
    print('abs mean: ', np.mean(np.abs(weight_vector), axis=0))

    # # visualize the weights
    # if filters_size == 3:
    #     plot(weight_vector, labels_all[name], centers_all[name], name, epoch, n_clusters, np.max(prob))

    weight_cube_clustered = weight_vector_clustered.reshape(filters_num, filters_channel,
                                                            filters_size, -1)

    mse = mean_squared_error(weight_vector, weight_vector_clustered)

    weight_compress = weight_cube_clustered.astype('float32')

    return weight_compress, mse, huffman_length


def compress(variables, sess, epoch, use_compression=True):
    for v in variables:
        if 'conv' in v.name and 'weights' in v.name:
            if v.name not in labels_all.keys():
                labels_all[v.name] = []
                centers_all[v.name] = []

            # memory += np.prod(sess.run(v).shape)
            print("weights.name: {}".format(v.name))
            print("weights.shape: {}".format(sess.run(v).shape))
            if use_compression:
                weights = sess.run(v)
                shapes_all[v.name] = weights.shape

                weights = np.transpose(weights, (3, 2, 0, 1))
                shape = weights.shape
                n, c, h = shape[0], shape[1], shape[2]
                samples_num = n * c * h
                feature_dim = h

                k = int(0.005 * samples_num) + 1
                # skip the first layer
                # if v.name == 'InceptionV1/Conv2d_1a_7x7/weights:0':
                #     k = n * c * w

                weight_clustered, mse, huffman_length = cluster_conv(weights, k, 0, v.name, epoch=epoch)

                # memory_weight += k * feature_dim * 32 + samples_num * huffman_length
                # memory_weight_log += k * feature_dim * 32 + samples_num * np.log2(k)

                # self.memory_weight = cluster_list_conv[i] * feature_dim * self.bitwidth_org + samples_num * np.log2(cluster_list_conv[i])

                weight_clustered = np.transpose(weight_clustered, (2, 3, 1, 0))
                sess.run(v.assign(weight_clustered))
                print("weight_clustered shape: {}".format(weight_clustered.shape))
                print("mse: {}".format(mse))

            print('==================cluster done==================')

        if 'conv' in v.name and 'biases' in v.name:
            biases = sess.run(v)
            conv_biases[v.name] = biases

        if 'fc' in v.name and 'weights' in v.name:
            weights = sess.run(v)
            fc_weights[v.name] = weights

        if 'fc' in v.name and 'biases' in v.name:
            biases = sess.run(v)
            fc_biases[v.name] = biases


def train(epoch):
    with tf.device('/gpu:0'):
        global epoch_start
        epoch_start = time()
        batch_size = int(math.ceil(len(train_x) / _BATCH_SIZE))
        i_global = 0

        for s in range(batch_size):
            batch_xs = train_x[s*_BATCH_SIZE: (s+1)*_BATCH_SIZE]
            batch_ys = train_y[s*_BATCH_SIZE: (s+1)*_BATCH_SIZE]

            start_time = time()
            i_global, _, batch_loss, batch_acc = sess.run(
                [global_step, optimizer, loss, accuracy],
                feed_dict={x: batch_xs, y: batch_ys, learning_rate: 0.0005})
            duration = time() - start_time

            if s % 10 == 0:
                percentage = int(round((s/batch_size)*100))

                bar_len = 29
                filled_len = int((bar_len*int(percentage))/100)
                bar = '=' * filled_len + '>' + '-' * (bar_len - filled_len)

                msg = "Global step: {:>5} - [{}] {:>3}% - acc: {:.4f} - loss: {:.4f} - {:.1f} sample/sec"
                print(msg.format(i_global, bar, percentage, batch_acc, batch_loss, _BATCH_SIZE / duration))

        test_and_save(i_global, epoch)


def test_and_save(_global_step, epoch=-1, test=False):
    global global_accuracy
    global epoch_start

    # Compress the model
    if epoch >= 0:
        compress(tf.trainable_variables(), sess, epoch)

    i = 0
    predicted_class = np.zeros(shape=len(test_x), dtype=np.int)
    while i < len(test_x):
        j = min(i + _BATCH_SIZE, len(test_x))
        batch_xs = test_x[i:j, :]
        batch_ys = test_y[i:j, :]
        predicted_class[i:j] = sess.run(
            tf.argmax(softmax, axis=1),
            feed_dict={x: batch_xs, y: batch_ys, learning_rate: lr(epoch)}
        )
        i = j

    correct = (np.argmax(test_y, axis=1) == predicted_class)
    acc = correct.mean()*100
    correct_numbers = correct.sum()

    hours, rem = divmod(time() - epoch_start, 3600)
    minutes, seconds = divmod(rem, 60)
    mes = "\nEpoch {} - accuracy: {:.2f}% ({}/{}) - time: {:0>2}:{:0>2}:{:05.2f}"
    print(mes.format((epoch+1), acc, correct_numbers, len(test_x), int(hours), int(minutes), seconds))

    if test:
        return

    if global_accuracy != 0 and global_accuracy < acc:

        summary = tf.Summary(value=[
            tf.Summary.Value(tag="Accuracy/test", simple_value=acc),
        ])
        train_writer.add_summary(summary, _global_step)

        saver.save(sess, save_path=_SAVE_PATH, global_step=_global_step)

        mes = "This epoch receive better accuracy: {:.2f} > {:.2f}. Saving session..."
        print(mes.format(acc, global_accuracy))
        global_accuracy = acc

    elif global_accuracy == 0:
        global_accuracy = acc

    print("###########################################################################################################")


def main():
    train_start = time()

    for i in range(_EPOCH):
        print("\nEpoch: {}/{}\n".format((i+1), _EPOCH))
        train(i)

    hours, rem = divmod(time() - train_start, 3600)
    minutes, seconds = divmod(rem, 60)
    mes = "Best accuracy pre session: {:.2f}, time: {:0>2}:{:0>2}:{:05.2f}"
    print(mes.format(global_accuracy, int(hours), int(minutes), seconds))


main()

sess.close()
tf.reset_default_graph()

x_new = tf.placeholder(tf.float32, shape=[None, 32 * 32 * 3], name='Input')
y_new = tf.placeholder(tf.float32, shape=[None, 10], name='Output')
x_image_new = tf.reshape(x_new, [-1, 32, 32, 3], name='images')
learning_rate_new = tf.placeholder(tf.float32, shape=[], name='learning_rate')


def find_conv(name, max_layer=100):
    for i in range(max_layer):
        if 'conv' + str(i) in name:
            return 'conv' + str(i)
    assert 'cannot find conv or too many conv layers'


def find_fc(name, max_layer=100):
    for i in range(max_layer):
        if 'fc' + str(i) in name:
            return 'fc' + str(i)
    assert 'cannot find fc or too many fc layers'


_SAVE_PATH = "./tensorboard_restore/"
# create model with default config ( == no skip_layer and 1000 units in the last layer)
model = tt_conv_restore(x_image_new, 10, centers_all, index_all, shapes_all, freq_all, conv_biases, fc_weights, fc_biases)

# define activation of last layer as score
score = model.fc7

# create op to calculate softmax
softmax = tf.nn.softmax(score)


# Initialize the variables (i.e. assign their default value)
init = tf.global_variables_initializer()
saver = tf.train.Saver()

with tf.Session() as sess:

    # Run the initializer
    sess.run(init)

    memory = 0
    use_compression = True
    memory_weight = 0
    memory_weight_log = 0

    for v in tf.trainable_variables():

        if 'index' in v.name and 'conv' in v.name:
            name = find_conv(v.name)   # max layer number is 200
            index = sess.run(v)
            tmp_name = ''
            for i in centers_all.keys():
                if name in i:
                    tmp_name = i

            sess.run(v.assign(index_all[tmp_name]))
            print('for ', v.name)
            print('==================assigning index done==================')

        if 'centers' in v.name and 'conv' in v.name:
            name = find_conv(v.name)  # max layer number is 200
            centers = sess.run(v)
            print('[Debug]: the shape of the centers', centers.shape)
            tmp_name = ''
            for i in centers_all.keys():
                if name in i:
                    tmp_name = i

            sess.run(v.assign(centers_all[tmp_name]))
            print('for ', v.name)
            print('==================assigning centers done==================')

        if 'shape' in v.name and 'conv' in v.name:
            name = find_conv(v.name)  # max layer number is 200
            shape = sess.run(v)
            tmp_name = ''
            for i in shapes_all.keys():
                if name in i:
                    tmp_name = i

            for i in range(len(shape)):
                shape[i] = shapes_all[tmp_name][i]
            sess.run(v.assign(shape))
            print('for ', v.name)
            print('==================assigning shape done==================')
            print(shape)

        if 'freq' in v.name and 'conv' in v.name:
            name = find_conv(v.name)  # max layer number is 200
            freq = sess.run(v)
            tmp_name = ''
            for i in freq_all.keys():
                if name in i:
                    tmp_name = i
            for i in range(len(freq_all[tmp_name])):
                freq[i] = freq_all[tmp_name][i]
            sess.run(v.assign(freq))
            print('for ', v.name)
            print('==================assigning freq done==================')

        if 'biases' in v.name and 'conv' in v.name:
            name = find_conv(v.name)
            biases = sess.run(v)
            tmp_name = ''
            for i in conv_biases.keys():
                if name in i:
                    tmp_name = i
            sess.run(v.assign(conv_biases[tmp_name]))
            print('for ', v.name)
            print('==================assigning conv_biases done==================')
            print(biases.shape)

        if 'weights' in v.name and 'fc' in v.name:
            name = find_fc(v.name)
            weights = sess.run(v)
            tmp_name = ''
            for i in fc_weights.keys():
                if name in i:
                    tmp_name = i
            sess.run(v.assign(fc_weights[tmp_name]))
            print('for ', v.name)
            print('==================assigning fc_weights done==================')
            print(weights.shape)

        if 'biases' in v.name and 'fc' in v.name:
            name = find_fc(v.name)
            biases = sess.run(v)
            tmp_name = ''
            for i in fc_biases.keys():
                if name in i:
                    tmp_name = i
            sess.run(v.assign(fc_biases[tmp_name]))
            print('for ', v.name)
            print('==================assigning fc_biases done==================')
            print(biases.shape)

    i = 0
    predicted_class = np.zeros(shape=len(test_x), dtype=np.int)
    while i < len(test_x):
        j = min(i + _BATCH_SIZE, len(test_x))
        batch_xs = test_x[i:j, :]
        batch_ys = test_y[i:j, :]
        predicted_class[i:j] = sess.run(
            tf.argmax(softmax, axis=1),
            feed_dict={x_new: batch_xs, y_new: batch_ys, learning_rate_new: 0}
        )
        i = j

    correct = (np.argmax(test_y, axis=1) == predicted_class)
    acc = correct.mean() * 100
    correct_numbers = correct.sum()
    print(correct, acc, correct_numbers)

    saver.save(sess, _SAVE_PATH)

    oup_names = [None]
    oup_names[0] = sess.graph.get_operations()[-1].name
    constant_graph = graph_util.convert_variables_to_constants(sess, sess.graph.as_graph_def(), oup_names)
    graph_io.write_graph(constant_graph, "./", "model_op.pb", as_text=False)

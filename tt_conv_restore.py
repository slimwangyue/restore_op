"""This is an TensorFLow implementation of AlexNet by Alex Krizhevsky at all.

Paper:
(http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf)

Explanation can be found in my blog post:
https://kratzert.github.io/2017/02/24/finetuning-alexnet-with-tensorflow.html

This script enables finetuning AlexNet on any given Dataset with any number of
classes. The structure of this script is strongly inspired by the fast.ai
Deep Learning class by Jeremy Howard and Rachel Thomas, especially their vgg16
finetuning script:
Link:
- https://github.com/fastai/courses/blob/master/deeplearning1/nbs/vgg16.py


The pretrained weights can be downloaded here and should be placed in the same
folder as this file:
- http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/

@author: Frederik Kratzert (contact: f.kratzert(at)gmail.com)
"""

import tensorflow as tf
import numpy as np
restore_module = tf.load_op_library('/home/yw68/tensorflow/tensorflow/core/user_ops/restore_weight.so')


class tt_conv_restore(object):
    """Implementation of the AlexNet."""

    def __init__(self, x, num_classes, centers_all, index_all, shapes_all,
                 freq_all, conv_biases, fc_weights, fc_biases):

        # Parse input arguments into class variables
        self.X = x
        self.NUM_CLASSES = num_classes

        self.centers_all = centers_all
        self.index_all = index_all
        self.shapes_all = shapes_all
        self.freq_all = freq_all

        self.conv_biases = conv_biases
        self.fc_weights = fc_weights
        self.fc_biases = fc_biases

        # Call the create function to build the computational graph of AlexNet
        self.create()

    def create(self):
        """Create the network graph."""
        # 1st Layer: Conv -> norm -> ReLu
        conv1 = self.conv(x=self.X, stride_y=1, stride_x=1, padding='SAME', name='conv1')
        norm1 = lrn(conv1, 2, 1e-04, 0.75, name='norm1')
        # Apply relu function
        relu1 = tf.nn.relu(norm1)

        # 2st Layer: Conv -> norm -> ReLu
        conv2 = self.conv(x=relu1, stride_y=1, stride_x=1, padding='SAME', name='conv2')
        norm2 = lrn(conv2, 2, 1e-04, 0.75, name='norm2')
        # Apply relu function
        relu2 = tf.nn.relu(norm2)

        pool2 = tf.nn.max_pool(relu2, ksize=[1, 3, 3, 1],
                               strides=[1, 2, 2, 1],
                               padding='SAME')

        # 3st Layer: Conv -> norm -> ReLu
        conv3 = self.conv(x=pool2, stride_y=1, stride_x=1, padding='SAME', name='conv3')
        norm3 = lrn(conv3, 2, 1e-04, 0.75, name='norm3')
        # Apply relu function
        relu3 = tf.nn.relu(norm3)

        # 4st Layer: Conv -> norm -> ReLu
        conv4 = self.conv(x=relu3, stride_y=1, stride_x=1, padding='SAME', name='conv4')
        norm4 = lrn(conv4, 2, 1e-04, 0.75, name='norm4')
        # Apply relu function
        relu4 = tf.nn.relu(norm4)

        pool4 = tf.nn.max_pool(relu4, ksize=[1, 3, 3, 1],
                               strides=[1, 2, 2, 1],
                               padding='SAME')

        # 5st Layer: Conv -> norm -> ReLu
        conv5 = self.conv(x=pool4, stride_y=1, stride_x=1, padding='SAME', name='conv5')
        norm5 = lrn(conv5, 2, 1e-04, 0.75, name='norm5')
        # Apply relu function
        relu5 = tf.nn.relu(norm5)

        # 6st Layer: Conv -> norm -> ReLu
        conv6 = self.conv(x=relu5, stride_y=1, stride_x=1, padding='SAME', name='conv6')
        norm6 = lrn(conv6, 2, 1e-04, 0.75, name='norm6')
        # Apply relu function
        relu6 = tf.nn.relu(norm6)

        pool6 = tf.nn.avg_pool(relu6, ksize=[1, 4, 4, 1],
                               strides=[1, 4, 4, 1],
                               padding='SAME')

        flattened = tf.reshape(pool6, [-1, 128 * 4])
        self.fc7 = self.fc(flattened, name='fc7')


    def conv(self, x, stride_y, stride_x, name, padding='SAME'):

        with tf.device('/device:CPU:0'):
            with tf.variable_scope(name) as scope:

                name_weight = name
                for i in self.index_all.keys():
                    if name_weight in i:
                        name_weight = i    # name for this layer

                # init_index = tf.constant(self.index_all[name_weight])    # dtype will be aligned auto
                index = tf.get_variable("index",
                                        shape=self.index_all[name_weight].shape,
                                        dtype=self.index_all[name_weight].dtype)
                print("index_shape:", index.get_shape())

                # init_centers = tf.constant(self.centers_all[name_weight])
                centers = tf.get_variable("centers",
                                          shape=self.centers_all[name_weight].shape,
                                          dtype=self.centers_all[name_weight].dtype)
                print("centers_shape:", centers.get_shape())

                # init_shape = tf.constant(self.shapes_all[name_weight])
                shape = tf.get_variable("shape",
                                        shape=4,
                                        dtype=tf.int32)
                print("shape_shape:", shape.get_shape())

                # init_freq = tf.constant(self.freq_all[name_weight])
                freq = tf.get_variable("freq",
                                       shape=self.freq_all[name_weight].shape,
                                       dtype=self.freq_all[name_weight].dtype)
                print("freq_shape:", freq.get_shape())

                for i in self.conv_biases.keys():
                    if name in i:
                        name = i
                biases = tf.get_variable("biases",
                                         shape=self.conv_biases[name].shape,
                                         dtype=self.conv_biases[name].dtype)

            weights = restore_module.restore_weight(index, centers, shape, freq)
            conv = tf.nn.conv2d(x, weights, strides=[1, stride_y, stride_x, 1], padding=padding)

            # Add biases
            bias = tf.reshape(tf.nn.bias_add(conv, biases), tf.shape(conv))

        return bias

    def fc(self, x, name, relu=True):
        """Create a fully connected layer."""

        with tf.device('/device:CPU:0'):
            with tf.variable_scope(name) as scope:
                name_weights = name
                for i in self.fc_weights.keys():
                    if name_weights in i:
                        name_weights = i
                # Create tf variables for the weights and biases
                weights = tf.get_variable('weights',
                                          shape=self.fc_weights[name_weights].shape,
                                          dtype=self.fc_weights[name_weights].dtype)

                for i in self.fc_biases.keys():
                    if name in i:
                        name = i
                biases = tf.get_variable('biases',
                                         shape=self.fc_biases[name].shape,
                                         dtype=self.fc_biases[name].dtype)

                # Matrix multiply weights and inputs and add bias
                act = tf.nn.xw_plus_b(x, weights, biases, name=scope.name)

        if relu:
            # Apply ReLu non linearity
            relu = tf.nn.relu(act)
            return relu
        else:
            return act


def lrn(x, name, phase=True):
    """Create a local response normalization layer."""
    # return tf.nn.local_response_normalization(x, depth_radius=radius,
    #                                           alpha=alpha, beta=beta,
    #                                           bias=bias, name=name)
    return tf.contrib.layers.batch_norm(x,
                                        center=True, scale=True,
                                        is_training=phase,
                                        name=name)

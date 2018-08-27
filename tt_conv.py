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


class tt_conv(object):
    """Implementation of the AlexNet."""

    def __init__(self, x, num_classes):

        # Parse input arguments into class variables
        self.X = x
        self.NUM_CLASSES = num_classes

        # Call the create function to build the computational graph of AlexNet
        self.create()

    def create(self):
        """Create the network graph."""
        # 1st Layer: Conv -> norm -> ReLu
        conv1 = conv(self.X, 3, 3, 64, 1, 1, padding='SAME', name='conv1')
        norm1 = lrn(conv1, 2, 1e-04, 0.75, name='norm1')
        # Apply relu function
        relu1 = tf.nn.relu(norm1)

        # 2st Layer: Conv -> norm -> ReLu
        conv2 = conv(relu1, 3, 3, 64, 1, 1, padding='SAME', name='conv2')
        norm2 = lrn(conv2, 2, 1e-04, 0.75, name='norm2')
        # Apply relu function
        relu2 = tf.nn.relu(norm2)

        pool2 = tf.nn.max_pool(relu2, ksize=[1, 3, 3, 1],
                               strides=[1, 2, 2, 1],
                               padding='SAME')

        # 3st Layer: Conv -> norm -> ReLu
        conv3 = conv(pool2, 3, 3, 128, 1, 1, padding='SAME', name='conv3')
        norm3 = lrn(conv3, 2, 1e-04, 0.75, name='norm3')
        # Apply relu function
        relu3 = tf.nn.relu(norm3)

        # 4st Layer: Conv -> norm -> ReLu
        conv4 = conv(relu3, 3, 3, 128, 1, 1, padding='SAME', name='conv4')
        norm4 = lrn(conv4, 2, 1e-04, 0.75, name='norm4')
        # Apply relu function
        relu4 = tf.nn.relu(norm4)

        pool4 = tf.nn.max_pool(relu4, ksize=[1, 3, 3, 1],
                               strides=[1, 2, 2, 1],
                               padding='SAME')

        # 5st Layer: Conv -> norm -> ReLu
        conv5 = conv(pool4, 3, 3, 128, 1, 1, padding='SAME', name='conv5')
        norm5 = lrn(conv5, 2, 1e-04, 0.75, name='norm5')
        # Apply relu function
        relu5 = tf.nn.relu(norm5)

        # 6st Layer: Conv -> norm -> ReLu
        conv6 = conv(relu5, 3, 3, 128, 1, 1, padding='SAME', name='conv6')
        norm6 = lrn(conv6, 2, 1e-04, 0.75, name='norm6')
        # Apply relu function
        relu6 = tf.nn.relu(norm6)

        pool6 = tf.nn.avg_pool(relu6, ksize=[1, 4, 4, 1],
                               strides=[1, 4, 4, 1],
                               padding='SAME')

        flattened = tf.reshape(pool6, [-1, 128 * 4])
        self.fc7 = fc(flattened, 128 * 4, self.NUM_CLASSES, name='fc7')


def conv(x, filter_height, filter_width, num_filters, stride_y, stride_x, name,
         padding='SAME'):
    """Create a convolution layer.

    Adapted from: https://github.com/ethereon/caffe-tensorflow
    """
    # Get number of input channels
    input_channels = int(x.get_shape()[-1])

    with tf.device('/device:GPU:0'):
        with tf.variable_scope(name) as scope:
            # Create tf variables for the weights and biases of the conv layer
            weights = tf.get_variable('weights', shape=[filter_height,
                                                        filter_width,
                                                        input_channels,
                                                        num_filters])
            biases = tf.get_variable('biases', shape=[num_filters])

        conv = tf.nn.conv2d(x, weights, strides=[1, stride_y, stride_x, 1], padding=padding)

        # Add biases
        bias = tf.reshape(tf.nn.bias_add(conv, biases), tf.shape(conv))

    return bias


def fc(x, num_in, num_out, name):
    """Create a fully connected layer."""
    with tf.device('/device:GPU:0'):
        with tf.variable_scope(name) as scope:

            # Create tf variables for the weights and biases
            weights = tf.get_variable('weights', shape=[num_in, num_out],
                                      trainable=True)
            biases = tf.get_variable('biases', [num_out], trainable=True)

            # Matrix multiply weights and inputs and add bias
            act = tf.nn.xw_plus_b(x, weights, biases, name=scope.name)

    return act


def lrn(x, radius, alpha, beta, name, bias=1.0):
    """Create a local response normalization layer."""
    return tf.nn.local_response_normalization(x, depth_radius=radius,
                                              alpha=alpha, beta=beta,
                                              bias=bias, name=name)

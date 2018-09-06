import tensorflow as tf


def lr(epoch):
    learning_rate = 0.2e-2
    if epoch > 120:
        learning_rate *= 1e-7
    elif epoch > 100:
        learning_rate *= 1e-6
    elif epoch > 80:
        learning_rate *= 0.5e-5
    elif epoch > 60:
        learning_rate *= 1e-5
    elif epoch > 40:
        learning_rate *= 1e-4
    elif epoch > 20:
        learning_rate *= 1e-3
    return learning_rate

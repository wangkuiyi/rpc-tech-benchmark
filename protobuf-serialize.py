import numpy as np
import tensorflow as tf
import timeit

img = np.random.uniform(low=0.0, high=1.0, size=(28*28,))
lbl = np.random.randint(0, high=1, size=10)


def serializeImageAndLabel():
    """Serialize 1000 image-label pairs"""
    for row in range(1000):
        tf.train.Example(
            features=tf.train.Features(
                feature={
                    "image": tf.train.Feature(
                        float_list=tf.train.FloatList(
                            value=img
                        )
                    ),
                    "label": tf.train.Feature(
                        int64_list=tf.train.Int64List(
                            value=lbl
                        )
                    ),
                }
            )
        ).SerializeToString()


if __name__ == '__main__':
    print(timeit.timeit("serializeImageAndLabel()",
                        setup="from __main__ import serializeImageAndLabel", number=10))

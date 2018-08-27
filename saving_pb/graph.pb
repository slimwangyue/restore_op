node {
  name: "Input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 3072
        }
      }
    }
  }
}
node {
  name: "Output"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 10
        }
      }
    }
  }
}
node {
  name: "images/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377 \000\000\000 \000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "images"
  op: "Reshape"
  input: "Input"
  input: "images/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "learning_rate"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "conv1/index/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 77
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv1/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 77
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/index/Assign"
  op: "Assign"
  input: "conv1/index"
  input: "conv1/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/index/read"
  op: "Identity"
  input: "conv1/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1/centers/Initializer/random_uniform/max"
  input: "conv1/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1/centers/Initializer/random_uniform/RandomUniform"
  input: "conv1/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
}
node {
  name: "conv1/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv1/centers/Initializer/random_uniform/mul"
  input: "conv1/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
}
node {
  name: "conv1/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/centers/Assign"
  op: "Assign"
  input: "conv1/centers"
  input: "conv1/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/centers/read"
  op: "Identity"
  input: "conv1/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
}
node {
  name: "conv1/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv1/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/shape/Assign"
  op: "Assign"
  input: "conv1/shape"
  input: "conv1/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/shape/read"
  op: "Identity"
  input: "conv1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
}
node {
  name: "conv1/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv1/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/freq/Assign"
  op: "Assign"
  input: "conv1/freq"
  input: "conv1/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/freq/read"
  op: "Identity"
  input: "conv1/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1/biases/Initializer/random_uniform/max"
  input: "conv1/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1/biases/Initializer/random_uniform/RandomUniform"
  input: "conv1/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
}
node {
  name: "conv1/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv1/biases/Initializer/random_uniform/mul"
  input: "conv1/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
}
node {
  name: "conv1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/biases/Assign"
  op: "Assign"
  input: "conv1/biases"
  input: "conv1/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/biases/read"
  op: "Identity"
  input: "conv1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight"
  op: "RestoreWeight"
  input: "conv1/index/read"
  input: "conv1/centers/read"
  input: "conv1/shape/read"
  input: "conv1/freq/read"
}
node {
  name: "Conv2D"
  op: "Conv2D"
  input: "images"
  input: "RestoreWeight"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd"
  op: "BiasAdd"
  input: "Conv2D"
  input: "conv1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape"
  op: "Shape"
  input: "Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "BiasAdd"
  input: "Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm1"
  op: "LRN"
  input: "Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu"
  op: "Relu"
  input: "norm1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/index/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 5027
      }
    }
  }
}
node {
  name: "conv2/index/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv2/index/Initializer/zeros"
  op: "Fill"
  input: "conv2/index/Initializer/zeros/shape_as_tensor"
  input: "conv2/index/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv2/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5027
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/index/Assign"
  op: "Assign"
  input: "conv2/index"
  input: "conv2/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/index/read"
  op: "Identity"
  input: "conv2/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ">\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2/centers/Initializer/random_uniform/max"
  input: "conv2/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2/centers/Initializer/random_uniform/RandomUniform"
  input: "conv2/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
}
node {
  name: "conv2/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv2/centers/Initializer/random_uniform/mul"
  input: "conv2/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
}
node {
  name: "conv2/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 62
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/centers/Assign"
  op: "Assign"
  input: "conv2/centers"
  input: "conv2/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/centers/read"
  op: "Identity"
  input: "conv2/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
}
node {
  name: "conv2/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv2/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/shape/Assign"
  op: "Assign"
  input: "conv2/shape"
  input: "conv2/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/shape/read"
  op: "Identity"
  input: "conv2/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
}
node {
  name: "conv2/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 62
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv2/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 62
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/freq/Assign"
  op: "Assign"
  input: "conv2/freq"
  input: "conv2/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/freq/read"
  op: "Identity"
  input: "conv2/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2/biases/Initializer/random_uniform/max"
  input: "conv2/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2/biases/Initializer/random_uniform/RandomUniform"
  input: "conv2/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
}
node {
  name: "conv2/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv2/biases/Initializer/random_uniform/mul"
  input: "conv2/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
}
node {
  name: "conv2/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/biases/Assign"
  op: "Assign"
  input: "conv2/biases"
  input: "conv2/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/biases/read"
  op: "Identity"
  input: "conv2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight_1"
  op: "RestoreWeight"
  input: "conv2/index/read"
  input: "conv2/centers/read"
  input: "conv2/shape/read"
  input: "conv2/freq/read"
}
node {
  name: "Conv2D_1"
  op: "Conv2D"
  input: "Relu"
  input: "RestoreWeight_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd_1"
  op: "BiasAdd"
  input: "Conv2D_1"
  input: "conv2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape_1"
  op: "Shape"
  input: "Conv2D_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "BiasAdd_1"
  input: "Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm2"
  op: "LRN"
  input: "Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu_1"
  op: "Relu"
  input: "norm2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool"
  op: "MaxPool"
  input: "Relu_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "conv3/index/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 13339
      }
    }
  }
}
node {
  name: "conv3/index/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv3/index/Initializer/zeros"
  op: "Fill"
  input: "conv3/index/Initializer/zeros/shape_as_tensor"
  input: "conv3/index/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv3/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 13339
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/index/Assign"
  op: "Assign"
  input: "conv3/index"
  input: "conv3/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/index/read"
  op: "Identity"
  input: "conv3/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "{\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.2182178944349289
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.2182178944349289
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3/centers/Initializer/random_uniform/max"
  input: "conv3/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3/centers/Initializer/random_uniform/RandomUniform"
  input: "conv3/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
}
node {
  name: "conv3/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv3/centers/Initializer/random_uniform/mul"
  input: "conv3/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
}
node {
  name: "conv3/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 123
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/centers/Assign"
  op: "Assign"
  input: "conv3/centers"
  input: "conv3/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/centers/read"
  op: "Identity"
  input: "conv3/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
}
node {
  name: "conv3/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv3/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/shape/Assign"
  op: "Assign"
  input: "conv3/shape"
  input: "conv3/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/shape/read"
  op: "Identity"
  input: "conv3/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
}
node {
  name: "conv3/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 123
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv3/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 123
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/freq/Assign"
  op: "Assign"
  input: "conv3/freq"
  input: "conv3/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/freq/read"
  op: "Identity"
  input: "conv3/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3/biases/Initializer/random_uniform/max"
  input: "conv3/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3/biases/Initializer/random_uniform/RandomUniform"
  input: "conv3/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
}
node {
  name: "conv3/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv3/biases/Initializer/random_uniform/mul"
  input: "conv3/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
}
node {
  name: "conv3/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/biases/Assign"
  op: "Assign"
  input: "conv3/biases"
  input: "conv3/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/biases/read"
  op: "Identity"
  input: "conv3/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight_2"
  op: "RestoreWeight"
  input: "conv3/index/read"
  input: "conv3/centers/read"
  input: "conv3/shape/read"
  input: "conv3/freq/read"
}
node {
  name: "Conv2D_2"
  op: "Conv2D"
  input: "MaxPool"
  input: "RestoreWeight_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd_2"
  op: "BiasAdd"
  input: "Conv2D_2"
  input: "conv3/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape_2"
  op: "Shape"
  input: "Conv2D_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_2"
  op: "Reshape"
  input: "BiasAdd_2"
  input: "Shape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm3"
  op: "LRN"
  input: "Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu_2"
  op: "Relu"
  input: "norm3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv4/index/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 31816
      }
    }
  }
}
node {
  name: "conv4/index/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv4/index/Initializer/zeros"
  op: "Fill"
  input: "conv4/index/Initializer/zeros/shape_as_tensor"
  input: "conv4/index/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv4/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 31816
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv4/index/Assign"
  op: "Assign"
  input: "conv4/index"
  input: "conv4/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv4/index/read"
  op: "Identity"
  input: "conv4/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\366\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1552301049232483
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1552301049232483
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv4/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv4/centers/Initializer/random_uniform/max"
  input: "conv4/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv4/centers/Initializer/random_uniform/RandomUniform"
  input: "conv4/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
}
node {
  name: "conv4/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv4/centers/Initializer/random_uniform/mul"
  input: "conv4/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
}
node {
  name: "conv4/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv4/centers/Assign"
  op: "Assign"
  input: "conv4/centers"
  input: "conv4/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv4/centers/read"
  op: "Identity"
  input: "conv4/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
}
node {
  name: "conv4/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv4/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv4/shape/Assign"
  op: "Assign"
  input: "conv4/shape"
  input: "conv4/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv4/shape/read"
  op: "Identity"
  input: "conv4/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
}
node {
  name: "conv4/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv4/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv4/freq/Assign"
  op: "Assign"
  input: "conv4/freq"
  input: "conv4/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv4/freq/read"
  op: "Identity"
  input: "conv4/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv4/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv4/biases/Initializer/random_uniform/max"
  input: "conv4/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv4/biases/Initializer/random_uniform/RandomUniform"
  input: "conv4/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
}
node {
  name: "conv4/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv4/biases/Initializer/random_uniform/mul"
  input: "conv4/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
}
node {
  name: "conv4/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv4/biases/Assign"
  op: "Assign"
  input: "conv4/biases"
  input: "conv4/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv4/biases/read"
  op: "Identity"
  input: "conv4/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight_3"
  op: "RestoreWeight"
  input: "conv4/index/read"
  input: "conv4/centers/read"
  input: "conv4/shape/read"
  input: "conv4/freq/read"
}
node {
  name: "Conv2D_3"
  op: "Conv2D"
  input: "Relu_2"
  input: "RestoreWeight_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd_3"
  op: "BiasAdd"
  input: "Conv2D_3"
  input: "conv4/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape_3"
  op: "Shape"
  input: "Conv2D_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_3"
  op: "Reshape"
  input: "BiasAdd_3"
  input: "Shape_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm4"
  op: "LRN"
  input: "Reshape_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu_3"
  op: "Relu"
  input: "norm4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MaxPool_1"
  op: "MaxPool"
  input: "Relu_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "conv5/index/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 30258
      }
    }
  }
}
node {
  name: "conv5/index/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv5/index/Initializer/zeros"
  op: "Fill"
  input: "conv5/index/Initializer/zeros/shape_as_tensor"
  input: "conv5/index/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv5/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 30258
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv5/index/Assign"
  op: "Assign"
  input: "conv5/index"
  input: "conv5/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv5/index/read"
  op: "Identity"
  input: "conv5/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\366\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1552301049232483
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1552301049232483
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv5/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv5/centers/Initializer/random_uniform/max"
  input: "conv5/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv5/centers/Initializer/random_uniform/RandomUniform"
  input: "conv5/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
}
node {
  name: "conv5/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv5/centers/Initializer/random_uniform/mul"
  input: "conv5/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
}
node {
  name: "conv5/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv5/centers/Assign"
  op: "Assign"
  input: "conv5/centers"
  input: "conv5/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv5/centers/read"
  op: "Identity"
  input: "conv5/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
}
node {
  name: "conv5/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv5/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv5/shape/Assign"
  op: "Assign"
  input: "conv5/shape"
  input: "conv5/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv5/shape/read"
  op: "Identity"
  input: "conv5/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
}
node {
  name: "conv5/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv5/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv5/freq/Assign"
  op: "Assign"
  input: "conv5/freq"
  input: "conv5/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv5/freq/read"
  op: "Identity"
  input: "conv5/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv5/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv5/biases/Initializer/random_uniform/max"
  input: "conv5/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv5/biases/Initializer/random_uniform/RandomUniform"
  input: "conv5/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
}
node {
  name: "conv5/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv5/biases/Initializer/random_uniform/mul"
  input: "conv5/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
}
node {
  name: "conv5/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv5/biases/Assign"
  op: "Assign"
  input: "conv5/biases"
  input: "conv5/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv5/biases/read"
  op: "Identity"
  input: "conv5/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight_4"
  op: "RestoreWeight"
  input: "conv5/index/read"
  input: "conv5/centers/read"
  input: "conv5/shape/read"
  input: "conv5/freq/read"
}
node {
  name: "Conv2D_4"
  op: "Conv2D"
  input: "MaxPool_1"
  input: "RestoreWeight_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd_4"
  op: "BiasAdd"
  input: "Conv2D_4"
  input: "conv5/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape_4"
  op: "Shape"
  input: "Conv2D_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_4"
  op: "Reshape"
  input: "BiasAdd_4"
  input: "Shape_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm5"
  op: "LRN"
  input: "Reshape_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu_4"
  op: "Relu"
  input: "norm5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv6/index/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 34107
      }
    }
  }
}
node {
  name: "conv6/index/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv6/index/Initializer/zeros"
  op: "Fill"
  input: "conv6/index/Initializer/zeros/shape_as_tensor"
  input: "conv6/index/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "conv6/index"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 34107
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv6/index/Assign"
  op: "Assign"
  input: "conv6/index"
  input: "conv6/index/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv6/index/read"
  op: "Identity"
  input: "conv6/index"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\366\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1552301049232483
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1552301049232483
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv6/centers/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv6/centers/Initializer/random_uniform/max"
  input: "conv6/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv6/centers/Initializer/random_uniform/RandomUniform"
  input: "conv6/centers/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
}
node {
  name: "conv6/centers/Initializer/random_uniform"
  op: "Add"
  input: "conv6/centers/Initializer/random_uniform/mul"
  input: "conv6/centers/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
}
node {
  name: "conv6/centers"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv6/centers/Assign"
  op: "Assign"
  input: "conv6/centers"
  input: "conv6/centers/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv6/centers/read"
  op: "Identity"
  input: "conv6/centers"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
}
node {
  name: "conv6/shape/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv6/shape"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv6/shape/Assign"
  op: "Assign"
  input: "conv6/shape"
  input: "conv6/shape/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv6/shape/read"
  op: "Identity"
  input: "conv6/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
}
node {
  name: "conv6/freq/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "conv6/freq"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 246
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv6/freq/Assign"
  op: "Assign"
  input: "conv6/freq"
  input: "conv6/freq/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv6/freq/read"
  op: "Identity"
  input: "conv6/freq"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv6/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv6/biases/Initializer/random_uniform/max"
  input: "conv6/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv6/biases/Initializer/random_uniform/RandomUniform"
  input: "conv6/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
}
node {
  name: "conv6/biases/Initializer/random_uniform"
  op: "Add"
  input: "conv6/biases/Initializer/random_uniform/mul"
  input: "conv6/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
}
node {
  name: "conv6/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv6/biases/Assign"
  op: "Assign"
  input: "conv6/biases"
  input: "conv6/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv6/biases/read"
  op: "Identity"
  input: "conv6/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
}
node {
  name: "RestoreWeight_5"
  op: "RestoreWeight"
  input: "conv6/index/read"
  input: "conv6/centers/read"
  input: "conv6/shape/read"
  input: "conv6/freq/read"
}
node {
  name: "Conv2D_5"
  op: "Conv2D"
  input: "Relu_4"
  input: "RestoreWeight_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "BiasAdd_5"
  op: "BiasAdd"
  input: "Conv2D_5"
  input: "conv6/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Shape_5"
  op: "Shape"
  input: "Conv2D_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_5"
  op: "Reshape"
  input: "BiasAdd_5"
  input: "Shape_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "norm6"
  op: "LRN"
  input: "Reshape_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "alpha"
    value {
      f: 9.999999747378752e-05
    }
  }
  attr {
    key: "beta"
    value {
      f: 0.75
    }
  }
  attr {
    key: "bias"
    value {
      f: 1.0
    }
  }
  attr {
    key: "depth_radius"
    value {
      i: 2
    }
  }
}
node {
  name: "Relu_5"
  op: "Relu"
  input: "norm6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AvgPool"
  op: "AvgPool"
  input: "Relu_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 4
        i: 4
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 4
        i: 4
        i: 1
      }
    }
  }
}
node {
  name: "Reshape_6/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\000\002\000\000"
      }
    }
  }
}
node {
  name: "Reshape_6"
  op: "Reshape"
  input: "AvgPool"
  input: "Reshape_6/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\002\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10721125453710556
      }
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10721125453710556
      }
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fc7/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fc7/weights/Initializer/random_uniform/max"
  input: "fc7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fc7/weights/Initializer/random_uniform/RandomUniform"
  input: "fc7/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
}
node {
  name: "fc7/weights/Initializer/random_uniform"
  op: "Add"
  input: "fc7/weights/Initializer/random_uniform/mul"
  input: "fc7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
}
node {
  name: "fc7/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc7/weights/Assign"
  op: "Assign"
  input: "fc7/weights"
  input: "fc7/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc7/weights/read"
  op: "Identity"
  input: "fc7/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.547722578048706
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.547722578048706
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fc7/biases/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fc7/biases/Initializer/random_uniform/max"
  input: "fc7/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fc7/biases/Initializer/random_uniform/RandomUniform"
  input: "fc7/biases/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
}
node {
  name: "fc7/biases/Initializer/random_uniform"
  op: "Add"
  input: "fc7/biases/Initializer/random_uniform/mul"
  input: "fc7/biases/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
}
node {
  name: "fc7/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc7/biases/Assign"
  op: "Assign"
  input: "fc7/biases"
  input: "fc7/biases/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc7/biases/read"
  op: "Identity"
  input: "fc7/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
}
node {
  name: "fc7/fc7/MatMul"
  op: "MatMul"
  input: "Reshape_6"
  input: "fc7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc7/fc7"
  op: "BiasAdd"
  input: "fc7/fc7/MatMul"
  input: "fc7/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "Relu_6"
  op: "Relu"
  input: "fc7/fc7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "Relu_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^conv1/biases/Assign"
  input: "^conv1/centers/Assign"
  input: "^conv1/freq/Assign"
  input: "^conv1/index/Assign"
  input: "^conv1/shape/Assign"
  input: "^conv2/biases/Assign"
  input: "^conv2/centers/Assign"
  input: "^conv2/freq/Assign"
  input: "^conv2/index/Assign"
  input: "^conv2/shape/Assign"
  input: "^conv3/biases/Assign"
  input: "^conv3/centers/Assign"
  input: "^conv3/freq/Assign"
  input: "^conv3/index/Assign"
  input: "^conv3/shape/Assign"
  input: "^conv4/biases/Assign"
  input: "^conv4/centers/Assign"
  input: "^conv4/freq/Assign"
  input: "^conv4/index/Assign"
  input: "^conv4/shape/Assign"
  input: "^conv5/biases/Assign"
  input: "^conv5/centers/Assign"
  input: "^conv5/freq/Assign"
  input: "^conv5/index/Assign"
  input: "^conv5/shape/Assign"
  input: "^conv6/biases/Assign"
  input: "^conv6/centers/Assign"
  input: "^conv6/freq/Assign"
  input: "^conv6/index/Assign"
  input: "^conv6/shape/Assign"
  input: "^fc7/biases/Assign"
  input: "^fc7/weights/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 32
          }
        }
        string_val: "conv1/biases"
        string_val: "conv1/centers"
        string_val: "conv1/freq"
        string_val: "conv1/index"
        string_val: "conv1/shape"
        string_val: "conv2/biases"
        string_val: "conv2/centers"
        string_val: "conv2/freq"
        string_val: "conv2/index"
        string_val: "conv2/shape"
        string_val: "conv3/biases"
        string_val: "conv3/centers"
        string_val: "conv3/freq"
        string_val: "conv3/index"
        string_val: "conv3/shape"
        string_val: "conv4/biases"
        string_val: "conv4/centers"
        string_val: "conv4/freq"
        string_val: "conv4/index"
        string_val: "conv4/shape"
        string_val: "conv5/biases"
        string_val: "conv5/centers"
        string_val: "conv5/freq"
        string_val: "conv5/index"
        string_val: "conv5/shape"
        string_val: "conv6/biases"
        string_val: "conv6/centers"
        string_val: "conv6/freq"
        string_val: "conv6/index"
        string_val: "conv6/shape"
        string_val: "fc7/biases"
        string_val: "fc7/weights"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 32
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "conv1/biases"
  input: "conv1/centers"
  input: "conv1/freq"
  input: "conv1/index"
  input: "conv1/shape"
  input: "conv2/biases"
  input: "conv2/centers"
  input: "conv2/freq"
  input: "conv2/index"
  input: "conv2/shape"
  input: "conv3/biases"
  input: "conv3/centers"
  input: "conv3/freq"
  input: "conv3/index"
  input: "conv3/shape"
  input: "conv4/biases"
  input: "conv4/centers"
  input: "conv4/freq"
  input: "conv4/index"
  input: "conv4/shape"
  input: "conv5/biases"
  input: "conv5/centers"
  input: "conv5/freq"
  input: "conv5/index"
  input: "conv5/shape"
  input: "conv6/biases"
  input: "conv6/centers"
  input: "conv6/freq"
  input: "conv6/index"
  input: "conv6/shape"
  input: "fc7/biases"
  input: "fc7/weights"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 32
          }
        }
        string_val: "conv1/biases"
        string_val: "conv1/centers"
        string_val: "conv1/freq"
        string_val: "conv1/index"
        string_val: "conv1/shape"
        string_val: "conv2/biases"
        string_val: "conv2/centers"
        string_val: "conv2/freq"
        string_val: "conv2/index"
        string_val: "conv2/shape"
        string_val: "conv3/biases"
        string_val: "conv3/centers"
        string_val: "conv3/freq"
        string_val: "conv3/index"
        string_val: "conv3/shape"
        string_val: "conv4/biases"
        string_val: "conv4/centers"
        string_val: "conv4/freq"
        string_val: "conv4/index"
        string_val: "conv4/shape"
        string_val: "conv5/biases"
        string_val: "conv5/centers"
        string_val: "conv5/freq"
        string_val: "conv5/index"
        string_val: "conv5/shape"
        string_val: "conv6/biases"
        string_val: "conv6/centers"
        string_val: "conv6/freq"
        string_val: "conv6/index"
        string_val: "conv6/shape"
        string_val: "fc7/biases"
        string_val: "fc7/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 32
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
        type: DT_INT8
        type: DT_INT32
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "conv1/biases"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "conv1/centers"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "conv1/freq"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "conv1/index"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "conv1/shape"
  input: "save/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "conv2/biases"
  input: "save/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "conv2/centers"
  input: "save/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "conv2/freq"
  input: "save/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "conv2/index"
  input: "save/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "conv2/shape"
  input: "save/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "conv3/biases"
  input: "save/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "conv3/centers"
  input: "save/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "conv3/freq"
  input: "save/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "conv3/index"
  input: "save/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "conv3/shape"
  input: "save/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "conv4/biases"
  input: "save/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "conv4/centers"
  input: "save/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "conv4/freq"
  input: "save/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "conv4/index"
  input: "save/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "conv4/shape"
  input: "save/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "conv5/biases"
  input: "save/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "conv5/centers"
  input: "save/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "conv5/freq"
  input: "save/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "conv5/index"
  input: "save/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "conv5/shape"
  input: "save/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "conv6/biases"
  input: "save/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "conv6/centers"
  input: "save/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "conv6/freq"
  input: "save/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "conv6/index"
  input: "save/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "conv6/shape"
  input: "save/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "fc7/biases"
  input: "save/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "fc7/weights"
  input: "save/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_2"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_3"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
}
node {
  name: "Assign/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 77
          }
        }
        tensor_content: "\377\367\377\377\377\371\347\377\377\377\377\377\377\377\377\373\377\377\376\265\377\377\377\377\377\377\377\377\377\377;\367\375\317\375\377\371\377\377\377\377\377\377\377\377\377\377\3770\237\377\377\376\377\337\377\377\367\377~\277\377\377\377\377\377\317\317\347\377\317\377\377\237\370\177\200"
      }
    }
  }
}
node {
  name: "Assign"
  op: "Assign"
  input: "conv1/index"
  input: "Assign/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_1/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
        }
        tensor_content: "|\016s\2740\0211\274:\214\372\273\035h\207>\372\020\250=\212(%\276\225w\037\276e\030$>\222\026]>"
      }
    }
  }
}
node {
  name: "Assign_1"
  op: "Assign"
  input: "conv1/centers"
  input: "Assign_1/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_2/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_2"
  op: "Assign"
  input: "conv1/shape"
  input: "Assign_2/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_3/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: " \002\000\000\020\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_3"
  op: "Assign"
  input: "conv1/freq"
  input: "Assign_3/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_4/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        tensor_content: "\347R\355\274OO\214\274\306\212M\275\032\307\304=\027*J\276;\020\207\275\031%\223\275P\264\204=\202]\313\275C\356->\301q!\275-\003K>\246\256c\275\227\311\036>\311b\263\273\376\373?<P\206\r;Ob\335=\322\362\216=K\256w=\017\316\014\274fy\373=w\3470\273$\206\026=\353\2576>\343*\006\276\233\214\003=Q\010(=_\243\020=\254\226Q\276M\352P\276\333o\331=L\266\006\276\034\245\305=32\357=\317\257(\274s\033&=\306|\023\276\246\227\274=\310\261\004\276\217\016+>:\0234=\250\014\212\275\2316\364\275d{\374\275\246\260,=\032[V\276vg\234=\225b\265\275!u\372=\255\201\037>^\372B\276\220\367\273=Mc0\275Y\311#\275\3531 =\340\037\273\274U\311\245=\250\263\340\275\256\305\323=\374\234f\276}\255\020>\"%x\276E\343\002\276"
      }
    }
  }
}
node {
  name: "Assign_4"
  op: "Assign"
  input: "conv1/biases"
  input: "Assign_4/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_5/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 5027
          }
        }
        tensor_content: "\306\241\247]\357:\363\372\030\273I\367\003\274\354\177,[{\341\214\005?\306\277\306\267\321\306\033Fx6\316\347L\020\3147\337\367\351\367\241\272o]\356\224O\316\257\335O\3442\362~\357\371\215\000\357A\373Jvy\337\273\377\252\005\325\335/\363\002h\3257\267\366\3404\333\177\364\007\355Y\331yW\005\"\000\364\267@\2672\333\342Y\026\372\032f\373~l]E1\276\364/\340:\014\227y\023\"\371\035)\353s>\351\277\242\307\266\220\223\362\213\206\030?\035\0277WS\037\225\207X\214\307\237\235<\345\321[\035\273bS\027\257\357x6\352B\242P4t.\017w\275S\352\310_\025\020\247e\324\276\034\345\356\363\240_%\313\234\027\355\347:oM\177\031\270\334\256\022\340bp\030\235\367\037\276\362\037\345\367\362\300\267u\320\302\267\014\3401E\233\247\345\2069\202\371\316\367\234\245\026c\002\326\246\363\217\017\332\025\373\335:,.\366\266$\353\215\261\316\367q\315\246\326\254\302\231\314\237.\302\224\255\263wU\332S>K\272\031\376=\212a\216\033$Z\354\246\002\376\037|\231+\3758s\235\350\270,\252\317\275\270Bv\017G\230}\216\371\336\343\326\3465\035\017\337\311\345g\351\375tm\377\236_u\253w/\032\177\347\356;\371}<\346\013\375\354\300\356\021\327\353\327Qx!\200O\0322\337\274~P\007\301\232\030\357w\224\330X\037\272\023\351`\320\r.\301\345\003\023B\301\330\3504;\265\367[\006\200\003J\000\320\267A\241}\361u\006\330\323v\303\367|\366\256\356\300\273\027\241b\315P\0326\333\335\345\350u\337}\264\000v\301\267\013\323\275ZI\215\246\314\177\224\322\021\377\275\373\2161>\333u\273\276\325\373\240:\351\275\027\301\340\303\0064\234\337\374To\250\'\304\257\370\006\035tj\233\264E\212\306\254\254\341WC\005\264,\273\370\2544\026\017~\374\001\351\257-\245\315\260h4|a\266{C\354l\033\364\210g\231\341\246q\361\257\024w}\366\353\2138\024\000\337x\373\325\346]K4\001\034\372w\264\245\353:R\353r\356\265&\342\223tZ\275l\n\231\323\351J\030\241VU\223f\344z\267+\327\003\022RR\314\351O\302giJ;_5X\361w\312M\232\347;5BJ\\\202\335G\\\025\353\327\332\305\006?\361\232\225\"\257G(VH\022\031\230\223\244\336a7\030\244\203\233\212\325\244\244\246\261\214o5\362\026\245q\220\313\200\375{m\200\013\375O\317Y@\rSf\263\030\006\254X\216\336\306\207\371\272\205\350\007\203\302\237\023M\013k\236n\213^\322\343\275X0\3606\321h\273D\266\357K\027~\203\331\304\351\314\r\334\274\352\270R]\355\017]\2215>XX.\263\035\375\370\346\360\317\3033#\335A\251\232\236\332\335\222\307*\003\224\355\351\216k\021\377\031\330LB\022\224}\271\207^\265\317\315\335\3079\234Y*\330\007\025/\006M\223\t\370w\035\003\377\306\254\232\204G\302\006\315\233\273hG\307\207\"B\356G`4\215\207\353Z=\026~g\367\341\030\275\372\\AC\205\354Q\006\003[\350\372\212\033\373\336\367B{\233\243\3767u\013\3172\037qK\267\370\250\037\340I\230\006\350s\270\013q\207\031\223\363\236_\373K\320%\342\266p\313\377\237\203\343\n\347\223\367\275?_\277\353\303p]\331\323\261\024S\360=a\'\316\202w(\366\006\013\306;\377\r\226\345\216s\247i\272\372\024O\336\370\357i\320\\\355`\343E@\335\300\276\235\0060Y\260\000\032\013(\320,\005\332\365\343K\333X\032\034\3560q\253]J\234\036\005\355\227\333+\370o\300X\275\001\230\232\001\326\000\302\212\310\226\353r\031\026M\377-\342\263\274\273\241U\235L\360\306\030\300\313BS\027-\343\002\331f<\354\247#1\237\347\216\343\177\322Yww\347\305\356li\323\323 \210\237\211t\371\361|\335\025\241\371in2C\r\375a\275\014\306\215I6W\330\326X\233\336\223\331x\233\326\206}\231\253\336\\|\256/\347d\003\030\200.bx\334&2\030\260v\273\362\347\226\267_0\377\367E\375\377\363\024\302\256\253\276\357\377\345\033\376\334U_\354>\030s\034\354t\230\376\273\007\257la\365\376I\331\263\363\362\035\307UvY\033\211\207c\370<\253\324w\t_\377\235V\275\227\276\307\310$&iH\2273L\322\2018\210\344\371\341\3421\261\037w\275\343\354\347;^\276sO\375\3570\241\272\244?\314b\2479\207\342\223\\v\223\003\230\351\370\237\030\255\2167\237\347g\252\360\377\323\177\212I\276\031r\212\256\377{\202\232\3260Q\216=\271\345\347X^\353\203\235Q\037\202\323\307\3521)\310WU9\3267/\232\342\220\303O\271lr\257O3B~C\177\352\275\204|\307\222\352\275\367#;/p\177\343\271k_\267\352\355\371\331u\276O)\350}U\263>\177\353}\321?eGYE5\377\311Y\353\343\033\336\246F|\271\323\035\357\271\005\247J\324\216\347\363\271\n\254\377\274~C\263\362\000\2070\340\357?.Q\223\345\221\267\324\301\371d\361Z\3017\334\346\t:S\030?n\224\233\276u/8\356\364c\007\020\375\335\371\234\374\366e\250\245$\351\316\363\021\214\014|vm\024\243\222y\205\326\234\263:\332h\233\276\273\344\315\221\305\215\373uJ\034P\036QZ\\\216|?.U\361\301E\334\214\365qr\253\367\343\0257\322\351\037\241\300\351\303\217\370e\345\350?:\367\336|\323\215\007\354&(\366\022\357\225\356Fg\362Iz\216]r\266\336\177\003\275~\376\347TW1~C\030\331-\314+\225\"+\317\003-%1{\354K\006s\203>Fb\254\3179\226e\215\034\333\034PIwE(\013n\205r\354\343@\t\267\240\030\036\375\177\200i\272\332\207A\277\247\005O\033c\332\265<,\262\374\035\014\373\270X\322\317&\330X\001k\026\332\217X\035\315\230\333\t\373\303\270_86\342\357ByF\333\321\0345\316\221\0210\374\364\264]\353\256q\201\245\367\202\331Rn\033\020\303w\255\361\334\373\'\321&\237\216\323;\351\217\370\'\236z{\315\343\301?{z\035\357\317\211\343\345qf\361\020h\032\027f\370z\332\375S\355\240\001\206\274\035`x\337\001o\216\203\200\327\252\026R\201\205S_\037\211\033\006e\200c\002\354\004\337\031\207\3155\216\364\247q\332hG\017s/\367\030\223o\355*\233\365L\237\3452mX\263\313\222\317\245i,Q\246EN\327\331.o\323\265\213[%\365\352cq\377\264\316\251>M\332\331,\371[\335j\267\347\2371Z\351\313\222oj\325T\256+]2\377y\277V\214\316z\275:\3272z\242\261\375\224?\252\316\247\2748S\262Y[\234\243\331\327\257\211$\236\030\372\014\212Rcm\007\213\377\005#\255\232\036;v\211k421\247\322+\001\034\346\257\377\315\353V\243\r\331\251;R\333C\361\246\344\364\3750\315\344s}\000^\217\317\233L\303Y\323z\000%\344\241\035)\330\234\263\244\016\240\315\216\224.\277#\271wvn\357\201\274\260];\236a\312w\265~\222\006}/k\335\274~\356\354\325z\357$2\275y\227>f\216\177\\d\244\244\275\034V\322#%\214\266s\027~N\227.H\017\224\373=n\037\034\327\234\313\\\250\007\347O\242\367u\376\213KK\335\023q0\264\257\330O=\375\353\237\323\234[\230w\256\364\330\000=\200\206x\377\033\272\337n\230I\3262\343\014=\020\316\000R\177\362?\336\217\202\013;\343\276\3571\276qz\177;;\177\330\001\212\375\343\335\337\312\035\257\373\277\376\007\021\023\031\n\273\274B\341\376\375B\020\2045g\034\021\2142\301\2763C.\353\350\243~\005\202;\257\374\254\033\363w\377/\310|\271G\220\335\370\373\377w}\002\237\361\204G\377\315\037\347\337\256V9}\236\213\177\300!\035\273\214\022\262\257\313\2278\321\354\335\367\357\003\316s\267`=\2427\276\032\260S\301\340\271\253\r\037vm*Ya\010V\007E\200[\327\250\226\241\353\367\2157\300\361\037~~iA\256\205\335\337\213\275\335\265\255\022\366j\3600M\025\\\351\305\364\330\324=\030w\374o\034\263\216`\303y7\224JS#\376\367u\227\001\355\247\336\\\'\357\307\352o7rd\276\273\371&\014+\256\336S\003\2409\237\247\317<\236Y\027\347\226r\216SL\371F\315b\251\341\322\3672|\365.\377e\241\3559\271kEn\262\277\223\037\255\3569\335\007zYgk\225$\347>\027\272h\204\275\307\373\335\304\007\376\347\261?\275+Vb\030\266\311~\177\343\270\206\264\353sf\247yAM\325\214\350\034\357\'\307\273\317\274\247\362|?\315\027\217\240\353\337\345)\237\034\335y\371\204+\332\314\300\347\357\210\327F\236<\020\207\354$c\035\017Z\356\037\371\373|\033\237\332\037+\360\265\257n\036\207\375\313k\336\204\214[\377\373\276\356\003?\203\341\017\375\367\264\257\014\260s\373\357\333\236\377%\360H\272\271\037j\233\260\214\031Q\336>7\272~\336c\305\251\376\303\203<\336\337\330\224\026\016\262\377/\270t\276\306\376\034\347\343\331\366\001K\312\310w\265\361\270\225\253&\034\214\373\236\317w\023\247\302\034\342\206?\n\3223=\213_\345\277b\333\374\355\032\220\325A\031}\2111\377t\027\323\367\226\345\260H\246:\237\214\206\271x#\316\211u\353\n\274\353\032\306\377\347\227\352\315\355{7u\312\nC\376\027Suw\361\370\363\234\370\177\273yt\366\345\310\252\373c\235S\361\237e*K\236_\233\032\225\006\310\356w\023:\227\227}I\377\310.U\233\223\032\241\314v\222\227,do\313\031\216\270\335\251\322\236\373\343\372\316V=\374\213?\310\263\342;\343\232\314Wfl\257-:\253\337\370\240g\330\341\016\256~\370\252\325|\221\3062\335\264\354\372\237\362\244n\031A1\272\375\376ca\374\246\374\014${)\377g\017\201\3446\027\223\364\353wU\023\317\255\317\r\334\352\222\265l\353\324\311V\277\357c\377+\214B\314 \3653\204\265\374\2543\370\2463\371~\022\222\253m\007d\351\303k;\277J\333\373\371\215\334^\351fM\336\361e\025\372\316e\257\235\027\272\003X\332<\342\033\365J\375\217+mNg\r\033%\222\377b\265j\354Wl\2022:\260b\266\276\234\255Z\344\2621p>\014;J[\377\363\351_\234PQh\377\323\275\304\334\344\036G3\277\371\317\263NkV\306\365\303];\332\250\263\035\246\304g~\037\367\371\267\364h\266\306\031\014\237\373U\234e\370~\307!\354%)\336\273\313!\006\234\021\375\333\357xp?\000]\276\001C\214So\200?\034\344\256C^\036\320\\b\030\244{U\235\037\323=\321D\357\267tS\025\253}_\345jb\223sa\326\363\035\\\014\007\035Q\264\253\3714\305~\r\001\375\335\327&Z\t\214\236\275I\212\202\273\340\233nct\300\301\314\233\025L=Z\266>lg\245L\233&\r\311\356P\243\227\237R\376b\366\2639\225\200a\215uEm\371\262uG\346\306\'sF\222\013a\220\312\344{\377\225:\214\341-\017Z\373\310\333\270\354\254\276h\301\036S,\207\204\363\273^\373\335n\271+\227\0223\312u\035\221\2319\036O\211\357\371\331\220\275\270\261\324\256\326\352\276\220rNC\326\263\247\314\\\347\345\265\220.\267{\3048S8l\276b\231\312\360\363I[\345%j\355\372\251\215\312\321\247e7\205\314\365\231y{\220\033\013\330\372GXO\336\306\277p\271Y\325n\237\310\2371:ZW\234\376\262\024\355NBW\235\333\355^>|K\227p\257^\373uo\316d\244C\366x9\007f\023\205o\276\262.\363w\177\023\355\330\306\353\220\263\360\310s\217\371Zs\325\314G\223\324\370\231\373\271\004\232~_\302\034\300\376\206J\247\260\326\007\202\307\201\320\021X{I\253]\300\367\355\233M}\004l\360n\254\273\331\245\236\003|\250T\nx\374\300[\304>z\007\254x\032\266\351\343~\200\033oQNu\244\234\332S\372\257\346\343n\346\354\332\003\025\270\034W\257B\200\356uJS\275\333]\300\0336n\3369R\244H\322\231\335\335DT\243Y-\265&\234\350\315\270\323\313w\2659Q\265\250\017\352\316#P\024\\\3132\310\013g\337\006)J$\256A\3109\243\367\002^\330\350o\354\007\251o4\"\024b\315-\353\261\037\002\233\276\330P{\321.-3?m\273\255:\3235\204\337C\3005\341}\325>\351\347\214Oqh\375\377\260j\303i\353\365RO\272\177\207A\316\307W\277an\224\026\320kl\326=\260\377\032C_\377\236\305\260\031\334}\257\313k\013\324\214c\272px\375\370\352n\275\257\n\341-\177\025A\343!z\301t`\207\375\376\365\216p^\374}\255\276\366\224\203w\307\374Gy\237\225u\\^\024y\367\210T\346\203\360Y\216`\024\r\377\343\\\203\254\243wGq\252*Ww\031q\227\357&Q\207\375i\r\267^1\027\322\255\370/\230e\376\353\266\017O\311L\207\2373\375\262,8\370~)PP\213\264\310\3461\231^\352\024{\234\3039j\210c\374C*\357\t\374\333\177\347\343\2478_{\217\273\274c{\337\203\341\254u~\016\227#WA\336\367\223\251Ow\270\357\215\033\204,\357Lq\273\221U\356\0351\376I\361\367\201d\363\272\266mo\362\361\215\323\215\320:\335\377\033\342\236u\216\005O;\272o\355\357\034\343\216T\300S\213\340F\330\375\260S%%\312\246{\237\321\260\037\017\341\332R\354)j\240\025\253u{\276\347u\261\030\307|\212\220\203\254\316\003\034\223\355\005\343\035\266\\w\231\372G%,j\'{\324\271wC\210\367\235y\364\314\2236\266\027\216g\274d\224\222\255\027\327\353\270\316l\227&\266\264\353H\361\206\321\272\346ey\003.B\2667\251v\3747\n\263y!\034\345J\352\246\230\331\010\253J\367\314\351\222\311\235k\271\3567\265\330\300\2336\306{\205X\265y\235\231\312\322siFy>6\363\242\276}\355\021\337\222\272\362\007\233\2351O\255\373Z\275Y\222\231\313\346G7\223\237\241!9\013]\252\245[d\006=\332t\252\237\211\246nY\333\336O\253\362\277\344<\261\351\367\037\215\305\377\360/y\215\366/I=\233\003v\364\354<\302\020nW\255|C\031\361\344\035\364\030\356\2075\006S\230\203\177\3451\333[\333\250\014b\235\347\177\250\300\033\330l\321\316\006C\003\235\213\227\211\371\236G\357\367s\272\374r\274\374\267\014\262\035q]B\241\362\022\231*\220\227#\037\335\335\335~\375|\343\377\352\327w.\356\362U\252\320\271\347\2562Y,\250\347{\2261\201\031\216\234~\325\304y\213\230\375A\332R\343\034L\334O\355\225\237\234\377\371\013\313\016\361\316\306\274g\343\"\310\262z\3653u\377\375\2713F\32584\002\333\033\000\000\021\361\240\177\375\355\345\377\034#\377\376\337\362\240}\254P\300\365\236s\336\017\rD\006vtb\3619a\216r\020\363\357\243V\021\007)\336\260\365(\265\267\226\017\204M\001\367~\337\233\307\0204\265\241\277\020.\352s\202\007\224\214?\377G\277\\\030\321\020\026\000S^\366\204\007\205\331\253\347\006\330\325\243pm\252\r\027E\305\360\330}\206\333W\247\255\256\000\321z\321n\336\200Pp4Y\340x/\233\353\024\000_\001@[i`\000Y\240\320\320\240\013\002\306\200<ST\024\265\337\033\325\201\245\001\353\003om\255\006\200\322\346\331\306\2004\032h\000\0244m\223@0\005\236\320\000\232\345\335\001P\000FhP\000\027A\252\036\240\001a\241\002\3206 4\013\000\000QM\365\331\240\333\003\024iEF\275\022\201\241\377\345\350\024/A\302/\336\001\213v\300\320\024\250\000\2750\032\000z\332^\213E\007\266\363<\347<\262h\326\303\300\311\\-\255\360\024\005\275x\330\333\356\021\007\270\260Q\246\205\330\360\367\335\003Z\260\032\006\231-\200\013R\366\302\321\365\263D>YF\2128|ez\347\034\3566\261\317\341\257\022\327\214\276\337\t\333\273\362\363\355E\037\266\357`\234\375\303\223\366\345\376O\360\3561\270\222\027OV\277\2518\317\036\345T\3569;\225\266\327_\254\360\365lF[\257\252\355\325[\273\336\303wAQ\245\335c\230\306\343D\242+\201\343\347\226\336\223\002r\023\031\356\374\214 T\276\327\007\366~g\340>*b\275I@\242\3027\277\017;\2067\363\347+\245\3149\222\333\273\323`4\345|\350\311eMQh{\274c\036\223\177\347\014\354~_\201\014\254\327\237A^\272\357\316\316\313\227\326\370\004\247LX\307\002~d\345\367]\245\'|\364\371K\312_\271\332vT\364\237\360\'\'\346EV\270?\267\227\372\027\331M\334\266w\275\305[d?\237\304\223\263\363N\322\253Y\374\036\254\302d\177!\035;\331\337\"\344\242E\304\367\362f8\231\277\"\224c\035\177\361\334\370\302\230\010\303\230\364\260\303\351\313\341\014\004\377&&|\243\016o\006\376\274\270\374\347\305\336\274\237\252 \'\031r\004\246\357\317?K\250\217\350O\206\'\237\275\345\367\030\177\305[\016\031c\263\325g\236s~D\022\225V_\363\3648\030\235v\350\177\243\260\2758\352GHe\021\237\034\2061\273\254y\330\377\253\252p\017\005\326\332O\276\337\346,G\245\373\234R\246u\326\350\233D{\021\371\327\014mit\374\331\221g\221\3259W\353\277\363r\370\245\326\323\221\273\316\245\372\025\222\006\n\234`\247\023\'\223K\034\337\310\321\301[iS\232<\253\362\002\305\007\002\345\313\334\353\010\347\365\235\341w\344\205\271\200\0324q\252!\t\021\367\243\336\353\343\222\017\027\'\033\275\207\177\003.\345\277\217\307\377\377t\365R\241\361r\305M\216\177\231\271\362K\366[s\341S\033{~\336K\373\342\346\337\263\277p~\217=\242\227\277\351\260Z]\337\221\003\216|f\005o5`\313\222\227\334\374\316\305\313\031\274\020\306\337\306Ye$\264\316\031\303\1770\335\366\307?\371\217\313k\374\324\317r\371vi\223\364\213\363\214\277\375\330\325\366\233\357\247\347\247\216}\031\301\277[k\3366\334~\312\374\267W\313[\251\342\267\373\177\252.\014r?\001\1770a\317\003\227\374o;\357c\245\335\257\235\364=\366\033\035\237\355\01065{\3042\217\377^\270~C}\372\327\177K\204\253\375\276^\357\316y\010\177ZY\242|jW\326\231\243\354\276M\374\267\2409g=\036\177a\353\002&\001N< "
      }
    }
  }
}
node {
  name: "Assign_5"
  op: "Assign"
  input: "conv2/index"
  input: "Assign_5/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_6/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 62
          }
          dim {
            size: 3
          }
        }
        tensor_content: "\347\264\016\274\306u\244\273\332N\325\2721\224\226\2764\034\247\276\263\\\247\276\305L\324=PT\001\276\206>\307\276Y\312\255\276\234\016\354\275\010wV>\242pu>O\202J>\244\001x>\262U\023>e\351\236\276MG\307\274\227LQ>\335\310\203>\276}\237\275\246\203\236\276ny\364\273\335`\216\276\264\034p\276{\300\323\276\206g\274\274\37515\275.eO\276\266xo>\335\333\222\276qy\014>\200\230-=\372\374\257>\030\205\253<)\234\213\272\203\"\213\275c\270T\276O`7\276\020tq>r\021\230=\rW\211\276\274Ro\275Q\343\201>\351]\236=7\351\263\275\304\315\364=\036\241\206\276:\272\215\276\215\230\016\276oKd\275\020\t\272\275a\223!=\3533g>\313\234/>\0207\317\275bJ\354\275\004\232x\275\213\227\223\276[\347\024=\224\246M>\206\223.\275.6\022>$\306\343=SK\035>\373\265\262=\036Q\036\276E_\353\274~_!\276yE$\276|\023-\276\251\231\257\276\250);\276\252\335\335\274Jw\205=/\252\030=\337P\202\274c\313^\276\3374\030>\305`\250=\253G\326\275\273\353\337\275\006\277\007>Izw\275Y.\271=\357{\037\276\360nC=\'GY\276d>\220\2762\304\r\276\346e\241=\235(\220\276\027^\252\276\254E\260\276\224\263O\276\355\222i\276\"\004\336\275\277\202\014\276\345\020 \275\016W<=\372=~>D\027\304\275\214\321F\275p\020\251\275OX\374=\020\347\007\276\312W\371=:\213\321=[\247\010>Km\230>\032\016\341=Yk\207=\374\020$\276wxg\276\036\271g\276\344\247\203\276%vt<)\022\361<\213\251!=\201w\017>j\0221\276?(!\276\257=<>\340\250\320<\301\022\363\275,g\266\275\032\321\243\275\372f\233\275;\020\211\276\302^\214=\2551\t>\016\336S\276Q\"\r>\264O\213;\274\371\n<\354\212\001=,\346\005>a\036\232\274\271[\202\276\312Ig\274\327\200>>=\333x>\2329%>\202\224\212=\t\312@\274\203\313k=\206\253\363\275\252\217Z\276\200\332\010\276k\322i\276\032\237\233\276\305\324\014\276\361!\270=,\246\205\275\237\276\200\276\032\370\263\276\302\2526>\340\313m\275^\253\240\276\267\3123\276\334%\340<\223\017@\275\013\221\263=\246\362{\276\241\240\005>?(\224=\335\004\224\275\021O)>\341\224:>8uP\273\327\204?\276\224\320\312\275V\035\220\276\355\356\240\275!|\367<\260\007.>\232\3073>\177\251)\276\320\337\210\2764\217~\276\361\2519>\026\001\331=\352\1770>\216\253\371=\212\314\257\276\362\360\013\276"
      }
    }
  }
}
node {
  name: "Assign_6"
  op: "Assign"
  input: "conv2/centers"
  input: "Assign_6/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_7/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_7"
  op: "Assign"
  input: "conv2/shape"
  input: "Assign_7/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_8/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 62
          }
        }
        tensor_content: "\205\025\000\000\002\000\000\000\002\000\000\000\002\000\000\000\002\000\000\000\003\000\000\000\001\000\000\000\003\000\000\000\001\000\000\000\003\000\000\000\n\000\000\000\002\000\000\000z\000\000\000\003\000\000\000\003\000\000\000\002\000\000\000)\000\000\000\027\000\000\000#\000\000\000\016\000\000\000\003\000\000\000\256\000\000\000\021\001\000\000\004\000\000\000\361\000\000\000M\000\000\000b\000\000\000^\000\000\000V\000\000\000\033\000\000\000\001\000\000\000\006\000\000\000,\004\000\000\002\000\000\000v\001\000\000i\000\000\000\006\000\000\000\035\000\000\000\r\000\000\000\020\002\000\000\014\000\000\000\331\003\000\000\"\000\000\000\004\000\000\000\323\001\000\000\355\001\000\000\007\000\000\000\n\000\000\000+\003\000\000\'\000\000\000\007\000\000\000\001\000\000\000\002\000\000\000\027\001\000\000\004\000\000\000$\000\000\000\016\000\000\000\017\000\000\000&\000\000\000\r\000\000\000\030\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_8"
  op: "Assign"
  input: "conv2/freq"
  input: "Assign_8/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_9/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        tensor_content: ">\323<>\207\317\237=23A\2766\313\007\276/]0=2H4<?\216&\276\377E\014\275\364\265\013=bl\273\275Jh\274=\2353\036\276\354\267\020\276}\261`\276\276\255\345=\013D\033\275!\244\212\275n\317 \275\'\267\274=8v\004>\240\267-\276\323\246\010\276\362_L\276g\330\346<\231nn\276\304\353M>\223D\023>\022\025\005\276\257\320\016\276\021s\">V1\016=P\376r\276r \254<d<\025\273\261\037C>\r\232\034\275V\300\224\274\2205\211\275\273\037\314=>.\020>\244\023\'=\2456=>K\255M\276\312\275j\276\200\341#>\034\270(\275\356\315\265\275\377\215\">x\367Y>\223 \276<\336\034\326\274rv\355=\344\265S\276B\270k\276\335 \037\2765\324\002\275g\345!\276\371l\316=\273\306\207=\245p\307\275E0\375=\340\254Z\276\016d\"\276\240\356\340="
      }
    }
  }
}
node {
  name: "Assign_9"
  op: "Assign"
  input: "conv2/biases"
  input: "Assign_9/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_10/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 13339
          }
        }
        tensor_content: "cjd3\314\344\303C\231\244\205\346\337\311\023\341\256Ap\332\273k\247\253O\215\253\343\2162X\347\337,}\270\325$tX\371\3667\016\244\257\377\326\346\2002ZX\347<\263\370X\020\377\372\363\244zJ\327\377\236u\274V<\375><-\326\330\346\274\003En\251\254C\241\026\214iY\327f\325\307\032\375:2\252YmyS\350\326^\257W\254\205QUZ>>&\022\366\206\375{+\311j\263/\177\027{\257\326\3159z\332\265Q\2047i<\250\376\235<{?7\000\2254\037\006\261\306\226\236\030\237\226\241\257\235\274\354T\314\262\374\027\255\361\320\364h\376\237\272\301\025\037\310\314\347\307\177\016r}\376\036\304\227\271ue\302UQeC3h\374\237Q\353\213\272?u\024\250\251\321\273V\346;\364G\304\207X*\252O\265I^\222\263tU\371\227\210C\234S\354\373\267\367\337TPC\034Q\206\032\310G\367]r\212\250\035\374u\362\350\362\253A\332\372\347\026\356\305\276\3777\257\236.\252\261\327d\302y6\313\361\360n\037Q\036\255\205\337\251\366\373-U&\016P\236Q\320\274\231\336\3624\337#\356\n\313\257\007|d\341(\340\002\327\251\007\007i\360\276\236>&\'\333\354\351G\217\237\325\337\372/\307k\347<\255ov^\177\337\227\333\376\353*\350K?\222\202\252\265\377\306J\204^l\377\006v\325\353\251\233\\\273Ut\333\343\362\254O\354\211\017M\357\240{\351]/\376\34531\237\341bWeRPa\225\357\334\344\324>\034R\002FQ\257\021\363\347\376\257\003\224\235\373L\003\346~\275\2426\344\030VX\202P\000\337\202\362\254X\377DG\317\262\317\037\035\2613\332\242%\341\326\2568\035;\245\351qkBRg\333\355\347\372=+\260\267\376v%\357\250g\245\375\275\364>\3367\377\377\245\344\271\206\017-\374\022qA\334\371\n\272\257g}BU~\372}\270\n\366)\252\262\262\264$\372t\267\305\370\2779\373\364qc\'\345+\254\001gb\036\273\210{\271L\254X\261\324eV\037k\251\024gE\333\257\003\035\337\377\233gd%B\177\226\204Fwq\274}\013\277\261H\370R\nH\256\353#\265L\363\331\267\237\225Q\235\274\246\317\250\377{&\364+\323D\335.\212Y\247\215\217\t\314U,\254\244\212\225\026Vx/]]\360\227\323\352P\t\253\270UM\371\337\312\2737\233\302\022\252\375\337\304\373\317\323%\251\375\226\253C\367Rh7.~\266\327\317\366\357\214\257[\377e\245t\257\330\223{\3322{_cH\020\251\003\017\355\371\247`D\302\001\262A_\231\371\345\241\246+g\002\255B\304\256\303\366$\377J\375\217}\366;\325~qgo\352\022\350\006\n\316\3655\t\001]\024\356\325xN\336 \212N\350\356e\0305L\226a\0023\030#\352\217\343\343\312\240\325\350\024\242\214\342\223\232FJ60\212\354qG\335_\nq\327t\334\324u\036\221q:\354\034;\014\000\367\300\367\230\277\353\357\346?\345<\255}\217\033Pj\251\024P\027V\322(\343|\377\020\003\327\\y\321\2440\270\213\240J.\2666 \343\373\353\323\223\2164DP-\321\315j\253m\333|L\253E\201\tM\360\300I\230\242\215o)@\n\177\343fs\375\274\361\365}\324\321\343w\016\006\370\232YgK\025sa\337`\222\250>T\006\250\232\306i\273\323\377\355\215y\242\246\272\357\267}\273b\265c\260R\013\221\254\276><\367\273[\246\206\227\323\025C\374AEp\221\270\247\336\332\236s\242\003-\373su\201\217\357\334\372)\236\366\255\236$L\327\006\356\341L\371\276\213\332C\336\351\274\031\336u\350\347\264&\210\033\342|v\007\273Rwms\252.\362^\312B^\315(q{\355mI\037\177W\240Om\226\263\237\275\217\307\311\345\335\362}G\333\364\337\337\227\345^\277\256h\350\223\353\367t\020?&C\024\226{}7\241\314\254\260`\344h?\224|\217\307\301\266\242)\303\223\226.e\203\365\323k\\\246D\312\033ll\021TX\255\367}\375\306\264|\254\255|\272#>\234\342S\226\356\245\273\305\242\276\254\371\024\327\210\035s\223\211G\031\272\310\306\233\311MV\210\242Y\221\315\330g\033\246\237k\221AYdQ\357d\373\330\370J(~\333\037\203\235\244Qo\217\217\273\010\257\327\310\365\002\265UcU\326\007\233ZF>\005\325\226\362uO\231r9\005F\342\322B\331\302=\211\371\320\314\247\203\324\225\'Y\215o\241\271|\236\001V\323w\276y\226g4\216z\217\337\273\304S\006\233\243\277\314\253\354\263\363\230\n\255\276\201\243\022d\263\230\370o\334\362Cn\001E\234\"g]\325\253z\262\212\263#\373\370\372oW\333/pjmNl\277\252,\242\200\227Y\023\226\223ou>\177\303\r#v\334N\332\317\037\361\274\365\2754\003\3076*]pj\350\241\305LD\007\275\307\nQ\315\037{\221\377\262?TQS\312\277\372\376[\207`\314\221\342g^\317\273\344L\332)g\312\311{\033\213&\324\231\366\210\337/[\373e\367\361$1]\217\366Z\274\231\027\354\377\301\373\363\370\370Su\235>\346\034\256\354$\211m\273\353\357\036\224\273?\376\361\236\007\204%\226\303\2533\265&B\001Us\206\305\225-\r\343\260\327\375\335Y\365\223JGk\215\254\210\2130\004\347\335\212$O\032\033\035o\370\357\313\005\023%66:-\243\306~\3506\272w\3557\177x\373\343\323\322j,rK\271 \3476\316\3745\273\256]=Zg\253\241\033\007(\341\252\231Km^#\376\254\222\036\246\356M\313w\034\327\273\352\364\352\311\t\026_\231\370\332{\365\205\001\030\336\206\365_\037I\274x\247\300o\363}?\314{h\204H\250\tx\r\225\342\367\345\001j\037\316_\247\256\333\210vD\243\256\027[-\250}o\255\344|\333\342{7\310,p\307\273\353\210\314\342\017\277\266\211\023\275\367\325\025\357;\346\200\342\265\320\225d\005\032i\337\366\243\277\322\247,\233c}Y\274!\332\352\024;\365[R`\n\237\343\252\301\372f\022\0279h\206\31285\013\351\325\017\276\252u\263\265\"y\264By\215\227=\226\372T\243k}\337\330\225]\337\373\277t5o\362\313\230`\242nE\365\277\335fW[\312V\262\262\211\013{\033Ig\177\2725\217\257\377x\220\201\366\\\251\017gY\376\177\341I\373\377r}?\337}\331\241\342\177\350\315]Wv\355UUu0\300\3240\360\342\005*d\345\2534X3gpa\260\231a\323P]]aG\325&VD\355\326Q\340\325\030w\033w\274\227S\2500\246$]\303\030\327;\234\330\371\r\035\325\207U`]Z-T.t\254P$T\336\357\271\227\277\264\243^\215\000\021\\\023\253\034^\207\244\205q+X\216;\243\276\376;x}~\'\026>\367\337k\362\267\241\226\361\352e\223\335\336M\r>x\376\021U#+Fr\371\276O\036\002FO\331p\347\210k9\275\3562\210\225,6\225Wn\213\337}\337@\004\031\325\225\025\331G\223\267\032\307\364\256\374\351\221\375\317-\360\202\201/\223\272rOR\007\201\n%\320N\301R\325\247g\362\272\377G\265\346\324S\347\t~\304\346\316O\202\370\0253U\342Kv7l\311\252\260~7\367\353\356*\346C}\375\244\232\314$Y\354<\341SQ\237\357P\007\205%\266\347y\272Y\246_\373?\355u\274m\215\231\002\253\212\260\352\234x\025\265l\332\306\331\265\341e\302\001|\344\221n\023\235\362)\361rWg\271q\017\323\364\245A\355\236\325\204\023:\242\373e\306\017\341Yc\333\277\263\001n5\232<\240\004\356\236~^\357P\327\231|b\364\244\271MPC\330]?\241o\237K\367\350\001\016\216\017\037\322\312\307N\345\250\033\221_+\305\366\357\322\366:\275(a\037\341\241\226De\031m\205\334\275Y\367\367#L2\022W\364E{\320\252/C\202H\360\263>\213\332>\352\377\366\317\375Y\336 \014\034d\027\362\217\336\375\r\376eGe\301\335\222\017\177\322<\023< \260\373\364\032j\323\260\326y\356j\247\213\354\216sB\377\255\341\247\032\211\004)\340\317\377[\234\3221\246=\027/K\326\336\266\326\r\006\2140\354\214@^\357\357\240\246fNUw\351\261\363\256;\244\267G\313=\326\217\347n\353\277|\254\365\350\352\313\233\346j\242\355\\\211\366\333\336\033\343l\372\230me#\213\257\273*bH\321\361\367\360\245\004Y\256\231\347\226\256e\306\330\346\272\266\311\266\334k_\233\367\260W\343\331\346\375Rd@\0212\212L[\034\264\277\366ZU\366\233\014\325\335U\0251\303\261\365\325\212jW\254\260\300\360\252\322r\3553!\235osA$l\'\322\377\334\223&\037jf3\246d\345;\364\017[\\I\002\033\031\210\242\255\270\027E\031\324\231>\262n\205.\270\372\316b\3026\221\035\356\353\234\241,\263\240I\217\366\376?}\363\177\326\035\332\353\341\347\255\004\036\261\235PT\250j\\\351\365w\336*\013\233\264Vg\032\014O\177\376\002/#\204G\252\221\177\356\274K\323\375\023\217\377\362\033\023<\353\243y\227\316~\353\232\232\273\257>\004K\230\354\274\234\313\211\023~\3532\207\372\360\343Z\312\3759N=\207\337\261w7i\315\177\3331\216[\356#C\376l>\373\023m\366M\364\024\251W\265\323\352\252\312\252\252\274\027\013\225\273\346\325\233\347QN\324$Y\332\266\332\243)\272n\377\020\263f\346\253\2311&\321\360B\035yH\356\270\202DG\215\356\302\237;\333)\364}y\262\014\344\224\025E\337\244\300\222s\231\226\217\243\341\341\363\021\271\016%\264\216\251\214\347Y\334\334A\036{\264\341\000\021\256\304E\271\342&\256(\303m\333\2372\333\003U\025\311\035]_\357\352&DH \210\363\362\205=y7\377\242\023\241\246\216\000\232\312\377\014\333\271h\357\317\365\341w\366\013[\275\303L\371\233\247D\2552<yW\377g\312O\310\217\267M\374?\377N\240\243}nn\346\334\032\337wm\321\372\371\010\017\364 \345}\275y\355T\336\302\227\367qo\357\332\333\273\377\263\377\315m+\374h\225e\032\022`E\342\375\275\331{\253)\270:\000\307\326U\\\247\307!\'\257\362\352\034:\201\246\315\352\276\'\277\016\354\336\032\035\"_^)\\\376r\335\022\030qf\324\252\277\253\217\234n\2132\263\3227\024\206\246g4{^H\352D\025\177\275\335\217++\262\336Q\305\222|o\000\177\263\234\312x^\007\026\021\326T]U\340\032\322d&z\235\305]_\362\2313\324\227\257\027\r\337u60\306\321\232\367\224\361/\357\372|uH\345\273\244=\375q\315\272v\262\236\242z\313o\362\340\267=\035\352\225\335h\247\276\356&\355\031Yz\276\3226h\030\216\250\247\232z\270\037.\335\336\353\274\364Y\352\330UIt7Zb\323\355\2370\320\253\300\345\301\352\237\272\313\202\372\204\215y\223k\031\243@\352VU\202\330|_/\276]\217\250\246\224[\356\342\363\325\334\272\004S\035\346ky\244\262\325\230\242\273\002\221\364YJ|t\315\336R\000\022\">\333/\376Y\317\364m\224\3131\224\202\026\032\263\375\350\352\213\014\222\226\362L\20314A&}{\035\016\336`\254\352\270\254\245i\233\230\263\274v\236fb\273\275^}\330$\220\365P\217\014\374<\211+\323\345>\016\252\032\235s\363\240\213#\013\272\250l\310\261\253=\225:\036\213\253\363\013\253\216\252n\n\252\254\2408\n\246\341+\006Hej\250\343\243\352\2538\343\232\250(O\254\303\220$\034\252\235\023\272\265\220n\243\262\253(\256\301\376\271\230\373/\352\252\254\337\336\360\365\233\335O\032\303\243.\262\330{m\215\375\302\203\364\364\025\354\315\3157\271 \017}\251\016J0\367\332\340o\302\231j\262\252 \r\325\017U\344\351)\201\021\232\"N\357\365\325\372\343W\262\241f\243\021\212\260\263\322\334TR\255\310\277n\003\277\262\253\332\301\277\306\230s\337l\356\266\246\324\201\277\267\325\224\310\301V:\271Z\005<\232\031\256\3771\230\354\037-\"\231\220\201\235\364\336JS\035(\334\021\362\235A\316b\265{i\024Q#\206\010\334g\006\013G\366\373\035\201\324\334\325wd\206UX\250\303J3q\336N4\333\250\242\357\227s)\325UP\215q\255d-\313\256uWt0\023\233\016)\244\322q<\345\2343N\275\023\234e\010-v6&\300\023\312o%\002\251\231Jn\345P\305\034e\252\322)\320\252\333\0065d\242\356\222\036\253\246]q\302\241ns\306v\317\017\370U\345c\274\243\256\242p\366\025\304\242]l\324\325\\8\302C\363\256\256\366\246\272\347\225UTuV\224\255\262\357F}\337\023\234\350\225t\342\3539\364>\207\325\266\177\222|\321qm-\016||\373\037\026\307\331\353\023\017\346{?\233\236-\014}x\276\206D\034\353.\365\237\335\3026\223\306\371\242E\274\344_\236\210x\317\211@\364\322\336\261\335+\364 \204s\261\343\321>\206S\267\327\236u\322\365sA\337\033KA\177\367\372|Y\317`\246:\024\267\357Y\030\005\177\247>\177\372-\347\'\233\216[Wv\026\372\017\236n\373\023\020\342\310jD\311\3534\267K\235l\333\260\2678\371\346w\006\275.Y\362\316\345\274\2465IVc\301\352j\231q\304\025q\335gT\2573\\\334\313TKVP\306\335\017-\324\036M\360\307Ve\315\345:nP\307\334m\305\353\215\324\265\313j|\256\211\324\336JUS\274\3577\0277tgfq\335\325P\361\217\024\'\334\306\337\014\323w*\306P\rU\376\234\225\271\"\000fo+N\232U\314i\226\327]\2002\316*\301\357\377\013\003gz\321\343\311\n\317\351\243t\253\272\320\314\265\262 \221\337\362\203\255\3773\267\177\344\335X\262\306\3216\316\371\007BD\203\211\035\356\3576\347\372\202qm\377O|m\n\032\013+!\242\307\346\320\336\204\361|\377\271\261\016\275\244.Y\273\257\341W\200+\021*)=\014\246\304/\177gr\3112O\221\2624\325\315\244\300rX\263\247Rm\333!\rw\323\325\005\331\0032\325\034\312-\320v\337F\217\353y7\036sX\224\335he.\2754\017%\277\361m\334\272SG\303\317\246\240\010j\003\310o\017\272\334u\224\335\267\016j\001\307<s|J\225\036\370\360\225n\016\033\375\263\000\331\224n\236\373\221\273\370\237\026\023Ki\356\234\353\317y\265\273\013\013\035w\372\305\277\320\030\335\364\277\376\222\212\236\031\351\\\254\237Ga:\374\277\213?|`S]\365\315\363,\344\220\2061\255t3\377\335w}\333t\r\217\327\246\357\365ER\242\231P\262\343\250\227?\214\330zy\004|=\r\235\372@4\233}\365\346\363\224Dn\244j|\002`\314\246\272>\220:\203\036\027\'\306\331m\276o\221\006\260!J\253?\322\2403\357\271\037\361\304A\006\357\231U\032\007\347:\362\330z=\nm\216\362\005\363\351\376{B\240u$\230\361\377\026fZ\371\353\377e\037\356[^\230\325\177U\375\307T\227\324l\'\233?/\312\2128\357\r\220S\352+\230\303\020YfOH\206,\344\246\371>\016\207\022\0316\221t\231\323\364\360^bz\353Z\331\325\'\270\021\207\237\363\322|\n\264\265GF\326\376\321B\301z~%\361\013ko\232e~\020\302\232\340\363b\241u#\020\372\3227\273\1771\325.\352M\352\252\252\262!wi\000\367\216\243}k\354\371\337\177<\237\253\177Tgw{\256\271&\032\240u\334E\351\255\261\001j\3237j\267:\2317\375c\235\361j\310\211\272\335S\214\325\"y\224\256\377Bs\355\r\225\3737,ra\035\263\373\377\347\350\225\023\355\226\217\354\363d\242\247O\004D\201\342\'\241(\266\031\275]\364\2506\214\342\2670uT46\302 \315\373\343\376\230\315%C!\247jB\3132\333\354&j\237q\225\243\260\262E~UY\355Iui\034k\177\213\345\035{QH/H\304{e\357\242C|O\311Ua\341\205\272\300\210\010\213]\366C\336/\200\177\025\255\237\273\312\336\322={\007\021\217\037O\303\337oR\372]\232%\356\206\320\232*\021\022\254DD\374\377a\311\343\351\244\324\013r\203\377\355\321\023\225\255\353\313\233}\237BV\202/\326{O\251\r\264\222\250\242(\033\237\277Okgos5\216\334{\276\250hT\271>\377J\352%]C\376\213\026\375\000\004A\221\240\262\213\202\0312LW\\k\'\333\357\357\307Q\2214\226\373\3362[\247\021+V@\031]]\300W&j\316}-\367\337d\266>\212\356b\366J\312\337\335U\017\'\034t\314\377\312\220\270\240\323\367O\335:\317Bm\037\024\000\336\330\177m,\007\276f\264\275\256\306\226\177\'\360\005\231\263\342\372\002\027\323\245\351\357\276\215\374D\215\252\227\241P;\245\376\237nG\347\366|\"\003\361\276\267\346\364\037L\"\330z~wn\027\276\333\306W3\217\277p\200\n\000\366\033\010C,\210SJ\276\263\035\375\251\327\314\371\276\332_%\350\206z\nr\332\036G\347~-\r\0175\362TU\313\270\360\211\234a\033Az\275,\271\315&\ni\370\344\365\251\257\234\305\215\334\357\232\257~\257yC=9@\263\377\374\326\316\363\225\351hN\010\201V\207\003\236L\250\n\365\333\315\263\365O\276<\345\372\276w\355C\316o\237\357\241\305\247\363\302\034\'\242\316\001\225K\227\365\346\237\310N(\346\203|8\240i\370\277\1774\231\270\214#\220\010a\377\031\266\256~l<\356\353\323\335\272\253\317E\277\217z\276G\376\356D\324\3352\"&\3427\\\222ly\267\373CY\377\177uX5h\377\236\2463z\235t\2546n^\337\275\374\030\200\233\270\202\35294\3007\2457h\253\355\032l\373\341\250\021Fo\2374\032\266\216W\217\327\354U\201A\246\366\2356\341\020\325^\352\251X0r\020\243\375\362\2744|s6D\370j\035\n\351=\243\212D\361&\rCv\274\3002U_\001@J(\312\227bx\225\370\226\3565\024LD:9E,,O\366\312\346\033\017\035\230){36\305\005L\210\2126\334>\020\377\3727O\216\244\230\253/\\X\312u\306\267@\217\201\352z\256:\036\204\352\252\224b\2163\202\355\271\371W\203\245\332\370\370QG\214\347k\344\375\372u1QKy\272\3729\205`\332#`\320\345\231+{\276\357\3755\337\272G\000m\335#\227\306\373\311<}\205\267 \273\262\220\373q\250-\2077\323zr\002\236V\371\267\005\033\356\014\322\346.y\301\363\205\325%\361\203\324\3176>}\351\356\367\022*\"C\242\243\2053\374\334\276\354{\n{\262\376\363\203\314o:R`\366nE\224A\275\236\240\201\216v\005\335T.\363\000x_\355\312\325,\317\367.\227\333\345\341\2176{\"\302\250_\215LA\2176\302\325k\274O7:\035\220\315\227\231\362\354\365\310O\304\226\327\334\337q\241k\213*\223e_\000W\376\213\353\333\276\313\314\323\261\007y\nB<\263\n\014Jl\001\366\331IPoQ\361\243OJ\370z\372\262\222\315Y\177p\332\370Pv\373\246W\236\274\336\324W\001\255G\364\375)\335\342[S[\244\332\n|\220\315/\000E\232\312\277O\223\343\356bu\376\010)\340\334X{\033\037\2334\310\325_d\375o\241\260\211\345\013b\nBY\353\216\377i\347\333_?\177CL\373}\375Mu\326\001\317\377\030R\264`\342\255\257\304\315\336\316\253?\320\206\205\024\353\377\363~\327-Y\202\350\251\332\251e\330C?<\275\277\241,\003g?\n \365Y\257\367\312\314\312=\362To\355{\374\302\013\n\260\344\216\335\370\377\257\237\240\363g\375~6\276`_\030\360K\322\2125\226=\357\377\254+\320\377\367Si\304\226\203\250\351\327V\177I\370\325\354\311W\250\214\330Z\247\255@\353\251\372>\200P)gR\032\033\264*=\207\266\330Om\277\236g\371w\024\024\316\377\356^K\357UlXj\237_\377\227m\232\246\346\310\255l+\327\322E\225\005\025\364\333>\207_\3426\303\276\036\217\300\225b\227\034_\231\\!\350mC\037\017\263Y\265r\374n\212\312\020\244\223\325\314\357\314\300*\300\311\271\207\217\210.\254\366\202D\327H\3112]F\221}O\251\365(\240?\360\206\352*E\233\335\265\362\227y7wU^\320\031\"]-\260\261!_\324\235\324\226Cz\206f\266\300\363\213Q\215\340\363}\234\337e\260>e*#\376_l\357\272f\213\n\352\353\"o\031\261H\211Q\346\020\030\334\366^\250\224\363\335\224=\"\247z\224\031\017\256\367\363\030\227\250IRC]\203.\256O\270D\213vf\334\263\374\315\363\325\027K \321\327}\344c|\366\026\375k\376\372\337Y\333O8\'\177\245j\235H\377\014\267\254\243\004\377\372\217s\345\344\033}\312.r\t\017?\000oj\375\336\330q\244\323\274\325r\357\027\365\240\031d5U\277rY\350\372\227~\022z\231\035E\027k\254\261\350\275o\307\267\035`\335\013\217m\364c\204B;\320$\2479\336\365\364\261\352\2119\367q\021\016\035\323#/Yv\261>\223\333\350\2145\323\275\272\024s}\324\367\317_ \243\361\321\212\333\3350}oSW\356>\337|\007\237\212L]\333\372\037-\253\372{\275\364\302Q\013\005w\rV\002\336\376j3\213l\016\340\343\333>\322\216L\252W\327\233Sm\316}\337[~\004\016\225\354\341}\374^\210\373\277tY\025\375\037\344\307\271c\3659\177>\304\332\356\334\257O\266}]\245~>\354\363mr\024(z\357\357un\377\3356\230\177\024{\037\217\202C{-~\1773\365\3730\322(\366o\017\363\217\261\343\371\037\304\210\237`\267\005\341\024\224*\214\035Z#T\266\3545\266\3207\267c\372+\370\264\014\202\2507\335\200W\013~\343\206rQ\372\022Z?gO\022+\217\364T\202\350\3175bg\031\337\034a\333\"vZ\257\001{[>\376\215_\277\315\311X*QN\017D2\321g\234\177f\017S<\312o\276[~Fmv_A\356w\027\034\220\372\210\300\232\2575[\344\\O7]]\320\202<\253\016\032\2133 o\321\362Gn=\277[\307\370]w\276\304#\256\272\2038\335\'\0249~U\312+*\255~By\177%\253\037]8\240Q\272\225\324mTY0\244\222\241:Qx\254\305\224\256\364\205\2768\346\262\356\207\216<\rXG.\225\324\006\312\300\224\016\352\351\326\273[\310[\240\313\nV\250\2506;RneA(\372\222\352=|\023<b\235\337z\321\240l\225\317\337\007\321qM\214\251j\225Gv\377\227\276\336\212\331\376\301\026\271\357\273_?,C\237#\304\332\276<\242\325\361\363\023\335\021\255\014Z\375\014b\331\324\335\337\036f\331\247p\267\370 m\235\310\250\331\261\023\333t\377\213\002\354\320\320_\2176\343\323\377\252g\266\032\213(\006\202\323[\017\242\022\366x\315\267t\317P\260\354e\317?\274\23059\231\271\2027\373q)o.(^\232S\346\"\033\377\362\224e\265rn[+\000\213\022\246q\351\021v\221p\007\\\327q]\225s6;@\013\206s\311O\3239\231\021>\352^Jk\350d\255\3121@\024\313\253\276\n(\246\221\351\316|\325\317G\243\322\037\343\310h\342\010iw`\203\310\333\236\2724\312p\325\227\323\365W\025`@t\035\025Cd0\312\307\327]`\344\235U57-B5Q]\037\364Z\353\345TeQ\232`+U\024d\024GU\334\335v\256t\335\325UqQ\321\267*\321\363Kx\206\354s\360\222\021\202\300\216\030\rP\360\253\272\300\352\030\252\252\337\335\343\222G\026\361\322\030\340\337{/\314m\304\010D\311\\,+\337\337\203\352`\'\375\342Yn\313\250b*\017o\241\355x\226\332\256&\035Q\250\336\206\364&\337\366\206\226\036\351\217\346t\267\337\314\247\263k\322`\356m\007\024\010\002\333\342+\212\345\246\267\307\025\312\263$\262\034\004\205\025\333\220\232;\2427\370\177a,\201y\272\270\231\247m\301Xw\006\n\270l\335\332\2570\277\234\212\376\374\210\177\373\177S\335\357\\\260\023\020/7\364\\\377q%\177\361\264\272\236?\337 \201\235wm\324\256j\327\371\265?OvS\203\336~\363\300<1\363\366\007;\320\335}\350\302\247\303\262\005\017\351\303\277\270n\270\3536\022\031\337\323U \346\n\265{w\272oW?l\234-0#\377XDr\326\361<\226\302oM\212`\271\215\035\247\376?\232=\r\273\346\265b\007\262/\201\250t\315\350.o\000\337\200d2\177\230\233\354\275\351\027\332e\372;.\2526\373\350\321\344\361%\267\363\366\347\327\263\347\257\323\265\263\347O\207\227\337}\374\272\344\371>\350)\004U\222\362O\336\337\350y\262\323\017\302(\034\207k\255\312\321\240\rH2o\341\253\335u\037\337X|~\025\240`\315\274\266#\344\347r\353?\212\200I\312o8\375O49\356n\nG\2177s4$[\023u\r\023al\337\357\244N\322eo.\235\333>\375JO\225uu\'\335T\217\314\337\312Q\327o\273?W{\344\370\266{ew\222\340\035\340\317\225\366\366\225\370S\365\367\336Fyl|\277w\336\357\365\322\204\264\022\342#\";\373\260\244\221\341\277R\371Q6\023](T\330\235\277\215\372N\351\311I\006\241z\001\256S\277\377\334~\372\202\026:\346\363:\356P\227[\247<M#\330l\332\211*\372\314^\316\270\351rk\252\265\007\270v\026`\310\254\307\366|\207\225\037f\205?\177\225\031b\336\032\202w\277\365\010\214\257\256\336?\204\312\337gOA\325?\332\372\347\233n\254\302J\242\212\354_\"\225/<\365\372I\315\336\376\232\335 \246\334\334\267\362\273\271\243\237\274\177W\002\273\336\371\265\245+%\354\233\214\025\255\'I\nO\037\333\260\3259\207z\236\210\030l\375\340\027;\357f\242T\306\347\272\224\252S\354f\377\357Z\035\253P\256\276\315\307\344\271\375w\250\217\277-a3\352\027\332\233\360\214\366\233/T\333\032\351(\n\032\241\260H\343\273\324qE\264\2167\257\375s\346\372\003VH\254EY\330>W\211\026\240\340\217\250\335\375\360md\341\000L\374Becs\352\221#\013\361\006\362\367MV\373r\235_=\302\275`\n\252\253Q\342\030a\314\005v^\360/\265\017l@\3604\3630n\254#\251\357I\257fo\026\375\267\363\223\355\256\245\237\377\271*\200\n\325Y&W\215\177\250\342fO\337\352\303\270\347Wf\373\357\221\001\271p\317\327=\353G\217\214\313cc,\364\244\212\353\251U\317\244\203\301x\367Lc6\315\010\377\212\241\0357\203\\*9\233\357\024E^\371\357x\254\3506\031\327\035Z\367\317\360\323Sh\375\315\017\317o\201\241\373\271\2777o\237\3253\026h}\264^\312\033\234\320\255\024\252\204k8il?tt\317f\373\375\337\373\365\374}\326\353*\356\353\273\215\326\355n>\246\032:V\250k\256\032v\002$Q\215\222\345\272\017y\257&\341\034\032\021\246;/\215Z\264\022\n\310\335\013*7X\377\273\270\314\352\362n\346;\265*\346\326(B\265\353\270\373\204\317\231\253X`\241\202\250\375\202\355u\355z\006\035\362f\212\256c\342\356\313\212\353\257\320\342\303\352\021c\354\204\017 *\2168\024\365\023\273\252T\301\200\354\303:\260j@w\233\270n\032\235[\243\354+</2\374\031\246\356\270\252\030\362v\215\235\212\254#\252\271\332\226\215\270\335\273\222\204\354\240\270B6Jk\253:n\262\304\233\264K/[\213E\355q!>(]\302\230\366\275\277\235U\025s?\257g\210]k\253\327``\324\001\317\277\302\335m\303\273n\335\245\021=\376!/}y\236\235\2029i\231\275}D)\352\232\257|\337\232<\343\337\335\222\333\236\263#|\341\344\273@\236\275\275\227\355m\337\313\335\365\315;\3645\370]\345\247h=aM\330a\301e\237\304\227\333\235\017<\026]\363\003\217\3745\337\256\315\nnw\250J \343\226\352\013\006\262V\252\036\352\272,\037\370\006\327Vq\253\231c\230\351\006\212\240a\246\272\253*\215\273\250(\230\022\207\233\230J\305f\230\252\032n\352\n\340\202\206L\032\213\226t\300x#J\013\256\352\2379\252.\346\271\226:\033\251P\375\020\317\263\320Q\305\017xG\020\252\224\330\322\267I\267\n\217@\341\275y\351\271\333\2270\356\036\nH\377+\021\332\266}/B\326.\376\252\313\300.\352\245B\372\243}\366vB\001\377\377rmu\335|9\0133\346R\313W8\036\226m\377\341G\240\177\223\272^MGI\370\325\225y\222Y_wy\356\202`B()X]o\267Mz\3764>\311\343\360\241\367\300RYrlHD\'\356g\226\272\246#,\215\333\256i#\367h\373\371.\000\000\260o\312O\231r/\315\367\366\262\260\205\030\003!\367\036,\267\320\314Fq\351\027\246\311l\354\375\326\314\257\231\355\235\244c-\367~\022\027\236\274\345\326\034\334\333@\010\005(\206\212\310\021?Df\361\"n\302\314\267\343m\2008\267\'\357\353\264\301\252\232F{\3719gx\223h\021\262\215\177\352V!r\333p\373\335\331\256\265}\374\276\371Z\266?\366\250\352\017\321\023\371\341k>\223)=\235\307\r\036Gx^\037\326\206\313\307\230\314\354Zm6\272\275C\353\370S6\211\304\210\235\375\357\2626/\347\337\316D/Y\343:\332\017\241\314\022\252\252\225\363\216\217fk\277\243\347\036Q\347\276\026BRm@\313l\347\270\302\275\374\366>\360\223\247U\246\217\251\363\377\305\253\364\214\003\337=\307\313\333W\373\361\351\275~\363\3023\373\032~d\372\334\257Gw\276\232\252\253\213\234\263\256\237\372\335\276\367\327\333+\340\246\311m\262\353\360l\001{\351\216\364\263\254w\312\364\237?\221m\205\346\2527\347\325\016D\tP\325x\337\360\373\257\335\227|\274\251\356\034\357x\216nS\037<j\370\326\325\305\216\346J|\375l\262Y\334\260\377\376\225\373}\276\315\375\264\244\346\332\212m\234\357}\367\364\2127\177\357E\363>\270\323N\214\316LU\016\245;\355\375\020\020\377\240\372s\367<\312\366\026\330tYI\245l0\376c\257to\216\355YU\226\320\325\351\260\210\375\350\357\232G\177f\034\237\322U\000\275o\377\222\244\276\321\377\273\036{Z9\322\r\006\241\225\276\360\202\027w\3613F\356\373\221\025\314\254\n\207\310\311\326\257\255\357\006\304=\234n\353\334\252 \326\223\3073\233\363\"\367\323\352\302\313r%\2329\266\240\231T\t\241s\026\375\256n/4,\310\253,D\206\260\257\201\007\260y\205O[\360\210\260\346\014\025P\377\324!\376\324\324\257US]y-\nVW\222\311]>]W\257\311\353\275p:\3772\245|\350\367k\211\346\324a\304A\366\373\263i@\233t\377\\\022\232\260\026\356\272\364\225t\213*\322\216\302\303\202\036{\337\021\360\350\253_4\367\332\217\203[\n\253\377\371\346\274\332\275\251<K\311r\2764\244\374\350\271\257u\343%\347\232\005\377\335T\271ZE<~\326\213k\337d\373\273N\323\332\260\263\002\204\n\212\274\255\326-\337\177Qu\353\207\253\215|\374D\035Uq\313#\013\265\340\232\270\017F\244\300\265\225\251\336\350F\326\252j\245Z\275\352\262\253\220=*\347.\252\273\241\204K:\013\210+\270\251\\\203V\250\201\223\215ZJ;\225\036\312\271\214\332\265\366t\014\305\326^\321\327\366Dw5R\223\031\316\363q\327w\006X3\r\005\203\004gU\024SQ\315\321!\321EC\027Vp\322\254\034\023]EM\325S\034\025\327A\226Q\014\027\034pJ\365\371\021UXa$9\316\315T\025CLl\001\3321\267d<0\025\3304D\000\005V\267\035Tj\345\220%\000T\0263z\371\211\230\237\255\320\30746\203\271An\2327\241\275W\211aR\274\000_1\237\020R\206\203\322\251V}\304M<\"\002\270\257Y\352{\201Tb\306\317\035M\336|k\355F\334\370\213\355\022\366)\311\3471\361B\037\017\375MK\367tW\370A\251m\245p\253\016\252\021\255\to\317\337\233_\205\226\361lluP\301\\\"-\r7}&\347T\026Ej\014\2318\247V2\235C\030\335\320v\347W;\020Syu\tG\005Q\262\243\025\325\306\346\255DT\267t\030aM7j]\211\016\r\035CT\354u\344\343J\332\3538\343\264\021\345p\216B\025\306\312q\307\3375G\315\t\322\262\274\367_/\203_\215\277\255\373\273O\374\313\007p+4\367\367\310P\001y\025\252\360\006\303p\371\347\257\225\343g\377\376O\037\344Q\022\360n\367\343\351\254?\277\376\275\303\204`\307~e\000=\211\rg\037\'\303\276\261\372G\300u\323\317\231\037>\336:?|\242\226\316\244\257z\217\307\000\r\255\340@%P5\030\215E\231E;u\363}+\223c\357\0326\301\326\342U\350I\'\254\346\207\024\335\315R-\327v{ty\230]\273\247\030\013s?gk\371N\177\235\267\373#\314\336\3116\357U\215\373\372\313\304\"\005bI\024\037U\351\323\363\177\033F\352\022\332\356]>\352B\350\204\310g\370\343U\276\317\313\263\007J.\240\376)\354@5E\031\375\3246\326\261\375\334\223\225\225R\0077A\326\266\254x\031Y\321\2200u\001\306\302\035\332\315u\327\033s\236J)7\304\263I)\005C\005\204\335\315k]\302\224\000\315C\\\266\207X}\334,\300\037\001Vt\027h\307T\214WW\337\244\n\232q\322\244\272\030\352\250/\206\322G\312\267\325\352\013Z\250\303\273Y\236\030\007\006\202\367\223\327\341\\=S\247\370\304\033\344\230\256p\320y=V\352=OtQ\215\2263\345/\302.\206\367\337\n\037\017\r>\340\362\006\222\276<\375\221\rF\030\365U\342\n\312=^z\373@u\334\023\377\3765f\257\324\321.4\353|\n\202\316\206QE\302\244\372+\240\252*\023\210\2575\361}P\363\327\213+\200\213\357\037\310\247\313\010\233\274\213\251\016\0351\304wT\323Q\237>C7t5\236\367dz>\022\357\335G.\351\254\377\253\003\372\242\254\303\352\356\002\312\25650\306\214 \212\211\256\272=s\233\007x \270*\256\247:\020n\023\242=]\277\273\250E \252\030m\257\025\002>\321h\215\272\273\2110`\266\276G\304)\314T\215H=H\343\224\335x\2143=-\001;\177^)\260\364\325\256m\310O\261\370\215!\345|\276q\371}~^\275\336\\i\350\315|\357\265\020\235H\267B\365\357\263\210I\353\377\177[k\307\3532\201\017B\243\220\346\033$\363\203^\313\367\337\321\330n\205O\021\027\017\034\007E\355P\277F\"C~\216\033?_?\220\250N\332I\377\375\201\314\334\200\356\305X\220\000y\224\333\024\236\257X\002\300\270;\351\373\026\367\217\243N\375\276e\231\023\256\355\367^\321\227\227\317\225\364\230\357;\202\207\230\232=\202\335\023(\300\021\274\357\037\307\366\273\323O\364\263WV\312\374j\233\213\317\0077\214\236f\3372\377\017\260\212\016\032\256\250F\022\027s\365\276\307\3649i\017c\3465l\002.a\377\375\260\245\341.\024sL\005Y_\302\177?\321\363\022\027\361\206\247\035\014!?\322\277\373v\372ou\327\2237\377\300?\374\356\263(S\326t\361 \246\305\317\'m\245~\r\034\026\327\357\301\277?\336\257\216\323h\301\246H\251\230\242\3670\3204\336\306\261\352\316&\334y\277\333\221*\225\202\240;#v\274-\347\243\364\240Zf\0337\314\271\t\017\177b\311X\360\245\031\252}\'\351L\357\212?\330\370\213\267\316P-\253)\265\307<\013jv\271\'\315\256\202W=\034L\223(\377\274C]\216\273\2574\255\277,t.9\231\370\200\032\216nN?\366\253?\323\212v#\036\375\376g\322\370{\177zcAQ\353\224%\305A\242\t\305\343\371v\321\265\370\324\353;\376\204\352\357\2037\244\336O]\226\\j|\347\030\235Y\222\232G;\213\350\375\027\334E\244\347k\365\024o\217\230\366>\217\230\376\305\307\302\336\240\026ZM)\322\221\211y\360\345_\"\341\251\330q\222\371\376u;C\370/\nhg\233\353\360\335\371\374\376cI\252\232Mu^\020\017\311\361\305\336\306z\263y3iEr}\324\371\327+\271e\307\227;\241\227\345U\207\320\312\203\332.\366\277\r\362}\364\377\345\370\342\376\372\212E\177N\3639EV:\001WQ]\241G\357\264\200n\261\025\316\332#HS\347\372w\353}dZ\334\033\320\243r\325\271\347P\253\272\266$RVb\335w\\\236\342\261-\262\205u\314He\267\023hQ\205\300aT\234\233I\323\355\327\273\022\022\345J\377;\304#aFv\177\201{\345!y^z]\256\366u\320\337\303\325\202\r]\322\243Q\204\255VT\335w\365\377T\321\325sew\005q%U\220j\325Z4uf!\305\203G\030\253\r\224t\325|\237\"\205P\322MCd\031T-\255\222\246\000|\237\341\235XP\014w\341\204\272\2630\035\324\027v\265\005et)Xv{\377r\2254$\210\366\033v\245\300\274\006c\004\272\266\244\377\207\227WQ\315\217,\337\320\327\222o\002\024\274\006\342\266}J;\271\001TS\341\265\003\247\370?m\257\222\237;\313\023\265\305-\263&\323\315\013n\327\375Z\366\377{\021\027\301\272J.\362\221\367\232\226\275\260\352\374\252\277c\252(\275\317\017\250\277o6n8e&\216\2646\323\2611\204\333\254D\371P\352\331\376)\276\201\236B\306\262\360\211\371\377\000\271\304\333\277\333\334\361\347\244\217\377\333\266\270\217&\026?\302f\202x\234%VU\231V\275\356_\362e\377\351?\203\331\267\255\323\rcNL\206$\177\020\306\262\316\177\233~\275\r/\306C\256*j\036$<\215\237\266\006*\276\363\235\343\251<OP5\312\335,\365\347\344\223k\250!\331\237\3362\266o\232\331;f\202\272\273\372\014^\274\006\372S\226\330\331e\024S\274\353\267?\260\323\332\023}n\322?K\306\314L\256\007e\214\322\253\353O\033\367\226^6t\237\305\250l\356\372){Iw\007\350s[\216\357\r\036m\371S\353D\373E~\374\304\206J:L;GR\333\274\373e\023\273\246\360\252\273\377\3209\203\264:\321\343\215\310\025*\250~E\301R`\306{\372U\270\306~\242\315\313Jk\315\354\324%\351\014\036\202\225\001\213\317l\202\310\316\334\225\010q\316{\214\336\246\233\303F\311\341H\260\211\231\323|\236\025\325o\352\210\315\270O\324\371\023\031y\276\345\226!VQ\225U%\353F\243\225\256\213\355\301\nH\375\003>\346f\350\364\334\3140\331\307W/r\"\343\250\252\312\324\333\356\341\262\214\271\2114\316\247\260\025Tc\242\025Z3\255\371YS\236K:\335\034\253h\310\231\355\005\037(\350\262\255\016\241g@\231]L\2671\325\30430+\037PDx\002=U0{\031\3548\331MW\371\020\270\334[Q\263\336OF\223qT\244[\362\340\340\252F\362\'\277\265Rv\373\322\000\031/\267?\rz^\210\327]\177t\316\232\220g\373p\241\256W8\320R\002\365\017~G\3554\357\364\257\306\373\343\367\326]\253Q\021\177{\355a`\267\223\315\377\332\363C\375;\r\362\263\361\262\202\301\255\220\360\353\320\323=\376\267\211\302\t\267ou<DG\370\234T\347\301\031T\005h%.\271\222\252\376\207zW\377\325\010(\177`\364\203\337u`\354\336\023\333\376{\326\325\377\246\024mtA\334\177\037f\025\270\377\232u\027\273\316\336\362\371}=^\031\377\376\0324\363Q\331\030%\r\010,\267\355\265\275\376\206,\237e\277\215~ig\374\254T\020\305z,cp\203\r^\206\240\01080\035\277j\347j\013++U\313\332\356\341\246\272\256\356\n\345\225*u[\276\031&~\235\323}^0\311\325\034\032\350\252=f\362\252\252\265rr\2226X\t5\312\325\303h;\273\235W\244\243b:\223\311\256\020\347\026\346f\346\375\334\356i\241\3101\205\2562\304\265\362\203\303T\232\232\nIng\034r\343\301\026\346\234R\250\356\342\373\374pW\314\364s\006]q\204\307\240\363\037;\232O\272\227k\335\307\325\202\246\302\303\025\3145\324\326\243Q\'/\355\206Y\242\256F\340\376\234\272\353\233\277\327\220\256\203_.\016\032\273a\302\245\335\205\271\307\031\306]\330sU\232\376\310k\206\376\353\350\371\205\323\271r/\345\337C\312S[\216\016\363\037?\226\373:n/(\326u\327\303\277\212\324,\274K\226\2774\272\200\n\304\324\027\225>}\264\362\367\177\341\3639\366\216+*\010*\017\007\335^/\240\201\350d2S\2371PB\213|\332x\371\245\252o\337\036\316\371\333\206\217\314x\233\002\237L\177\255\364<G+\327\2410\217\006\352\376\267\337\337G\3665fa\256\212\213\256\263\244?\247\351[\356\245x\226\371\217\263\331P\202(\354t\275\255B\233\251\026\375\252\016*\215\270\023\327O*\300\357\334\311\327\217!\325\255;\373\244\270\315_\376\334\024\265\331\376[\202X\010\210\357!\335\026qc\315\377w\221gx\033]\375\331\331#\246\265\240\216\364[3\014\333\1777\274U\013A:Z\256\2171:\314\241\017\005\306\177\313\314\367\353\316\327]d\326\003\267a\017Rj\373\357\372\366M\014\361NwT\362\241\315e\350h\342\235\334w\3538\270-\236\370\325\335\'S\3620\"\006\346\034\024q\272\222\266a\212\n\336\246l\221\026\330~\375\363d\304\233\265kj\335\265\325\311\230\247D\377\373\235\022\211\376\"\346n5\337.\177\226\376\005\355\334#\370\324P@#r\217.P\330C\254\314\254V\241\037\324\370\026\344\317\356\210\013\372\235a\000\321\200i\257h\034p\3355S\373n\220\223/i\006\276\354V1\373$n\370\321F\342\206\343FHB\230\2138\240\220\347s\246\337\234n\361\034\200o\366\376\377\224\'Bj\016J\346\344\375\337\035\275\371_\277\246\360{\037?\370\242\2446\036\213!\227\017V\257\232\r\376[n5\265\037pJ\356\325uu\1777\227{o\355A\257V\272\260P\020Qw\\\177\032M&\220Pr\177\240\217o\026\016\316?K\347\005R\360\322y\205\330m\343\342\254\274\303\357\350\215\010\\\036\256\362\203F\273\360\262\234\270\331\177\2674\356\231g\237+\277G\237\256\272\256^\357\220U9\244\355\316\322.\371\017\253\345\375\365\024_\323\323\265\231\232\030\343\262\212\372\217\337\367Q\274G\235\334Pt\254\364u\336c)\003\321\242\272!.\321\270\357JW\213\357\367u^f\347l\213zkjw\3138\316\273\270*\031i\034d\033\254?\320\263\333\232\272\241\311\325\265\001\022\337\032+~\331\334+\261\020\340\300d\206\241\350\211\033\270\257t\213\036<\210\025\360Qy]YUP\325\013k\277\263S3j\2505\315\034\353Y\236\342f\357\200E\345\240\261\224\343\032\264\366[\226\333\274\005#9\022\014\322\377\361K{\207\362<saE}\336\344\030\323\320\207\355\237\360z\363;\366:=\310\367\325F\252\263j\177\366\317_k\270\275jE\177\371\263;l\354\323\362#\351\022G\'\370\374}\331\331\355\'\210\307L\367\337\264\035\"\210j\232\243\300\371\374\237\022\372?G\347]\363\nc\353\326YecYO\010\332\3454\371\177\274\360^=\253\212x\225\240-\353\033\343\342\2475({\202\202\335]\313\256SW<\267S\317\327\312yp\370\375\305\203\002\360G;\213.\353\"\316\3223^\324\251j\241n\257\277.\241pL\347\325\005U\203s\313\311q\345\004\250wy+\247\323\351\216\345U\363\266\203\273\nG1\231\331Y\204\0249=;x\264>\252\243\317<\274\025\314\310\013v\316\246\204\002\002\271\232\244\206%\\\235\202\026\202\241j\026\353\274^\217\201\301wu\335B\306dt-C\345\257V\2145\013wSd4I\342*\037\no\317\251\272l\003\2565r\n\273\272mN\234\347i\270\343;\212\206\2428h\270\217\203\233\232#\362\327\222\244\003\352\356\314\021\250e\2302\240\213.c\233\203Up\303\252\2468\350\"\210:a\241\016\356\353\361\343\250\014\350(*\212\341\225\252\217\007\272\327\246,\032?\352\250\243\217(\2420\312\215\243\347o\373\271\252\216\242\354\022\302$\306n\300\2649\202\312\277*\252\252\251\271\225\343\271\334J9:\272\251\271i\000f\0339i\234\345g.\3236\272\333}C2\250fh\017\031n;3\200\252,\210jmt \360>c4\225\0018,\026<\261\274\206\242\253\364\265\340^\360\223\372\013\2062\030F\223\n\253\007\252>\211\360Zf\202\252\353^\232\361<\273\362\352jK\27323m\002\252\344\203\2533\256\351\3079\307-\362(\200\206\234s\241\201(B\360\032\301\003\374\204\014\3728\033\254W\343\313\025V\221\232G\217;\264\'\032\222\250HC\re\272wAZ\253\272\340n\277\n*\350G\2231\361?\235\2165\235L*\032\317\333\252\255\235\324i\372oo\330\023\310\356\017\027\273\344\252\177\366*Dk\023\341\210v\037\036\326\337\313\335\227\211\017\273\324\233f\247\223\\\212\002\023\363\300\004\257?e\364\372\315%\323|D\274\\?\327\335Q?\376\021\333\361\255\360\032\226\024\377mx\214\275\332\226\254\346\234\227\276p\354\266\345\247\276k\373\361l\241\314\216\263~\341ud\370\344\366B\337\320\302\365?\343+6\226/KD\204\335\352\377}\230C\263\362\245\272\034M\362\321\326\342\376\204\030\372\307\253\337Y\27537N\252\304\254{\203zY|+\204\225U\341\246\334\267\350e\314\030\323G\275O\005\305%3\220\371\3636%\361\256I\357:\205\270\215\352\271\n\346\360\3615\355\016\242\240\206\2549+\372\240a-\024~\314\241\016Q)\333\371w\301\033M\033xY\237\331GV\240I\230}\250\301\375\323]\337\3678C\317$\233\233Z\256?\010\307;\243\306S\274\271\250\n\317%\234\2350\270\372\345B\033\023\363\033\253\3007\321]c9\271PH\r\031\270<\226\355\006\017C\352\270\347T5\225\026TVD/\254\272\232\304N\343\225\313+\270\253\372\247y\272\242:\314\033\257\016\032n\370b\272\n\252\346\272\263\252\354#\212\347\"3\356Z\301\rX\352J\206\252!\214}\031\233 \352\030\313\2012\265J\032\254;\256\341\r\025\271\315]\252=\014\241\252\261,\210\242\"S\244\003\361I\316\300\334E\025\225\177\267\366\271\206y\222\007C\333o\370\'\233/\332\276\337\375\254\355\277\273V\240@\311\234\353\314\367o\267\273\274:w\355\375\374;\310\354\033\245\276\362Ve\334\210\225\214\021\216\364\2176}\217\377^?\370mq;\222\237\373&+p\337\324\356\225\375\334\354\314\374}\317\376\314:8\256Z\025\210\025\217\210\302!-\355\330\204\000\262\245L\352\272\016U\257u\256\272\231\301Mq\027\001e35\331v\201\307\334\316i\030<$\262\254\030\211][\252\271\261\022\202\320\342\030r\356n\357%@\251\333\005[][B\351\272\272\0274\"\256W*\021\356n\343\327]C\233\233\202\n\212\204\252\225\262\241+\272\226-z\357&+\370#fP\'M\214\210ZR`\246\006\251\177\207Tn\350\021\002\265\030D\r\364\367\214\234\361\031\257\366}\327\370\024v0\235\323\237\232&\330\256\350\273\007\013\033VZV\267\256\372\277\273\260\363h$\332\202\200A\277\227a[\320\235\021=k\234_\213\253W9\250\006\262\375\350\344\350\246\263\013\333\255\023\322#\301\371\376O\235\273\225\016\317\317 \362\274\206\024\250\306\342\r\026\243\006\003\312X\246\006:\202\2753\274\201\273\216\356TZ>\013;\373\250\250\332\272f\006\252\241\316\033+\364\026\232ja\203\210&\357\352!\202\316\352\376\030h9\256\250\205S\014\267\023\250\006\030\241#\253\350E\253kT\315\332\037\325\225G0BWp\213\037Y\376M\321\232\377\364*\252\346Y\235>+\001\337\276\'\347\273\215\231o\214\t8\315\026\"m\241(\350\343\244<\256ua\251z\252\177{\326\027\010\311\235\335g)\016z\204?\307\222w\362\323\214\017}\220A\201\2256\254\305\355 \320Q\336\013\206\377\022\374\371w\213.\347c\353\2308.\207\274\240\\\334<\202\031\212\276k\007\013|;\262>\244\362\370\245\265\326%\326\3649\274\274\000a\314\262u|\367\360\240{\020\331\201q\014\230Ob\325\252\20362\341W\272\363;\303]6\315\312x\006\356\237\300=Z\200\347\310\256Iw\016{\255\256\271K26\255\272\367l\000\030\325\210Y\036Ci\177\337\036\001\352\"\232>\352\036\242M\226\2667jw2\177\2436\266\267G\321\323\335\365\222\023\017\2403\216GIS\212?\231\377\223\234\237\210ji\214\315fv&U\376s\035\326\010\324\334\302Vh:\337\025\333\010\220\326\324>7\2419\324B\226p\207[\r\324z\216\353\347\344\257)\360\270z\252\254\033*\251!\265\370\262\3759wH\337\345\334\n\307\216\250@"
      }
    }
  }
}
node {
  name: "Assign_10"
  op: "Assign"
  input: "conv3/index"
  input: "Assign_10/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_11/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 123
          }
          dim {
            size: 3
          }
        }
        tensor_content: "E\022\311\273\366*^\273\315gF\273-\036\327\276\302\203\370\276\013\234\256\276\327\305\225>N\377\230>\333\033q>\325G\315\276OI\262\2752\0103>5\337\351\2745\033\226\276n\207\241\276m&\236\276\203\320\272\274\237\360Q\276\213\001\271\275\273\324\224\275\327\212\232>|l7\276\360\001\211\276\275d\020=x\276}>\224(\007>\255\230\013\276\216\264\016\276%\217\203>\272\250D=>T)=K\213\226\274)\004\227\276\022k\361=\313\261\310=\232\240\206>T\227\260\276e\t\232\276\213\230\'\276\010e\322=d\'y>\037\363\210=<\234\364=\215\025-\276\335m\367\275(O\342\275\"\256\023\276\016[\033\276}\016\247\276I\022.>\370^T\275\325X`\276\013\225u\273)\"\212=u[\377\275\373\346\003>t\re>\035Hm\275\221\3774>\0074\014\276\364\232\220\276z\235\005\277n 6\276\204WR>2\022o=p6\222=]\226g:d04\276\200\014\305=\246\241x\276\017\274m\276\273\360\242\276<*\315\275\371\235\271\276-A\032\276h\320\244\276\2215\026\276\027o\227\275\237\234\255=\233s\220=N\232\014\276m\230\210\276\342\360U\276J8\'>{pW<R\203\364=\244\255\007>\312\364/\276T\252x<\016\363\002\276\365[\234\274\333\022\007\275q\223%>y\t\006\276i\271\357\275\2658\263;(\251\311\276\260A\225\276\341\024\236\276\005\036\034> \237\374\274\306\356)\275j\\_>q(0>\231\2172>\317\266\253<\006B$\276\335\t\203\276\003M\330\276\300\321\326\276\213\342S\276\270\306\204\276&\010\302\276\357\344\234\276\374\343\317\274\221#S\276\324EH\275\225V4;7\274M\2750\257\016\276\2007R\27677\206\276cx(\276\001\227\200\275\230\263\004>C9z\271\271\224W>\000\010K>\004\265\203\274k%\321=\363+n>7f\234>\035\010\275=\214\303\355=#\367\230;\203\271\364\275\362\333\213\275\276^\212\276\343\301\002\276\263\265@\276\tb/>>\362u\276\nR\303=2\265n\276\213K\353=\305\305,\275\360{\315=\030\263H\276\252g\000>\023\207 =\205v\027\276\366\033\211;\277\3028>\365\243\225\276\254K2\276H\313Y\276a\214g\276:\027U>y3\363\275\233m\226\276\345\265\210\276\021\275M\275\362oc\275\2569z\276GlM\276\010\231\273\2758~\032=|\262\235=|\234\202\276\246\203\354\275\333~\013=\264\244O\276_\r2\276\016\353\242\275n6\316=\035HI>cV;>\367\276\022\275$\217\201= \003\330\275\003=\201=\221\032\001\276\333\331\311\274\341\376\336=\250\263\217\275HM?\276\204\261\033\2762\337\225\276\320h\205\276\000oP>\257D\257=\247n\037\275\360\023\201>\t\237x>\337\177\242=A\267\270\275\206F\341\274a\024{\275\224\"\267\275\313\373\227\276\307\242\004\2755`\014\276a\3427\276\240~\201\276\341\224]\276\237\234\035\275\277\275\027\275\214\352(\275\234\306l=}E`>\337\231\344=:\326\232=\300\253\030>\245\027\007\276+m\257\275\3555\336=\t\023\264\276=\227\032\276\214h\326=\024\235\225\272\305\007 \276\331J\023\276\035\375&>2r!>\200\241\240=\230k\365\274\001l\300\275\315\345\033=c\367\261=\035\";>\227\210\231\275\344\r\315\275\302G\313=\020OC\276\234\3302\276-\333\370=\344\314\312\275\210\007\204\276f\001\265\276O5T\276x\377-\275\267qI\2767\005\260\276\256\206\005=0\363\271<\262\031\276=6s\260;<\266\210\276_G\373\275($\315\275\241\341\004>\026\236\001>\372\347f\276\013x\212=\333\036\013>z\367\270\275zP\203>u\215\033\275\246\207\342\2752\227l\276\032}\327\275\245\227\206\276\215NW=\206E\001\276p\315\352\275\010\232\214\276\263\371\267\276\353\0208\276\203d\240\275\366\2301\276\335\000\027\275\216\026\340\275U\274\203\275\203\334H\275i\211>>\333DO>/{\366=6\322\323<\003\275\370<\357\363\202=\226\301\202\273\030\370\241\275\n\346O>\225\353\\=\314e/\276\216\336\215>\262\035\034>\3726l=l\320\217<P\320->\227\335\013=\2729\255\275z\331\362\274\241\2011\276p\265\225\276\234\177\212\276o\007s\276\034\313\n\276\205\342\210=\030\367\350\272\006\177\026\275K\214\271\275\352\335n\276b\025\241\275\035\270:\276a\226:=\202o\246>\271Gq>V+4><\323(\27640+\276\255\r\224=^/\274\276\232\207c\276\315~f\27633^=Q\264^\276\330\3517\276\333\212\032>P\232\206>\274\345\016>\014\234\021\276\346\006\r\275 [\022=$\232\024=\261\371\270\275\373Y\306=:_&\276\273\344\302\275\202>\253\275\373?8>\314\325\205>\025\343\214>\215#\034>\265\202\200\273F\'\000\276\030\352T\276\377\300#\276\232\323A\276\311P\237<!O\252=JS\000\275.\240B<\006y\006>\271\013n>#\004`\276\312*\255\276\341\363\000\276\3435\217=.\0133\2754\230\307<\376\220\251\276\270\":\276*\257\342<\353\315==\264Z\223=}\217Z\276\013\t\245=\023i\'>\0325\326=u\r\252\274\017&\224=\263S<=\020\323\025\276\205UP\276\322J\014\274\323\027\254=\367\007\247\275\016\215\325\275"
      }
    }
  }
}
node {
  name: "Assign_11"
  op: "Assign"
  input: "conv3/centers"
  input: "Assign_11/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_12/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_12"
  op: "Assign"
  input: "conv3/shape"
  input: "Assign_12/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_13/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 123
          }
        }
        tensor_content: "\302\032\000\000\001\000\000\000\002\000\000\000\002\000\000\000\001\000\000\000\002\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\002\000\000\000\002\000\000\000\006\000\000\000\006\000\000\000\004\000\000\000\005\000\000\0009\001\000\000\002\000\000\000\r\000\000\000\005\000\000\000\004\000\000\000\001\000\000\000,\000\000\000\007\000\000\000\013\000\000\000\003\000\000\000\007\000\000\000)\000\000\000\002\000\000\000\356\000\000\000\022\000\000\000h\000\000\000F\001\000\000\002\000\000\0008\000\000\000\"\000\000\000\014\000\000\000\001\000\000\000\003\000\000\000\037\000\000\000\301\001\000\0005\000\000\000+\000\000\000\013\000\000\000\004\000\000\000\343\001\000\000\005\000\000\000\003\000\000\000\002\000\000\000\026\000\000\000\010\000\000\000\034\000\000\000\017\000\000\000\001\000\000\000\t\000\000\000!\000\000\000W\002\000\000\013\000\000\000r\000\000\000&\000\000\000B\001\000\000k\000\000\000\030\000\000\000\022\000\000\0002\000\000\000\002\000\000\000K\007\000\000\001\000\000\000#\000\000\000-\000\000\000\036\000\000\000\323\000\000\000K\000\000\000\002\000\000\000\202\000\000\000u\000\000\000\340\004\000\000\007\000\000\000\003\000\000\000\004\000\000\000\006\000\000\000\002\000\000\000\004\005\000\000\006\000\000\000\034\000\000\000\006\000\000\000\001\000\000\000M\000\000\000\002\000\000\000\001\000\000\0006\000\000\0001\005\000\000\007\000\000\0003\002\000\000\236\004\000\000\004\000\000\000\006\000\000\0003\000\000\000\177\000\000\000\022\000\000\000k\000\000\000&\000\000\000$\000\000\000\004\000\000\000\022\000\000\000\003\000\000\000\006\000\000\000\006\000\000\000b\001\000\000:\000\000\000X\001\000\000\002\000\000\000!\000\000\000Q\000\000\000\315\004\000\000\020\000\000\000\002\000\000\000\260\004\000\000\002\000\000\000\006\000\000\000\262\000\000\000\020\006\000\000#\000\000\000w\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_13"
  op: "Assign"
  input: "conv3/freq"
  input: "Assign_13/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_14/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        tensor_content: "\211F\352=\310\273\004\275:J.=\371.\001=\033\002\325\275\332\317\252\275\266\017y=\366?\244\275\252\257\266=8\273\304=\t\212\010\276\374\234\000>\326EB>\3208\305=*R*\275\247-w\276\316]@\276}{J>$\244\212=\002@\276=Yl\027>\230U\364=\304\222G\274h\225\026=\376\n\323<\026@\231\275\252\312\214\271\035E3\274\276\017!\276t\001`\275\246\245+>\035\301/\2762\211)\276\006\364\351\275u\330/\276\3710\341\274\315\307\256\275\030\023>=4\350a=\214\207\236\275\312(\026>\306\031G\276\006\377\032=\245h\324=y\337\345\2757`\032>\276(\266=_,\025>\'\241\"\276[\024<>\275\026\351<\360\220\210=_\013E=\n\014\244=2\304\002\276W\306\240\275\037{\001>\027\315\005\276\2112\017>u\2121\2762\322\r\276u\230\376\274Z\003\031>a\t\352\275\027\342\267\275\271\205\022\275\240%r>\242\275b\276\0071\224>\322\013f\276\262{P\276\343\3161\276y\325\217\275<e|\275\345\030->\005\003\353=@F[<G\221?>.\235\333\275\251\306\254;u\'\033\275W\033\351\275H\351\273=\367\0321\275q\373\213>n\342=\276\253\n\253\275\355\261\007\275I\3755\276\036\022\255\274\007\204\304\2751\361\325<9\351A=\\2x\276\301\002\210;\016\317y\275\361\314Q\275\314\021X=\216\366\n\276\313\231\010\276f\351?\276*r\300:c\362\001>\300\332@\276\262\277\357\275\255\363\221>@\333\034=\335b/=\271\001@=tJ\277\274\300\316a\275\355\367\275=U\355\215\275\363\025#\276\021\231D\276\247OF\2764\342]\276\323\320\200\276\346.f<\026RH\276\361G\347\275Ak\026\276m\201\354\275\246z\341=\311\326\257\275\234\311\\\275\334\020\361\275A\\\177="
      }
    }
  }
}
node {
  name: "Assign_14"
  op: "Assign"
  input: "conv3/biases"
  input: "Assign_14/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_15/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 31816
          }
        }
        tensor_content: "\303\353]1\322@\315\361:\003\245\272\307\327@9\212\343\230\321\331;6:|9\355\0163@\372\327\261\301\203&e\331\255c\245p\362\006\275\340\016\235\323;\320y\344\3463\254\035\317bBq/=\n\203\343\276\036Y\257\035\257\022\321Y\327\254x\350\030\302-}\314\007p\300\352\334]\\01\317\2149\351\221\350AB\320\372\351f7\341\334sS\340.\300>\274\010\235?V,\221\313vKY\375$\364pX\017\037Yp1\267\322h\r\017\316zM9$\216;\276\215=\254\341\321\300\333w\273\340\307<\035\323+\320,\013\001\302\323\255N\005\213,{\232\320\0063\223\232\307\3178\321i\016\206\272\017bd\0138g,;.\023\347\014`;\2118\256\200\002q\207\232\317\244~\201\230x\350\013`>\300>%\375\3033\241_\234%\312\365\365/a\303\017!\251\317L4N\252/R;\360\014\004\232\303\317\244\220\250\356O$0;\364\263\365\300\235\036f\034?\000\r\032^\000\316@\226\034\016\257\001o\022Z\243\352d\303\246\231\363\001\363\016\277pj\303\367\244\317\276\350\317N\2652\312\313\350\231d\330\r\026\366\230\032\261 i\311\347\214Z@\251\247{s9\367\037@\375\260\037I\240\260un-\352\344\370$q\300\014\344p\317\244\2733\221\365$\200\356\376\326\003X\227~\330=\210\023o\247\356\341\315\373\236w\036\306a\017\205d\367\t\356\217\004\206<vO\016\271\233\004\223\232\365\266@$UhX\221\370\316L\277=\311\306r_\237\014\377\246\030\275\n\346\374\301,z\327\003\274\217g+YP\316\335\027]\010\030\306\022\030\030\352\207Gq`\2518o\001\341k-o\211\264\037\201i\000\235p\320\3005\252\313\216\343M(f\271\263\324\320w\2325\240\357\331\316\226I\214\311\357d\r[>\330{\007e\223^a\314\022\0359:\233N\3274VG\307&I\007|\347\325\257\237\"\177\0032C0\231;3\217\215\235;)\226\'9\364\2034\375\357t\356\272\303\227u\315\374=\013\223a\272\353\024\336\211z\263\204v0\227\375\234z\373/\334\365\021\2019u\266\246\007\307-i\367\211\032y\346\325\317\206\274\246\272\001\354I3\314\004\316b\227\355\351&<\212s\374\361V;2\032j\372\346\3345\271\231\256\232\207\327+\356zW\276\253\357c\320\353(V\317\323r\233f\326}\337\004\320y\234A\340\266\327\373\340\234\353\316\376\306~\3147x\263\254\245\3002\255\321\317\222\n;\366\354\255\3265\216`\327K\'\212\\c9_\275W\217\013\001-0\313X\206\316\237Tr\334\247:Rn\214\343;\251\236C\212I\007\262\337E\033\375\025\2109\321\367s\257\200\227\315\223\376\t\267a\353\243O\027\331\337\300\267@\316]\307\022\226\026:\014\261 ]P\231\017\300\305\033\274\302k\014\263\361\332v\355\305\231X\337z\2239p~\367c\n\360Q\n\335U\244b\365\250\2553\274%u7\351\357w\225w\352#\215Y\010\362\357;\235\274\\mp\314j\372G\327\212A\t\251M<\366\320\005\375\0037\276\327\307%\340\304@}\272pct=\201\372F$\337m\335S7\265\337\240E\347}@\216\252NCm_%\0322\032\345\025&\311\255\343)LV\265\370\211\366\263\336\177u\367\276\341sy\314^=\304\247\267\372\261\3768\'\271\211\377\373\254\305Q\014\270\343\267O\035|\355N\254N\342M\005X\317\272\014b\272|km\337\335\030\333\335\034\304\353x\216\357\357\227\003P\267\023d\243\355\000\211r[\\u\327\312c\377\366\3514)\261\231\023n\013\246\020\322\335\327tM\272\245ItA/\1778\371C:\305}\237S?\256\365\n\351\222\241\314iJc\307\336\375\275 t\270)\002!uw\364\352|\277\345\311z\353<\202\0046\025=\312\213\317_\010\366\332\247\330\022\002\276\202%[r\260N\261\311\226\007\215-\303@\003\331\334\251}\350\032uR\367\0169\315\275\327\306y\217\356p\223\214\035zc\364\255t\363mm\357g=\357\265\233\200\346\200q\332\225l\344\313\333\247\205d\320L\363\023\251\034\237L\2064M\236I\016\366lK\006.N\3777a\334]j\030\026kLp-\331\223\030\026\237\217\256\325\264\007|A.\372\320,VBu\316\000\371\311\362\371\354;\227\345\315\216\2712\232`\022\375\235|\004\271\327\306\271\2302f@\'\241\321\372\247\323\346>\274\260\227\220\361$\340\006\006\215.\272\270\325g\334\013k^\235\026\223\030\321\361\367C\240M\276P\317\373(\314\013\007|\373`\035\232\006Os\237k\263r\206g0=\335r\306.#\235~f\264\375\3452M\303\031p\236w+\275\016\364\213\027\021\237\326,X\312Z\267i_r\255\345\327\2261\267\\A[\224y\213 \177\334\023\335m-\312\262yn\375\267\006-F\305\276x\357\033{\372\027vLq\031\314]M\204g0y$\232-\033E\345{\322&\2018\367u\242\251F\004d\333\037:\350\343\337I`\310N\266\327-Y\304,|am\345\327B\376A\310\263\232\241\337\217X65\370\237\271}\273\026\317\227]zT\376n5\321\376\245\te\212\357)\037\257\037\037}\237>\205\375\013\250\340\373/H\2361\356<\367_\207m\361\352;bYw\203,\261\255\nw\336\307\373\240\364X\272\260g\365_\220\231\376\332\\\275\214\207\177\376\002\013Y\362\005|\322\346\367g\313\365<\002\301\237\375\355k\225\253\360\264\262\231J\3171\315\261\302\227\231Bg\374\311\212u\006\306\213^Q6\273\222m\242\315\315\331GX\351eq3}\333K\243\222\367mO\334`d\t\344\243\3567]\365\312]\034~W\275\266\251\376\3462\225(\356\315a-\373N\371\332=\0349\200~\314\356w*uU\257\357\273\267W\211\247\325?\261\221X\3261\035\263@\236\357w1\265\335=\340\255cs\333N\224lhg2\212\372\266\232eDq\226\354J\004\2531\250\211\\Hi\243\272\034Z\314\323\244\374\367\365\346\033\320\3334\220\371O\240\344\312q\367\344\367s?\222\264\367\301\177\312\252\225\244\265Z\033\366\'/\345\322\351}h\272\343\256\274\3030x+?B\234A5\037\361\\\357\014y\337}\017\304|\372\032|\333\207\037]\005\231xUC\355S\375\271AW\026\327-\235a\240\365~YZ\240D\373\244\356\326\324T\240=\272\335R\224bT\333\266Gp|\303\327+\362m9\025\210Y\362r:\212}\377\373=\337\217\247\272\t\256\273\251\224\033\277_\334y\304\274\256\263\320\005\200\375n\355\347\003\016\377\235\232\270\003\237\377/a\227lg\200\357*\256*a\236\306:[\303\036\262\346\265\370>`\260\314\312q\226\320\014]\2343sG\207$Z\311\034[,\300\t\353\367\254\001\222\300$\'\200\001\200|\301\337\353k\342N\207\034\267\217\322\207\364\350\030\035,\014\017\272K\313\204\315\216\310\372\263\367TL\001\211\357\273\230\000\0012\306J\303\340\314\013t\364\236\360>8\026\000\010H\346\023\243\363\2325?\346,\t\316\276b\307\363\317B\255\334,\212\337j\316\243\214\307t\001bd\314\357Y/\321zq\373k\304o\2722\022\341\232\331\247_I\323?\\\356\343r\331\030\325\335k\252\241GRi\227\375;\311\307\241\273\'\263F\324\320\222/\236\327r\265\330\234\307\r\361kYO\023\200\216\rn\371W\305\0055+\343\211Rf\251\273\264\256\247\261\304\025u\275Z(\350f\233J\372\261\221\325\035]\025\263z6\252w:\324Owy\274\336W\222\345F\247cS\262\350\254\315\026\371\3376D\265\264\037@\324\374e.\370\324\341\2515+\347\235\255\367_9\346\345\231\2476J\360\346\324\221Z\225\'=\303\322\350\024:<\312\000Y\370_\021-m\017\307iP\363C\277\304#Xu\247\334\252\214\244\335|eY\262\0101\32285P\377\345e\005x\243X\274\003\377\235j\226Zy-\247&\365Gj\254\3141\265\255\211W\244M\016\323\373yM\255\350T\233\341\024\344\363\010\2611\301\017\320r\252\346\006w\345\254W\274\361;\032\301F\3273m\263\264\031\376\201\002\005\257\226\357\364\037n\013pY)\244\267v\241\355\347v\322\232\3577\353\314\363\324\275\303\321\377\370$\310W\351L\'\032e\221m\336\311\337<\217T:\206\273w\267\345\356\363\266\325\247yI\250\010\203KKLnQ\274\211j\334\203-\2657\227v2\345\347\253\302\226h\353x\332\314\213A\230\277\305\370\216\362g\t\222P\273\225\242,\0173(\324\017\271\342^\224\2023s\270\312,f\362-!O#\217\246\222\"\344\376gw$ 6\216Y\315\312\035\257\237\301\353\221=\362f \212\335\373(\210 C1\326\350.\261\003pDP\211%\027d\337\323O\304\\_`\263B+r<\275\344r\254s\t\213\355\"\r\346P]x\331\355G\002M\t\265\273H\367\304$%\216\222a\357{\034\345\021)_mZ\032m1\024\371\374\215\261m\324\352\347<\235G\340_)\021kr:^Iu\003&/\250Z\214\353l\313D)\000\001\227\0217\233\312x\342m\336\352\330\355\365\260\"Q\335\031M\305\377\234\271\021\312;\237{\025\273;\3077\371&]F\200\215\034\332\020\3510\232\355\366\372ya1\351Sq\373\313\220R/\031\016\267\325\343\253\213\177\201\035\376\204F~\340,\2616\373\342\352=\364^\272\301\366\321\325\nj\205\266\342\\\263t,\222,\265:\014\243\203-\223uN.,n\367\227\323zuP;\361\266\376\236\035\232G\025\306\341q\035i9J\206\241Jv\270\345\356\325R)\036\322\270n*r\363\263>\013\216-\373\333-v\303q\2574Y\223\237\235\373\236\2429\242\237\310v\320v\216\324~\357\360B\352\252\341\036\247\207)\366\231G\253\224@\352\375\276cz\376 \237\321\322!\212}\216\'r\2426\2568\210\265\003\024q\353\2679K\234\273_\2321\373\001Y\317\260\227\272\243\373/\261\177\204\240\375?\377\331M\322\267\213KP\277\276\377X=\325r\235\024&\026\366\327m\251\2431\206\254%\340\375\351\201\277\331\274I\034\375\216\232\334\177\367A\357\264\215\375\337)\272\232\243\270=\352[-x\267\212c\211R2\340\266\017l\001\224\206\367\373\335i\264#\227M\240\327\266j\215+\247\254\275M\343N\220\026D\021\r\234\346{\367T\375JB\250n+\374\276\350\361\234\371U,!v\367m\224\356\375r\377\357U\361\253\277`\366o?\351\362\273R\377g\022I\222\276y\274\216h\005x\3133\013:i\203\336\254\226\351\253\356.9\355\346\335\030\307\t\220\361\274\327\250\353\027\255\367\332]g9\310\275\214\3134W\330\364\267<\014\372\325}=\237Y\333\027bB\332\321\254W\314\324bH\270q\220\210\263\251\326\246\263I\032|k\314A\361\3537\315\263\314]\206\255\355\355\321y\225\210\033\345\036t\214\312\\\322\315Km\201f\014w\2102K\337\347\204\t@=\217\3670\224\177\t\357\372\n8\304\2062HO=}\222E\256/k\304\262\'\371\332/\341\344\363\324\014\353\016\255\3401\257n\214\365\223\021[\365R\377\032z\323Kw\317\234y\266\246\264\r\272L\317\230\271\303\2701\020^\275mmN\314\211\331s\'.8\326\251(\253\t\320$\336\t\0143V\007\017{V\273\3012\031\212\272\310\204`}3\214:\031_q\226\321\347\320V\204[\307\237\034\253\350w\256\006\007A\370Q5\337q\314\001\361\206j\350\240\030G\342\24648\263\236f1\346M2bd\035\326\276\204\315\226b1\000H\375\323\003\336~L\275\246\335\02689*\373\262\276\351^\235\000\026VC@H\362\034\260\035~\213\366=\235\227$\222t\234\371\031\327\360\376\220\035\223\241\312\347\377\340i\372h\265\207\333\303\\\306\260zs\001}\351`\016\374\022\000t:-\311\236\216\362V|8c\006\216\376\023\351%\355%\217a\337\240\377\005\245\315\036\314+<\350\246\274I/\264&d\000\026O\202\313\357\322\006\202\305XK\256MOf\334\321\023OI\241\325Tf!2\377W<\204\323\372\331\031-\244\260b\203\306c)0)m\\o\177\364N\"hq\034>\276^\340\257\005]\353\310\357\370\232\n\213\274\341l\010\261U\315q\371\235\302T5\356\364\360\024r9\250\026I\335\2672BK_\355\311\232\244\377=R\202;\341\201M\367V\362\024\211Gx/\004,\320\326\272\0345\007\343X\316\303Mbv\332\023y\026\273\376\337\033Z\261\257\253\253\317\366\265sV\223\210\264Q\030\324t\312\035j\217\244\357\377G\027\231\0230\346~\330\320}\276\3518C\324K\372\234\252\207\312\'\227!\202\333\207J\374\016B\366\201\225\311&\225Q\253\222\357\374\301@\337\005\373\'\267\024)$\324\013\231\307\237\273\234b#R\332`\336[\333\ra\254B\337\344\033\211F\3049\021\221\337\001k\337\322\223%\026}J\3328%\036\266%\271\223;\367F\234\337\3332$yC\304\267\301tiyE\202\212\221\'\257\313j\276\310\356\203i\017\316\376\201\365\006~\333w\263\304w\364\033\016\316\317\324\367\2467%9\301\177\365\254P>\267\312o\377\225\256\224\352\022\260\341\305\331\002uI\031[\356c1\335\237\241\306t\315~\347?\377\177\004\231\346\236\022\257\323\262\003\276\252\277\316\325\024\2114\\\226\355\014C\031;\313\363\370\254]\2268\314\031\350\3773\353\177\234\031\021\373\t\327wO]\336]s\321<6?\373\336\344L\354\200\266\314\342&\240\232\377\377\377\337\276\377\177\375o\353\357g8_\253\013\374\324\235\377\377\377\006{\374\375\302\0006\036\341` \203\237\302\233\204\232T\036\357\375\033\021R,\205\013\221>\372\225\330\n\3773\220\277+\221\007\337\224\2303V\r\324-\346\233\205\203\352\345,\245\007\343\277\375\036\333-3\317\320\337\323\336d\233\004\326\247\3533\201\323\371u\265\214\3533\347M*\032\265\211\335G\034\237\323\272im\276\376*\251\312\237\302\354?\331\360+\275\3750\334*\243Z\361\253\355j\210BoQQ}A\333\222N\355\323\361\311\023\276\267\364\006\303b\334j<\231\264 Z\260\342/\025M\250\343\210\261?FbnJ\250\014\371\023\264\276l\210T\333\371\333,0\224\362t\005\332\252$j\263J\335\033\017\344+\377\360\tn\357,\215\201(\324\361eR\277\227\336sH\254?\337\265\342v\3179\352g\371\002s\321\026\245^\275\364+>\262\231\230\262\275\236\024\273\265\0311\220\327\377\363\261;Gh\023er>\333\2618kgi1\016\372h\025\352\261\215\272\266a\356\334\217\312GTp\364;\362I:\217~4\375\211\260\253\201\310\326\203\365\"iO\351\343r\366\265\361\234\020\3570>\243c\275\336\246\277.\r\335\373\354\331\217\273f\367\322tw\312\360P\300\3267\306\360D\333f\243\342\004FC\207D\262\327\343P\357;\277\365G\034#\351\252;>\331C\237\324I+\313\264bq\234gC\343\376\231\212!YT7\261(Y\027\233\366D\261[g\007i+\264\003\301\274\335\320\302\243R\233\277cW\021\276\024\003V\325\r\3534v\263+\237\331\216L\336\314=RF\002{\337\366;\371L\255\326\016\365\006MM\033r\276\366\234(]\037\257 \333\223\307\003\240i\207;%\241\022\210\361\316T8\336^\214\311\224\236d\316\335T\007\253\373\025\222\327\255\327\301\345r<&H;\270\001|\252\031/\325\304\207\355\361\345\204\327D\212\031\276\033\3000\235\325?C\217.\037;\351\352z\342\204b\352>\325\324\336\202\250\251;L\223(\341\271\236a.\263\034\256\250/y\353\332&k\261\337s\203\277zf\036\2446I\357e\263E\033\252\335#.\365\'\361\3631\340\027=\'\212\354\315\344\324\230\026\374\273\246\242\3222\200\247\353\'\336~\346x\342\316\363\3154#H\333\341\237\356}\202\336\367\224\267@\232\217=6\341\334\273\236\232\317\270\237\231\010H\036\016\214+\313\351.\037\035/b\323Oc\217\"\317q3M\340\0324\2727\316\370\267|\203\266\310W\225\354p\243\372\252\364\331\225\236B\341*\377\361v\225\241\353B\251|_<\273\362\260\341\236x\206==\254\256E\341\274\331D$T\007\275\273\305\006\311g\232\277\3207\307+\305\337-\016\350\223T~\356c \252\271\353b\272A\021\354\374\317g\333;\022\255\251wem\350\334\236\277\"F\274\t\326\032\014\236O\215)\367u\272\216\332\013\317\335R!\216\367\301\230\345\3107j+h7\377\335tTH\326bR\215C\250\355\250\020\360\320^C\315e\254D\374\232\326\0044\320\345\014\332\315\014\273\202C\370y3K{\267\025\215\337I\326\267\207%\247\261S\376\333}o\206G\366\330\207)U\022\215\246\277k\027\202\225\376:\251]\305\366\325\007\\\324\2504\215 u\310\224:\300-+\345o\254\360\301\332\373\270m\'\372C\233\205x#2\357;\372V\231\366Ld\352\360[n\345a\362\'\335\254\366\267\332/7y/R\373m0o\177B\235\277/>S[\353k(\301\2226\244p\032\265\237\354\317\256\306\023\313]\263V\010\030\362sI\273N\3565\245\247\300\343_\273=0!\264\006\245\2563\330\230\2055\373S\316c\273W\370\365q\375\256c\236\367\002z\336;\266\335\221\364\306\370\277c\204\257Uw\223\336\226\322\002x\3474h\364\363\336\327y\311\3469\253w\330\321\322Vt\007/\225\270nK\371c\317\315\373\332\343\201\233\360\364\352|W\307\030\327,\023\300=\306p&\265\303\270s\323\357s\000\374\177\017k?\275\200\3171n\357\313\233e\033\271\346\360\316h\177\035\237\035-\320=]I\217\016W\025^1\206{\332\3675mg\323\275\320\037t&\262\317x\006\016\275q\266\300&\274\233\272,\367\214\373\207\367\274c\036v\035w\003O\305\005@\030h\307\274s\211s\334\307\'\232\3419}_\363\325\310\001\2558\263\314\307\301\217k\252}\314p\314\3060\376\256\275\204M\371\037-\230nM\213A\253\272\256\333t\372\321u\275\271M\237\375\237\261\3334&I\314m\376\251)\263\312\351I\313\362;\236\271G\033\242\205q\263\254\273{\234\351\234\243n\236\r\312$\263y\333\342O\254\177\233G\226\310h:\357\257\367\245\3574\316\351O\3735\243\023\272W\373\025\207\376FOl\210Q\017\276\256.\'\220\365\335\207#\016\252B\3234\352YPK\233\023\254\213\'\373\271\322@?3S\342\245\241o\375\372\353)5o\377\310#w\205\276\006A\032\2218\370\253\r\221}L\264\374\334^\355{B\344n\177S`.\t]}\254\362\204G\177\365\331\375\364\021\261T\315?\354\227\344k5\013\332|\002\275b\204\375\004+A\224\212g.\324\315s^\265o\316\366M\200\374\213\027+\333%-\\k\221\237\241k\337\374\221\270\343C.O\274\370\264\000\257O\257\307\301\005\246\032C\317C7-_\335\335d\377\374\363M\214\357I\306\274\005\221u\316\000\341\323\327s\223e\206\203\236\321\"\n\352\274$!\324=\355\342\r\343g\305F\023\331\316f\256\001\376\336\204\201u\334Y\327\037\346\327/\3163\235Y\317{\334\3648q\363\\{\3347q\366\232\241\0309W\351X\332\273\222\034\367g\225\213t\267\217e\323Ij\261\217\352\204\321\000\007|3?a\363\304\253}\213`\303o\212\233&\266?\013A.{R\376\366\346b\335\257\317\272\037g\352b\026\214\372.zO1\3552L\372wgJ\231\256d\'\234\257\200\350j\243\204\313\266\034\345\241\345\306\201\354i\371W\345\234\235\247\037\002\240\017\377\30188\317\367\260\244\211\344\006f\255\374\317=\307\007\0138?~\250\343\236\263\346=\234\313\212U\004:\227\365\324pW\236W\373\325~>M\253@\376;\202CBjF\302\322)\273\273tmU[`\313\316\3557\205\215\254l~Y\260\337\324\326\2674L\274\325\272\'\356\365\367\370k6\357@\225\270[\2563pu\254\276\276\177\361\346\253?\355\362\377#\367w\207\3476\\\234l4\353\0276WI\326\270\344|wx\366\377c\362\341C\035\373\351W\312\253\016a\375\037\312\247\243\244%\273\333t\010\023\253\354\235[\362\r\346\332/\033<\013Axj)\370\376\265\311\202\360+]J\\\205\214\271\t\241\033\327i\215}\305T7\"Qg\303\301\277\003\370\364F5\tY\261\263\261\274N\\\"\355|\352-\270\266s\272\262\205\206\356\257\016\245\202\265\216\3377\322\024\2122\330\353\230n9\334\351\242\'r\237\365O\376\207:\375,Z\204\002\340\377\277\316G\013yF\275\345U\224\235\235z\226\327\200\273\036:\345/RV\344d\317=!\356\022,\n8\2379\'\363\352\251\300\315\375\342\021 p<\325\270\016\2476\344\331\316`\265KkC\223\357u\2301\017\355d\377k\317#\373\225y\366b\252e\242[Vv\335\343\315&\030{\204\031\246\306\356\272\354\342<\232|UV\002q\363\252\326\016Z\216+\306\361z\314s\210(\3408\236D\225G2\017\254\361\357\244\320zd~n\313\252e+[\214\363\335}\332\001\360\261\335\337F\246e\005\350No\333\321a/\232\362n\\\326\244d\343\332\256|\346\033\034\325\322X\207\035\362\215\263`\'\210\256\031\343O\230\376\214\236N\274\214M7\351\337K\3509\340\304\223\326{\347\244l\317\304\006\264\356p6\017\327\000\014\315^\303\305@\002l\213\303\241\256p~\332-\321w:\347\207\365G\236s\240\026e\3364\003\373\274W\373\205\225\345\354.\361!\371\242[\204\313\353\333\364\316\244\275\237\0068\254\213\325G\223\232^\230y\315n<\266\0345\352\311\230\006\371_\310s\367\2327z\rh\344\354\367+\221\221\005w\227^\336\211\344\023\355\223=\217\314\357!\307\245lb\276\346\021\214\263\371+\331\264\336r+X\330\303\233\007%\234Z`k\313\254\276k\224p\361Av\353\276&\213w\242g\377*\031\3458\274u\214\t\367\206[\355\\\032\377\016\241\035.[\322k<\374\013\233\227\313\200\367\020\0015J\203\264\007\321\376\214\000\366\201we\266b\323\020#\342a\235\247\006\237\243\000\007\261\346\340N*\212\343\373\362\326t~\037\344\016\005\206\004\224}\355C\034[\274\343)pp\220a\366\"\266\337\'\036\002\265\037\271\364\354\372t\004\202\311\222{\311\016\023\256\030\220r\316\035]\201|\350\007\231P5\326tw\007\017\315\207\003G@\016\270w\201\336\004\270\007\212\216\363:\267\035\3179\260\223K\222sc\213\'\262;\200\035\'D\353Y\310\356\004\222c\240\022\344\2353\263\030\352\213\036@+e\256J\237\004\350\005\200\031\223\322\263\327\016\326\274p\034\000w\351\320\233\026\236\314\254\266\275/i\006H\003\206:b\351\221\3313\321`\260:\342\317\207\000\223\325\370%n\3400:\035\223\217c`\260\002\262\340\026\t\320\003\374\347@:\004\316\217\235\332A\364\347I\257=\'\206\030\246\271\341\203\313\0370\306\201\365\207y3\2347q/w\033\232\370\367\007\340\2703\315k\367\034( \337\270\362;\017\\9\326\010g)\317W\221\22783\\\367=7zC\207\021n\303\316\227\352\362\215\354\276h\356\305u3\320\327\271s{n\360\316]v.\243F\270\017\273l`\363\231\333\324#\270\347\364\246\271\255\245k\316]W\367\257q\351\013\016Ii\016a\035\023r\200\ty&\270\273\313\353\3433T|\377>6\260\026\250Iqf-\374\372\327p\337\200\002\274-n\2201\271\327\246\353\260\007\256\341\310\307\347{\336\355\017b\247~\360.\\$\220-!&\200\016\371\360\315`%y\202\327\253\005\316\017#\257\270`Q\364\252\311\333mS\366\234\200\300[\266\220c\'s\034\263\247b\334\335>\333\261\300\211\267\312\2529\216\375\357\001lj\3346c\334\333\267J\341Kwi\310\377\373\375\275\317\207-a\316Q2\236\325\302\256\264\375\356+]l\265\3018\235x\377V\355\264\257\372\231p\324c|\016\366\333!\274\323\367\252j\237V\356\266\355\325\264)\310?\260\035:\014\223\345\253\332{iD.\323\021%\255l$\224_\272\006\007\377\032\236\322\364|\317\355\355\201\267\037P-my\235yE\273\203\231\374\001\203\247\373\253[\217m\002+\344R\252+e\226\247\356\251{ju}Q\376;OK\332\216\337\250tSS\322\335\374S\032\273\300\006\2616\333\355\225\224\333\237\311{Q\030A\'\234\001\220-\\iB\314\307\246pR\355N\372\366\200\227\346\275\365\266\371\225dN\255\344\315\035+0\357\357\323\257S\335\216\347\220G\244\314\303\n\033\327\246\346\200U$\232\366\342\305\327\332\202\267f\207\207\275\205\262\212\252\016\267\265\272\265\247\336\342\372\261A\260#\362\330\303\343O\223\027\255|;\256\032o\261\323]v3\0319\233\363r\375bhnJ\215g75\252\007NO\373\374o\331\037\017\215,\375p\352%\347\014\204\0102\022\264\306Y\363\014\200\371\372\014A\266\375Z\345\347\263\"Q&\265\314\327\317\263d\021\036lOgC8\330\334\306@\234z\004G4\275\313\226\235H>\177l\330\225\210\016\312\336UBX\310\341\236\305\205\227\210\337\271\221v\362\260A+\274\306\363\272%}v\225\272\375\255\327\315\367\345\337\266\0339\236B\375\310\023\257\237\222\006\347*\360K\"T\327l\272\360Y\356\230\205P\355^Gu\300\253 \256YZ\323\332O\273\000\366-\ri\274\377\330\026\372\217\024\350\322\272g_x\227:\374\316W\357\377\'\270\006\366\177\376\340!\223:x6H\322\367\343\034Wd\236\016{\031\022bt\321S\337.\255\343\357{\337\227s\315\317\352\343\261\026^\313\026\\\013?\030\tW\376\313\3648\222o*\177\275\336\352\265M\016&\014\n\377\232MBi\246\377+\346\232\234\341\376\317d\210\372Y\312\354\375G\373c\245\303<*Hw\213\3157a\231\360\232\317\3569\n\223o\242\030\352\226+\016\223\334\214\367F\222\343\205}\310 \353rq\005|A?\357T~:\271\333;\023_\310?\212\332\244\367\370\004\253\235\010\251*\3551\347(N\035\036\317\372\244:m\325\375\336WZ\231\271L\372BKy\3647\024S#\3756\177\013\351g\270\'\227\355u\237\316\277P\260I\216\252\177\376uNO}\313\230\370\036\035d[$&\274\344\030\304;\342\222\303U\211\355<\020&\026S]\036X\336\033\271\277\205\245^(o\356\276\266)\263\236\005M\374\020{\231\354\203\344 \367 \275\275\364M;\033\213\305\024\033\275\253Y\016\352@\377g}\323\2622\036\377f\316)\322\353\356\224\321\354~|\000b\312\016-\366\375\374\016\254[\252u`\235u\315\n\376\302mkjwK\016\362S\203F\315\275\000\350d\177\362\2266\312/`b\226\320\006\255\277\376\003\262\341\367x\272S\277\343P\037S?\351\236\332\006&\314\226+\321x\003\377\311\r\233\027\214T\007\366\264\231\355\277\202j4mG\r\274\207u\320\306\326\253\331O\377\374\370Z\203\367\242\242\215\374\260\203\365\207y<\305\027\275\322\277Q\322\233t\312.\374\254\022\357>W\375\230\325\272+\315\004\342\237\272a\336\353Ng}\275\345\271\253\257}\247\230\023\254\353\206\244\227\327.\307=\367_\231p\203\033\035\361]k\310\370<\255\375\315`\265k5\367n\256\261{\317HP\234\t5\255%>b$<\3168\271\364^8\300 \2775\306W\210\356\307\026K~\275\213\355a\217\334E\305\315\266\365\230$\306\234r\353\333\265\316N;\354{\034\204\344To\217]\213\257\267#f\206\037\263\r\366m!\351}\\\335\0251\274\213\034\230\305\334\304\373\027=\010\002Fy\260\344\342\3577{\211\341\243\263\027\225\365\037^\226\320a\200\000\027\255\267n\377\304\264,\303x\306=\246pc\016\333G\026\035\264\362\217\2177\316h\236\353\3270f\256e\276\036_\315\335\317\032v\371\315W\214\2530.\322>`.\304\317\233G\316b@T\367\035\206n\001l\006.\324\223>`\322\323\300:\357\3405\376$\231\034\302\266\013L\275\35748\277\200\370_\370\327\233K\336\325h\321\243\317]=\002u=\ty\232W^\260\353\177W\222\003\311b\2353\330\320U\354c\336\033o\013\330?\245\266\360U\341\256\016\341\374\365\273X\006V\270\354\216\357\314\017b+m\335\215\023\323\356\355\327\255\'@u\223\234\317\262\213\234f\242\305\214\220\212\337\n\226]\201\334$5\254\365\240d\364\325l\355\336\334t\013;\216O\235\311\357\177\357\031\202\300\034\253\260\364\310\005\264\276a\375\346{\024)\035\274`\220\030\307\356\270\035=Z\255\235\341\363\232\344V\312\260\345H;bI\003\314:\363\246\016hqy\310H\301\213-\234\370u\313\363\027x\232\314\203\350t\355\266`\264\270\017\241\234:b\263w?5\340\353\204\223\255\030\271\375\331\306.\372}qB\346\264\302\272\3035\256\205\357\206Z\317:\2609\365\2615\000\327y>\366-\217\022\317I\r\201\316\373\325ww\253\361\230|k\2236\236T\273\360\306-`\241\035\253>\t\225\2066\254\220\316\316\267\266\254{s\332\332\330\307&O\325\301\206sV3_@\265\265\337\017km\365\321\207SqQ\230\266k\002\306\3011n\346\270v\334\347\'\275\314\037\2535G\332\245\035\336p\316\346\376\363\272\306\037\226\360\03256\3338\027\361:\255\332S\030\251B\371A\353\237=Z\207\343\350\236X;\370\362i\226\350\277\272A \007+9\225\270\207Z\370\364#~\330\236\2678Km\002\312~\364\005\'\357\372\375M\215\245F\233\340\032\004$5\n\216\251AJ~\250\204cJ5\327v\230\032\240m\312q\025\315\373E\035\241\372\025>\334\255\334\345\177\373Ua\237\352\032\014\316\301\021n\017q\367\374\317\350t\311\033\241w\270P=\204w%\036\325\3061O\225\357\302\033Ie\215zS\273\021\224\304/\347\236\333G\030\243F\'+\t\266\212F\221\344\356\333\267\277\376\037P,\250h\035E\037nV3m\331O\277\273Yk\024\351\327\207v\373\027\270\365@k\304\322\363\261O\206w\317\275\211\333GnSSF\225\377\230G\231\254\360w\273\243\345Z\377\375F\217;l\330\313\253\375n\242\203JGE\251\362\2711G\214\264\365C\277{Z\252\025\002\200\242\235\301w~\3551B\216\333\261\301\360\375\373u\215Y\256B\243m\3153\016)c8\351\277\370\3061\214;\352\256\345\255\215^\313\336\217\325/\002\233ud~\342apq\027\020\215\362\361\251\010\203\370\337T\021\216\265\004\350\'v\370!\325\345\032;\3324r\227\317<\344b\321\r\3059\255{\312D%\325k\336\267}\240\303M\345\037\264Z\337@\322\207k\344Q\0028nqM%\312B!H\33429\216\264s|\234\223+CdqQ\nB\r\372\250\362\212@\017\245\000\350_%\265\222mUDt\335\3528\203)]\271\333^{.\346\361\322\033\363q\213p8o\013\367\226d\231%\366g-\255\327c\216Q\026\'m\261\266\'k\031j\262}[i(w\357\235\315\361\312z_E\235O\352R$dL&Q\0168\356#\225G\026\014\225\263\252\021\3628\250O\260\335\263-\267jE\250q|3}\344\231E\361\317#\216a\021\334\213$\217Xy7y\n\344\335\347v\216-\3260\336\345\"\303m\245\223y6\270\2262\023$\240\271{#\204\244\022Pg&w\310\332\247\350\362\225\334\323~\354\355\352\273bm\216x\321\276\r;\264h\362\244ZBm\305\345\374\223p\233\306\246\274h\344{t2 v,\222\327\333\266\373o\207\236\217Ch\202/\236b\r\342GK\355\"\221\227\246o\032\215\020j\345r\254n\354\346h\241\213CT\373\256\361*t\035Og\001\26395\203z\210\335\023jt:\215\215\362W9\004z\\\2026\016o9\266i?W6S\375\267\337\032\3053\370-e[\336\3237\313\275\016\325$YY\321M\272\372l|\270\216\330\326\340\272vPl\2572q\\s-\274\320$\t\031\371=\335Y\266\236!J8\356\253Y\306\277\377\"\013\362\304\034\265\017!sx\224B\201\250\343\362\344\035K\037\034\340&\203[\375\370\261\320^=\362)t\356\2348\332\303\254G\021\356\3246\025\376\362\235\346\304\302\354%\006x-n\322Z\334\010}\325\356=\356!\2743W\370\366F|\377zN\345\025k\251\311h7p\341\\\255\375\354\204\025\372\027\355\264\372\007\247\326\236\253\276\243\357u\262\335\376\251UU\333\343\"\027\"\0037\375\302\370\333\335\321\353b\201@S\336\367T(\333\264\375\247\\\031\022\271^\276\n\322\233\341\036\235\341\207\334\363rG6\364\247\300\353\310\357J\356\343i\366\353\035N\3636\234\331\217.v~\233Mao.\035\210\3237\210\205\326\031\256\233=eVn\037+\023|_\000-\212\377\273\207\244[\341Yhl\316e\257\361\322\363Zzr\240r\255\323\006\230a\233\"bt|\177\\Fd[\356\307\317\305wy\t\326\375\220\311f\316\032\316%\253C\373\232M\376\334\354\312\224\226_\026\320\313\346\324\251?\212w\277\314\315\017\315&\371\263lj{/\235\361I\311\246\242\355\333\023@\3012\200\226\0005(\352V>6U\214\334\361\265D\323\273\n\253I\334\241\3430\277\277\001\252\324\221Fv=5mm\356%\010z\261<\213\365\346\251#\245\200\036\334\333\2736wm\002$o.\326\371\017\021u\232\365\033u\266\337\033PD$K\311\335\215u\264\237w*\305\327\372g|\266\247\276}3e\370\372=\004\303~[\342\202\242h\027\353\314\265\252v\375~\257\316\267\274\303\247\241\037m\247\331\236@\010\010\374\363\315s\\\354\306\230:\001;\035\305\264\303%\376i\256C\021z\265\350\366\333\342:\251\021\3171v\244\'\375\206{4\301\001\375\315\320\215\205\235w\201E\177}\214\270\375[l\323\343\322\342\267]S\364+\270\025\257\367]\257\373`$\205\273p\276\367\\\'\374\216\211\2575r\264Y!?\251\361Y\024\020\267\367Utx\235\254\257&\266\333t\010\226\2002z\265\334\332G\360\270n/\310]\r\226\375\010\316\327\255\312\252\361E\025\003\273\024\341\361\377x+\377\312+\260S\260\305vE\336\"\001\255q)\330\342\257\250\276\225^\326\332)i\203z\256\013\020>k\322P\212L\035%R\331\367f\021\245\367\322\017\253\256+\361h\2357\017\325_gA=6\023\221\373\245\305\020\255\301\225\345w\\\2256w\363d*\265wF\216\343\365\024\310 \370\343\026V\006\217\271\005\377\337\201\377\302\226\264\253\341AQ\211CA<\363\2700\317\231\261\365\362\347\034\262\370\345<J\324\203\014\243\362\332?4\247\374\035\327\331\000u\363]\373\026\013\250\355\360\333\016\343\221\014\017\351\366~\337I\276\021\303\313O\317\327\271\036g\217\237n\261[\362\3231\315\343I\377\203\316\340\311\371\304S\350\036V\277\262\037Ui_\357\334]^\251\2056\314\326\277v\033G\345p\362\317\261T\343~\203a\204k\017\267k\373\2104}Z\327\220\371\266\265\027o\241\177\034\263\231\333g\313z\303\376\373\020\363\247w\374\202\331\247\351\217\342\t\000i\274\222\0236\344\325\177\335U\327\346\212\3763\236\274\366E\275]b\352Ni\271\367Gt\373\313\222\335\223%\372#\271\372\353\017\276P=o\257\375W\246\277\314\230o\322\374\265,?\023\330\341\017\334>\3761\224\347t\2777h\037\237\265\3145\315u\363\203\030O\325\327\325\246\311\\\021\374\373\257\373\371p}U\270<\376\375\267\016\2766\351KHs\223cd\033Y\376\332\317\302\253\367\010\311\014\375\314\023w8\341nv\230\037\301\375jl\t\261\204\223\331v\014mO\321\202\226\344\240\226\215\314\237|\341\001`Tg2\264/\214\361\242\330\273\245LW\345?\031\315\026\267\352\350e\276\325\177\017{\237\023&|\361\336\365\243\335[\257\255\037[\266S\257\235\202q\354v\307C`D\364We\312}\365\336\352b}R\33363C\003\275\326)@R\332\331\221\215s\035\317+\3363\317\222\356\203\237|\250\362Y\\\372~0e\302\252\375\374\375\334\213m\333\220?qu\275\354\373\335L\006\303\254\327\205>\'\365I\377\355f\244Ot\317\000l\'\202r(\374\230\251\301\257V\314\366F\375\n|\013\315\214?\373e\357U\t}\212\374q\034\377kN\252\230=\314\016\367\324Jv\213F\306Ma\025\215\035\327p\311\335<\337\377\225\353\237\357\223X{\221\226\326\275\216nx\245\265\177\261vU\276\035\032\264o\271q[e\367.\216\265Q\324\305\013\356\257(\204\213\001[[\014f\000\003+E\024~\200\333i\275y\200h\275~\373uu\310\357\266}Q\272\366\344\014V\027\033Z\213\231\234\311G\032\316%\331\314\274wC\266f\252\\\212\026hZ.gG/\23435\253\234\000\346\346D\330\264\t \204C\267\306\263\241\3447\023\215\315&\323\317\023\365g\313&\265\244\345z\310\313\222\202\374\377\207\337\024\033_\350\317\310::4[\346\263\350\232M\203\323\216o\"\244hA\016=\026\326\3551N\367@n\237\301\332u\025\212\306)\377o\212\\\364\327\265OT\3444\277:\264\232N\265\253[J\333+\372\300\024QE5\340_E\207s;{M\266\214@\200\367\\\202\274\023Z\034\203~@wu\354\241\241\245\337\032$>\257C\317\321`;\356\2548\022\337\263\027^P\275\310\213\022\346\235^\353\242\334\177z\033\317\265\211v\034\235y\374\022\005\013\305\004\021\020N\211.\3209`G\355U\375\230\007\027B\177{\030\232\330d\273\242\225\324\342\177f\234&B@\242\217\314\324\326Y\207+\2139Z\375\367\234\231^\035\363\263\005\223\311\347-k\177\266\003\332\016\366\303\313\324\260f\256k[\216\300\227\366\201\277Vfk\2578\263\241:\346\035O\324\333\251\367\264t\363|\317\266\272\215\332\230\362s\253+n\234\323\201\317rx\311g\236f\177\n\270\340\307-\335\246\207~m\332\017\207p\232\276\272ZL\300&\331\201\272\1779?\364\005\375\240=]Ns\347}?\252WX\312\316s\303\264ou\274n\0369\247\367d+X\034\3213\016\352_\275Q\272>+u\310\214\206\271(\375Vx\347\245\035\305q\215\325\352&\361\210\375\215b\353\265h]7v`\337\033X\362:,g3\006\315y\266\337X\307\035\206J\305\220\310\264<\223\346\203s\021e\347\272_\253\'\2758\317X\022m/jy\302\265M\267\345\206V=\003|\363\205\0363\241\"\3439\215\025+\310\023\203\310\321\2163\376sXw\314\351\257e\203\342wiC\365\032\"\362\337\215\327X\333\310\213\300\353-\t\031\305\254\323.=zs\024>\202\2751\t\017/\2103g\217]\010<\363\330\3141\267\227]\347\3470&.g\030\323\034\002\332\273\327\032\267\256\334\266\336V-\"-b,\030f\250\3503\320\340t\033\271\272\271\335\202\303\315\357\010\016\373GJ\372\216\345\0055<\365Yi\003\232\304\221\021\340\314\000\351^c\230;\237\270\314=\323\347\366\353\207\317`\277\267\314\360\301\245\247\3277?\332y\207\254\330\340\013\016\336\244\323\367t\023\026-6\341\320\201p\317\255\356\016?O\275\255^\337\252s\025\367\233\245\027\257ym\030^%\177kmo\353\364\201\215ac\267\354\266\371X\213\236mdt\337\206\333\362\376\177p\350\346dEC\033\266\337 \360\236\317\246\3024m\362\260\362\375\356\377\000u~\023\351\257Km\345\266\336\034\t\220\322\010\372\376\353\354\255\266\236\013=\031\031\257z\335\236/\204\210\371\227\177-\362\367\2155\t\t\034\266z\025\003!pe\344\336`\275K\304W\366Y\231 \2066\220\016jKk\223$\311\332\352\240,3\0276*\344w^\001\320\327Y\3608\017\320\327\235\360\370\244\355\332\363\373\373\275h\304\264\303\207\323\264\241\367lj\341\370\330\023\353\177/\213m\272\351\240Y\"\252\2159\353\027bS\276\243\261\204_\251O}\366\261\313\257\313\377\374j\236+\\\357G\263~\177\207\231.\334\231\376N\255\366\266\375Bh\343\233k\310\365v\362\353q\352\323\256q\211\375\3012\3149\017\342\323\206\375\325r\352\273\271\353\261\243\231we\246\213\267\300c\277\314\207NcP\367pLn\375\231\354Su\337\367+3\316\3574\3715\376\t\345\336CZ\362iE\272\346\350\r7\233\377\336\320)CIE\346d\006\302\346\335eh\266\225\345\372\025\230\364\366\013J\255>\342\n\306\304sO\266A\312{t\267vw\\\335|\205\3019\316\316X\256D\326zc\033\316t\211\271\035\237\222m\305\377\373\276\373\374\244\364|\002\311\237\365[\240\306_\035=Rs\351\330^\3553\371\1775\300\373\354r>5N\367\036\321\323\036w\343\222\357\243\230\347N\232\347\244>\3575\'\212\342\257\2552|\025\321/\340{g3\211\367*\3140-\217U\3079\243\235$y\220\223\256W\232\370^c\350\256\000X`\366\270v\274\304\277\'\343#\330\037N\376\2634\357\256\325\331\326\016t\367\264\372_\303z\314s\307\203\262\022\311\343\237\014\317\342_\017\240\347\245\301\305\346\271\253\351\207Y\364\201\'\270\337\265<a\352\235\262\307|h\314\r\032\000\'U\026\025yg\264zm\256\237?\000\037m\207\177cEj,\306+\243[?\377^\317\214\264\373\\\014\014\324\310O\264k\275\013a\334\221\200O3\307\003>\213\226\333\314\315\334\231\267\035s `\306,[\3365{\240\223\226=\331\314\217\221\177M\244p]\252U\236\254\203\364\234u\342\373\326d\303\2077\270\202\263n\271_i\371\305\311\254|{\032\005\372@\374.JE\365\337\257\217}\342j\302u\234\037\317\000+\200\253\222\353\314\000\347\21798u\272Q\271\314\370\233;\222\354\003\234\250h\n\203\270F\303\321lQ\320\3412\341/\236v\007\220\t\0072\255\310\322\370\326\227kcGI\377\244\201U\364u\273\233} \340a\355`c\206\016\232\360f\366\025\360Y\233E\270\276\370\002G\226\013\'\301\341\222\317\034\273\277\034s\250f4t\321\366`\000\031\205\254\340Z\217\272\260\000\027_\004\205w<\270UI\024\305>\222o.\354\256N\242~\242\260\251\245\214\003\230g9\316\356\265\227\033\276\221\334\331+\363\316.E\257\231#\0063\310\362\270\242\217o\250\321\326\231u\326S\250\261\004A54X_fK\375\271A\322\315T\\{T\034\206QC\ri\214\3030\016\365\306\251\246\342\357\220?\274\001\215PvR\312\345\245\027\014\347\252\2743\244\352\330\321\312>\347\244\356=D\0002\322\206\311fs\202\361\031;A\324\035{W\371\326:\352?EDw\276\003\322 \313sXRP\311\326\324q\005\004\367\335\254\302G\\<\277|v6\0357u\035\241my\267\220\306)\246\367\006\303\333Z\226T\235\326\265\223\000\361a7\224}OvS\312j\032\'=\007LT\000\215\313J\216\261\235\266\344\010e\327\270\241^\321\363wk\017\360\035;!=\276N\342\332D\373\322\000\312\t\344\231 \376=\240\372\215\024o\177{stc1\307$\226^\267\252\324\343\263^\3016\365}\324m^\3462Y\370t\327\227\\c\000\343\220\215\\\254\231\243\306\334\264\034\302W\276o\223\314\"w\272\3061kw\034\304\201\331,\016P\332\377g\361\231&\265\266\367\232J\355tuix\026L\317\234\337.\375\316\331\232\364\261h\236\212\3175\243\241\312\213:\016>}\232\374\346\037Z\261\320\2509\"I3m\037P\275\240Z\315\007\352\231\203u\343\203\257L\031\215S\222\333~\367\261v\244\t\3179\221y\354\317\3251\314t\002@\220\345|\017\215\256\362wZ\350Lf\361\266\030\325\033\006s\326\375\206g\235@\352\320r\270\364\263[A\367\007{\347\363\372\373\274\275\277\274H\340\035\353\365\032;\246B\337\204\337i\024\200\']\353\315\032<\350s\024\177\331\260i\245:\2551p\'\333)\036\227/\375\371\312\326#\311Y\024Q\331\307?\372\354Y\376^\373\265\002\342N\374\324H\235\361\341\252z^\370\355E\333\236B\327W\277.?\334WW]\362\323\240\322\325\252u:Z\207w\004\022\312\02677\317q\245\301d\260\t\326\377\337\241\247#RkivQAJ|\254p\265\033n\nW\355\264\275\361\335\177\236S\240\252\n\3439\377\337\252\3062&8\026\240%\271Ekw\305\255fV\361\024\364\n\003\217,f\320\370]\005o\215-\250\264\033\337\344;\356\036\203|d\375\321\010t\270\232}S\321\337mk[\001\366`\207\373\357}\232\226_:*!\365\002\326\356\376=,\323\201:\356\362v\215\000[\332}\225\247\211?\331@k\n\030\305?u\266\226\324I\220\306\334\256\334\230\272\327\307\346\300tK\222\223$\205\203 \357\351\305\272\227K\240\245m\232\t\235\255E\312\246g\367\305\001\017\250\020.z\277\226\2614\313\366\356>\374\272\245\313\2550{\246gzu\021\212\225\361K\333\263#!:\331\375_g\344J\270d\354Z\353:\332\265\257\373|\272\275\262\236U\275\033\351\006\372\347#\"(\266\002\354\2228\357Q\321\261\321]\233U\272\225Y\3107\376\t\n\3070\207\3739\317x\306\240\331+\373\316![\361\252\325\340\251\305=\342\301\213\246V\032\033\t\321G\032g%\274\"\351&\353\313\224\333EDE\346\355\251JBu~aPN\376\241c\221u\262\025\227d\237\261\252\310\315*\213s\304MA\"[\266\3432L~\304P\t\\{C\210u\213\220\266\345k{\275\276\335\267-\331\336ng\021S\241b\262\031\226\017\351-X\270J\365\241\336\241\2673\032\307\274yp?\214\302\366\324Y\323\3724y\314b\222Lf>\331\263\266\300@\372\275\246b\306\t\270\017\366<\021q\350\267\330\250\227\336\035\357[\213\304q\000\257\341\326]\3567\027{\303\376\036\377glo\341\326\230\032\030.\000\370\014X\337\363\335\310\374\n=\014\376\342\014\313.\306\302A\340\273l\320\365&\370\016\"\322i3\361N)\023\325\014\317]E\034q\271c\245\026/n\204\305\021\303J+\363\202u\306\336\223\253eQ|\270\006\rn\334ZT\240)m\316^y\t5\236\3619^\276~\032\006\217{|{2P\225h\322\362\230\255%Lkj\376\203\2365\335l\331\331\023\364G\362\367Or<8\261E\022J?\246\333[\035{\356\255\225\257W\217\372\0279\330\235\266\000\0032\'W(\242\262\241\023@\375>xk\213i\367!\360\024\371E\003\312![>7j8\247\311\213m\204\322\246\310\31643\345\026\230\025\356\317\341\273\333m\337f\357l\037Af\265\032i\272\224\370`\231\230\245\225\236\354\265\036[m\277\351\317\376:(\255\224U\325\307\375\267\365\252\365\203\023\013\356{\n\377\327\266\334\247\267\177\013\177\375\352\300\001)\211\341Uvw\337\250\023\335\266SL\324N;\234\377Okv\236\227\213\245\232\342\352M\215ko+\202|W\335\267\036q\236\274t\327\261\213\3353X~c\363\307\216zq<os\312\362\356b\256`\031\353\261\335c\014\230]_\026\237\003\335E+\000Y\242t\251\035\266\217o9nqT\371_m\346\271\005\0377v(\243\276\262\2511\274jq\271\347\203\027bm\251\"\336\326\270\325\037e\361*\325\234\346$\3569\311\354\276\211m\223w\251\235E\336\376?\275\312\311\217 \207Y\235t\357\335\322\301[j\261\227m\305\026\276\265\255\272\303&\245)\360\262f\354{\240\227+gK\357\373\007\270\341\365;8\336\236\356m\237\001\347\254\255\237\367I]\212{\274\203\276v<\214\3220\363\000n\343\271\226\347\'\034\210\271\303\3159\313\240\257G\034\315\200\351\225\326>o\216*\300\031wq\213k\314\267@\337\372p\372\252\033\374Zn\233\312Mj\227\226\225\305\310\201\t\266\366}P(\036g\242w\027\203\340b\024A\225b\214F.\217\353X\\\246\352\373\224\231B\r\271Z\003K\2554\033\272\303\256H\213\335\235l\232\357\r\336\376?w\337\212:\354~\200\032\332]\016\257\376\362\275\232\303\376[\245\322\351}\237cm\003\2618\271\236\312\323\323/\016m,W\371\264\361\n\337\373/(K!^\355\302\226\312\355\211E\211\2406\030B\275\311\334\255\003<\021;v\333\240;\024\326\3324\354\240D\253\275fF\357v\2070\242\027t\336\276 \330\250V\025=\200\3132\355D\363\233M\353\024\326\267\365\337Y;H\264\331c\225\302\247Nl\374\230nK0\214\267\373\357nU(6Fj\311\302\344\035\314\372\035\2476\226\241o\366\304\3569CD\275\000kaF\312w\030k\375\217\314!om\256s\177\260\031\274M\022\300\235W\221(j+R\220\026/Y\373\234\213y\313\331oL\034\314\264\337\262_\335+)c\320MS\245\332\214\025\257\302S\037\037\325\235E\273\231\301,`\257\\\3310\265\251\347\317f\364\275\203\211\034G\306\230\031\305\213\030\305h\033p\201d4\367\355V\257\232\375\271\257u\327d\215\374c\373\271\235\017d\347\314\270:\221\013e\207\277I(\351\025&\265\376\236\206\300\310\274\366Od\244\373\344\253T\350#\237\350\277\344e\263\01027\377v,l\177\302\264\365\253\317Jj\260\273\317}\027\232\246\243\323j\006\357\376T\357f\016\340?\034f{%O\340B\312\307_p\224\266\336o\026\324:\247\376\355=\350\272S\3653\257\352\365\310\330\027\274N\010s\221\362\025\036\263(Wm\266F\307\376/\357\223\313x\'\332\2738!{\265\223<_\301\210\357\357\222\310\310\217\377\360n\335&\333\\;h\251BF\374JI\300\341\356?\023Qy\226\351\214\340\t\327X\254\305jM\\w[\237\212>\316?\316~;\014\014\376\'i\016\375\005\277\002\016\320V\347\336\225.\204\350l\021c\342?\266M\323\255[r\310H\314\320\225\305\373%\327f5\334{Gf\356o#\270\362H\265\022\234\347\232\247h\320K+\332\007Vok\027(\307ak\224JS\225\326\335\203\377\377\330\317\364+R\300\211\264,/\372\'\276n6s]\273\315\2646kD\370\325\266\311|\177\212<\212\234*ib\207\322\204hK.\261\305\025\241\356\036\261\363\3668fd\312;\272\'\242\340\\\363;\375\177\256Dh\177b:D_\232R\311w\21679\022g\356p\030\3537\345\256\270\317f\310\273\314\234k\n\353\227\371%bo\007j\210\277\331\2357\036n9\2404U\377s\010\325hq\224>]\210_\373\366\266\354\351\314\2044\220\351\367p\343\344 \214\000 \210\267\224\343\316\361\276P\300\321\242\335g\370\232?\365\237\353\032\037z\211/\002\262\320\252)l\237\221\361\2736Y\232\331\314[2\0063\346e<\247\225\243\357\376S.,gU\373{\377\177B)\355EP;\206}^\330\262\212Y\006\305:\200\351\3752\231\367\315u?RO\376\373\372E#P}\252\262\236\344\0101d\222\352\210D\335\362\227Y`\274\245E^y\000\372\020z\333\334\223\227u\254^\004\341P\230\340A\007\377\242\346V\347\357IO\276\206n\272\302\350\377\240\370\304V\241\346\372\267L\032?\'5\241\337q\203+\262\007o\032Z\365\t_\233R\336\272>|\316\336\r\272\271\226ky\375\014\020\356\344\226\324\334\330?\347.\331\326\361]\252w\226\370\365\303=\326\205`|\203\357\300\351:\375w\260@\225\004aP\315\273\310n\244A\352\235\364A}\347\217\254\027\301\014c\353\260i\214\314\245r\210\333\377\226\233GGW\277\216\202\322\262\261\005\034\033>\245\265g;\367\227\343V\270\350\253]\351v\372\274Z\r\037\031\245\337\372\177\035\306`\352/\027\320\272F]\367o\177\237\237\376`\242\325\366_\375e\306}\262\237\034>D|n\264\2474@\031\317 \241\037\211a\224Nc\241\263\177\243\203uZ\3651\347\251\350\0305\326\203p\326\202:o\376M\344\312,V\206\213|4\343\215J\234\334\322i>\226r\323\227\274\274s\3618\371\204\'\'\262{}4Z\364\364\364\364\0007O\334\343\317[o\251\351g\014\210\364\3623\217AxS\312\357\216\326\203v\233\375\033\234\325\316\367]\261\375I@\203\016\267\247\356\365\210%$]\315\033\332\0266\353\220\371\255\272\322\031E77[\255\327{\335\334l~\333\334\255\3427\306%\017rU\373os\247\247\355\314\342;\322\353\261B\3625\024\376C$\337h\272\016\271\256\353+OOI\203%o\377k7\306\371+\324OuKR%\243\324O\351r\305\004\267\317\035\000mBPk\331\377Cr\264;\023\314 \202STI3\332\002\204\371\327\213YK\333\225}r\324\375{W}\322\355\327\324\323\3525\002\014\303:L\347\303\177\222\362]\3420\252\r2\213h\275?\276\025W+\022\244\343\022\020}\000\311M4\357\rcY\271\234\213\347;\210S\311L\356\371HH\247\337wuj}\363]\361\216\212}[\026@\nG\r\306b{\367\3146\206\310\324<\345=>\2627q\373hP\373\354\237Q\225\316\025o\232\357\336{\034\000\213\276\366\353\242\314\362\254\345\330\346<\336\341lK\375\237\222\275\376\177\305\346D\347\365=\002\213\367e\375\017-i\337\330\213}\230m-\262\251\336k\177MBbQ\3062g\245\315EE\247\370\372~Q/z\035\375\344\256bUV\305\324\3121)ny\023\265\224\223sdx\366\275\031\034\352\362B\334\373\315j\237m\355\331O+\266\215=;wFnb\002\222\325d\235m\351\3729\333GR*\236\370\276t?\032\325\243\002\3231OLB\262\214\261g\255\272n\026\376\244\331\242\243]\255\312\355B\205\240!\261\261\306\211\254{8\217q\325\373\262L\237\343rN\267\312\223\304\016\246A\004\240\217\253o\334>N)\221\316G\333\231`\353Lp\336\211)\022\207\300\374o\033\013<\251\321\013\267\220r\207Z\326U?\377\303w\333\352T/\277~W~{#6\303f\265\234\365\364B\304y\033\364\rZK\372s\314\277\353\206\256\376\024\236M\254\360\375\331\263m\335~y\260\202\336\237\354?\252\177\267\323\007{\232\026\332\323\177\305\001\272\236\376\364\203\374r\266\256\\\223\310{\2726\214\345\325\373\357\364\371p\375\354\200\213\370\277\325L\233\274\207\027m\257\240\\7\001\217\021\337wp,\357\337&\354\024\262\266g\271~b\027.m\276%\276e/T\333R\262\227\333\262\300\272\034j\373\324\262\210\270S\256\265\374a\377\357\247vl\217\236C\231\006\272\207\225\261\337KK\300\273\312\035@\334\020\2336\352\244\'\004\020\221[Y~\0307Xt\231\357~i\272.Y\0052\260B\257\360Skm\016\206\361\222[\267\270\251\261\257rQ\245q>|Fe\352J\247]%\016\260_\364\376\355\203\037\365a\037X\025\306U\373\3761\223\335P\247W\330\330\353\375\0335\2146\225\255h{\350\014s\033\301O\341\246\245\030\235L\367\243\253ag\273\310\270\363L\356\2375\332\003\211\237\264\376K\211\255\210\356\212\260\2427\333w\335\344\021\035\372\217\233\200?!\310ov\373\327#\315\363G\344b\252h\345\315\315}\226\347\351WfR\271\277NF\3407\273\"\344\224\217q\272\326\344h\357v&y\034A\364\006\222F\346u\363\214\355\214CJ\022g\277.\257_\177\373\346\255c8\317Q\243\352-\370\202\033\365\014\241\315\016x\202o|\332\\\0270\361\253\224]E\317\352/`q\271\177\365w&\322+\373\200\031\3053\317g\312wZ\366Q\277\315\342\243\204\344\303nv-u\300Pb;\206g\377\305l\033\375\376D\033\327\203\342}\213\332\025\013\374\374\3729+\002\023\320z\256\372.\344\373\006\2317\3657\302#\277P\276\275\034\370\250v\210\215]\370dA\350\263\261\365\000l\315{\335\032w\216n\364\037\326\221:g\021\335\t\224\032m\271\257\324tL\207l\255EmT\251\257V\263{\365\226\274\214\224\260\314\327&\323\216ryv0\335V\236\346\035u\257\326=O\224/g\315\316\270\205\212>\211k\'^\252\300\217\037I\235\350\233o\007U1\342\022\366\323\255[lK\276\246>\265\207[\334(\256\257I\230\347\"3~q\3733e7@W\333\324M\016\363\262\315\267\341\313c)w+\022\027cMg\324\345q\225E\2651\335G\267ptEa[\271\006}\262\230gv\337\rg[w\310\265\360kW\272S>\366\335\3565\2401\214]\267\2614\n\005\352\026\367~\272\357\034\333\251\346\272\270 \'\276*{\334\275\306\336\323,\\\252\234\377\355\022\227\2433\351S3\037+\231\240,w\330}\240[\364?\333\261%\230e\3157\353\367\3012\333\351\225\310M\242\321k\031\227\2436\346\014\273\031Z x\177\274\373\006b\260Dy\026\224\252l9\037T\251\331\211\236\365z\365(iZO\232wu\306\260\237\036\302kX\372f\275\"\256\316_h\212\317\266&\352\357\225%\207&\2635\234\241\274\026\340\3479\213\333\265\320\315r\252\264\301\247.=\323I\021\340\177\002\366\\\314\363\253\353\2431\203\234V\371\337\010\3437/i\367\270\326\024\343w\232\254\225\216t9\362y4\206\363\214w\222\264$\252\222!\274\362\326\265U\317\234\346d\246\232\372\242\235\372\303<\3224\337b\335\236r\362,\022n\246\331\3444\262\353\227\262\r\370\032\235t;b\262\277\2722\354\331\265z\326\240\200\346=\013\366\313\003\260\017\001\367hOR\335?\240R\367\273\025\365[\330O\202\307jg8\237\205\352\211\355t\360w\360Q:\303\203\345\261\225\303\316\271\356\204\241\346\345.)\t\031\3176\225N\305\251\377\337\207\362\344\t\375\316\034\345\336\367\222G\217s\003.5\307rBGp\365\333BW?h2\255]\254Eg\352\200M\336\347\252\271\217e=\276g\312\310XN\0345`\257~\274\364xT\030\277C\214\tK]\257\360\361\361\031\t\237\372\264\034\316\254 \177\'\314\3571y\004\343M\023M\177\203\216\267T\306\345~S\357\017\332\244\325\0013\215\242\357\211\2304\370\353\375\361\n\374\203\211\343\010\270\305S\246\243\322\344\327\213\345S;\324\341\303\376\r\205\034Vs\217\337U\\:\361\217~\277\2474\243\322\272\370\000[\346\275\003\361\226^\356\267e\344\244\367\374\267\332D\251\004\246\226\\\371\335\302\260\362\026\347\365\257\021\031V\324\234\266\233\364\216\321\372a\3067\231\367\304\335\346\177\360\325\312{E\375\236}I$\314\363K.\363\362\\M\240\274\363\264\347J\177\236\307[\327\320r\304/\312\316{\017\207\341[\317\234\3505r\255^\375\213\262\236\261\365\320\017\367\317u\227\272\266\007\357\005\355\206\265{\234\025\342\\\217\375\\\377&\231\260\202\335\362\376\034\373\355\325kQMVfu/,\005x\356K\232\306a<\325\374\334P\035\375\225V\230\363_s6\361l\355\377WYq\344\366\274\0009=\257<9\201\226\337*e\235\355\323\336\250I$A\235\361\334\364\376\324\341\327\356\327\330A/\2173\230\344\\\275\360u\223\210a \367\364:\030gO\307}w\316P\250\267S\330\345Zq\274\276Ut\303\256\032$\260ry\247|z\244qj0\327\236YVK\262uP\"/\013\236\367\317\304\270kZ\034a\357=\355\"\221c\243\314\276`\372\253\274\317\347\334j\334\035\271\276e\245M\037\032\353\333\240H\r\336\340-\'\356\362\371\225\231\3507\201\365\327\367&\243\317\235\352\347I\n\201\211\t\000\235\237\252\224T\214\017i\264\201\363$\303\271&\203\221\227K\261\007*\375bK\267\020\347li\377\177\367\267.O\372\216\346_O\234\273\232\346\341C\256[t,\210\036g\245\311|orNaX>!w\261\314\240\255\007c\377\213\215\234\256FE\315fR\354\022\037\316\0349\333C\331C\212\263\224\307m\225\347\277uab$\t\377G\220\216\317\341\306\234A\363E\242\237\271\247M+\356\362H9\373\266O\217\241\354\177\341}\310u\177\222\202\025\274\177\327\363_.\307E\224+\276\331\205\343\025\256\\s\366\375\371}\321\243\021h\220\344\351\017\210\\-\367\234o\366\377N\355\354\245\366\000\241\346\351C1\376\261\317\355\3256\306!\223\3410\305\333\016\003uow_\232ZS\342\311\223\375\013\023\246\223\334\007\361>\n\317\000\330#\373\237\177\002l\263\242\355\320r\010\251\177\\\275\352\025\005\341A.K_\335^p}\337\224\201Q|\201\350\366\341\276?\377\377\372\034\266\273l)\300\306#\031m\205\336\263\033g\336}\264N\365D\271\217\037\207K>1\330\222C\274\347\255d*\177a>P\274\340\275r\261\276\342\234K\233\024\211\241wz1\325\356,D\323\331Np|5\235:\312\213\200\355\255I\353\020\377m$\236}\377\374\243\214\007\255\377\035>\304\364\304N&\272\365{\365\r\360>v\312\342y\017]\374\343:\257\352w\341M\266\326\037\236\306\241\206\272\265\332\312\004\270z`\377Z\267i\367\t\357*w\372\315\335\005\327xx\265\277\277W\331\206\305n\304\363\353P5\245\025\346\336\033=\016\357\200\010\026\237v)\262\261\333*N\227\363.\013\3666\321^^]\276\025\307\226\030T}\206\301$j)\336\376\301\244\335[_\250\242\235\261\374\360\022K\035=_)\241\273\177\214W\351\363^#\337\271\216\375\261j-j\232>\231\367\263A\236z\357m2\375\365\247\207\261\303\030\234cI\324\227S\274\314\375\272\025z\215\025p\320x\373\224\206\375\274D\001\336\250\032\315\273b\267\263\374sn\223\233\371qrNW\317\310\316SI]\252\240\265/\237\343\333\323\375q&)\270\026\304\267\200{\215\332\3379h3gl%G/m\261\277\362>R8\223x\325\350\217n\222HEN\362\257\372\275\243{\257\024\333|\367\010Dm\342\216\221\243\305\366\2034\213[my\214Q\366\333\222\t\266\230\037\352\302:\254\243\212^L^\'\333\210\307\037]\252E7\027\037\366\366\365\034\200j\260B\237\014\245\322\337M\306m\265\026\212\037g\214\r@\204O8\341\235\234\223\336x\003\336{\233\307\303\267\252~\347\235\032{6n\362\356a\362c\201\207r\366\026\203S\032\245aw\353$\367\356\220\245\0357\356\317\236-iNe\027\024\367\353{y\031\025\206.\261\365\321\225\261=\t3-\234q\313v\361\217k\235\003\352`\365-\255\222sD]\272\013\221\016Dz\356\350\331\221t\377\274\276\350\330\362\252\246\273Y?\331\221\371cd\033\201P\312\273d\024\031\213\277\311\235\333\361\202\371y\337\371\276\303tJ\234=\357!\331_\366\261\211\266\331\367D\322\367|\310%\330\"[\315\375\231\337IC:pa^CE\265\260\246\241\371g \205\201~D\351\221i\245\307\363\'\032\316\343\365*\336\360=-\303\257\240\205m\252\317\276]\014^i^E\373\315\025\276L\222\371pd\274t\353\016\324\016\225\3466?\360d\373n\251W\241o.*\227\343t\312V\036\362\376\267`|\203qIA\351/x\267\246\343h\226\375\3527\264\027\335\353\227\260A\304\0336\342_\354\310H\244\017;\314\242\225\366\304*\363[\210\304M\023\257\212\0051\0366e\323{\244B6#Xk\345K\0244\316\343w\344\357&\374\234\225\303!\377z\2752\027 4\363x\350\216\343f=\222\";\377\3628\\\242\271\331\036j\344\327\320\020\025\314\3252\027a\333\307\344\036\313\202:V\232\334\2047\254\013\177\264\370\271\237\3365\342\025f\303:~\262\205em\264]\010x\211p>\321\346\337;\260I\201<\325\277\246s\302\273#\'\353p\321(6\375\366\026\203\216\376\372u\"\353\327B\265\003\260A\361\211i\341\363\201X\261\223\200\314\245\332\207}<\033\344\216-\357\306\334\313m\306-c=\337\260\316n\270I\355\235v$\222\260|\314{Y\375\r,\265\245\031\357\t\245.\200c.\002\337\333\340\001Y\244\374\270qi\242\250k\316\353\304m\235\207\262\375\352\251\363\227\230\364\354,\367\021o\364a\\E\225\327\345\277\305\371\221\024\374\013\225n\333\363\210\332\270\237\276T\022\303\026g\350u\376\tt\371\237Z?\201\363\330\230v\377\356{\350X\351\310\255jYg\031\363\216Zx\215\036 [\263*\244\235+\203\372\361HU\263\367\365\211^\325\374\312N\330T\322\346\013\332\026\217\310\215~\260\013\274\222-g\256\344\236b\\\316\2545/\243\013_\0225E\346Nq\276>\003\272\307\024\357k\306\375\243\215\274\376\271 \3474\371\377./\236\3068c\230n\322\357\216\031\tT\232\364*\000\003\251\217\002\356\210\241\363\221\346\004\271\217U4Z>I\277V\271\036?/s\341\333s\025\224\370\357\314c\334\307=7]\311\363iC=\351\326\254\3540\375p-\237\247f9\314y\210.\213<\323O\245\272\021\210\007 \'\367 \013K\363\222O\017\\\255J\314\237\310\357\"\3116\035yW\3759!V\364+/\255p#\352.\261@\347\036@\261\357\032:Vs\016{\017\257Kh\316\317\276<\215\235\307&w6\303\364\233Y\205%P<\311\003\241\353\271\227\347\'\347q\331\337\006\271\340;\217q\2743\225\332\213\264\344\353\017\254\034O\';n\200\251kAY\272\340\351<Q\034A\3328\342\366I\277 \264d\231\325\333\254\032QM\316\013{\226\364D\310\314)l\027x\240\325\016\023q\231\266z\026\356\277\2253L\256\237\373k\014\221\024\352U\201]\273\3554KLJ\250o\014\353GjI\301\267+z\224\357\373\007\327%\257\376\357\273\263Z_\273\206\375\004j\317UG\026D\260-\360\233\247\377\364\313\177@cP\232\355\232\032\216\035*\236\376\004\253\325\202\363)\2507\374\330\033\324,^`\353?\371\\k\027X\346#\031\360\004\245\357\275\317E\251\377\351\035\' \177\276)\221-\307\300\265\024\264N\336\213~\235\327{l\230\306\010\0147\rb\326\002\324\262\241\263\272\214\342}\3261u\225O\315[\277\332{T}\365*\321\026\363\303\032\352\260~\303\372\344\037\344\260\351K\245\203\327\274\254\370\325\022>#\377^g\271\355+\374e\0343<\3253\316\010*x\261_\304|\216e\347n9@1\307N\236\320@\245\216O*gkc\304\252\246\261{\356%\306\375\337\3735\373\230;\206\333\340u\303V\221v9{\367N\237MV\\\317\240\205U\227 \247\230\277\251fb\250[P_\227\227\254I/\244\233\177\227\225\204\204\306b\316}\372\241\262\334\235\207)\210Q=\222av\005\244-\337\253\337\366\316\317\362\210\253O\260\221nP\267\"\267\232\340\rk\313\030A\262mm\317\227\277\367\240\237\225@A\236\345<\371$\214\017\373\364O\276\377\214q\331\031\345\316\241P\220\2555z\325\036X\344\201\336\376\371p\362?R\355\0078\363\322\017\330\037f\0238\243\347\200\3257t\325g\021\371\366E\365y\271\333\327\221^\241\026?\016s\022s\231\365\373\363\367\0329Y\327\2612\303\214\345WK\266\231\343\362\275\274L.e\277\361\272\245\027\232\317\261<\305\266hg(\357\342\361Z\006\267q\250=\316?\377\356\341\257\231\'8\221\353\3709\336\351\351\376\373Th\307Jw\225v\355\307\234\363\207\322\201\007\007\352e\212`1k\201\257\214B\356\267K\3662#\345\\Q\376y\221\020\246\272\347jQ\2577\206>\332\302\010\334\236\277n\327\217[\363\344\367y\034I\007\337\264q\0266o\016\341\274\3403_z\316\366p\2573\210\326\235\373w\226\213x\310\213E\243h\216e:\314\r\002~`\002y.\3629~\203< j\177x\2774\246\247\177\373Z\210\362k&\237\371$M\362?\374\030\202\374\323\345u1\r\341\215\351\246\230yi\247\020\327}/\255\036\207\377P\201y\335\336\356\251H_\234\224\021\343\346\272\021~N\363\316,\325\246\371\265/\337u\205\005\006\333\177\276\245\037\253\372\217\221\375\001P\2516f2n\362\234\3041\010\2136\007\371d\322iG\373\240wB\362\324<\222=\322\367;W\335$Wc6Y\341\265\277\247\352\27516\202\274\364\364\337\323>\230\375\346-\272\207\271\333\005e\3559*\223\223\341\004}s)\221\273\310\3102Zj\264`\204\265\3473+\023\327\331\367\311!Q\247\254=9\036\223W\216\316\266\274\3501\003\206D|\346\365k\177N\225\311q\3715*\303\306\010\333f\313\301\017x-\023\311\252\363\t\353u\037\271\337%6f\277\366g\231]\332\r\216\226By\346\212\256w\305\340\215I\026\177\352\272\301\2633\242\r\315\240\215A\253\375\267-{Q\343\325\272\332-\035|\357\217\325\374\317\246\326\022jo\212\362\311\341\210\362\267Fb\035\001m\004u\342\030\237\372[\345\344\264\026\221NP\020\373\366\272\3763\277\024\221^\314n\251\210wk\t\345\240Kk\205\266\331y\347\365\362/\367\212\226\240>lV\216\247\345\311Z\367\020\007\315\323\320AL\202\254\337\030\350\336\323>\210\362\013Y6\246\242\211\353=f\251&\177\255\353\324\024\304=\311Y-\0067P\264<\301\312\303\357`\334\242\277s\025\032^\252\212\010_l\332\203r\317)\356@\246\275\321]a\257\320\312w\270\344T\200\373\274\246R\350\'L\n\325:\377\203\202q\365\370\246z\034\363Z\357\373\n\373\\\300X\267\307\245\321\357F\317\303\363\200\036\304u5\007\240\323=\035\205\024\261\266\217m\336\252\222\r\356\371P?\375\212\3627\263\036J\031\262>\363\376\255\312j;>\372q\205L|tb:\002\214\343~#w\220\034\013v\335\373\252\237\216\024\252\270\r\272\274f\243\265\240N7(;\3045\240\337E\276\t\215\215L\ne2\312\335\t2\2434\242\221\006\337\252dd59?\254>N\277\357T\234\274\323\345\337|j\262\245\274\257w\333\022O\343J\"\360\357\277\327\375\350.\275\336\251\357u\234\215\255h_)\263\357\237b\247\317>J\272\327\337/\364#\332\357\357\215{\236k\376\340|w\353:F\275\002\305\240]O\215\037~\316c\\\323\370=\345sI\356\344n{\002\223kL\3276\273D\237\355\325\002{J\241Z\034\302\003\353y{p\314\272\301t5\254\213\233\333\336!Yw\274\263\177L\336\227\274\304\267o\366\333\025_\316l\323\246/\371:\0253\253\235\311T\235\305\020\331\372\225N\010\'g\377\251O\027\234\303t\331\253\257w\211\025n\207\267U\365\334\344\325-\344Z\346\374\303s\374\370?\374\203\343\234\233\332\025\263\273x\0363\002\301\331\353\303&\373\354]z@\231z\337\252\306\321\345\363\241\335W\227\216\330\013\337\333\355\267\274^\376,83O\343a\325r~[\201g\320\023\366V\221\355]p\302\346\344\261\001\ttE\227Z\344%?\213\'\360\010\251?\377i\261==w[\017\324\033\034\n\342nn\204!Z\353\237\235U\013H\303dT\013D\375\325\272\340\330\243&\017\372>2\215s\324\241\272?Z\363\007V\373\312\273\352C\272\273_\211\353Q1$\333\323\362\252\r;O\356\376\002M.\267\330{\353\340\364[\336\362\021\375\326\276\346/\350Y^\324QUaU\306xv\333\254,\036\017\362\347\355\267`\\\013\355\261~\367-\360\177\266\344\263\r\007\320\227\023\342\035W\377|\377Y\317\253\213bi\212\263b\n\350O\276\276wr=\230\3268\226p?f\347\236bwd\325\316\3442\347e4\"\244\005\035;\201\243\247\\\217\277\251\272\025\014K\246\247\277KC\222\016c\211\270\022\366\232\260-\272\\J\004\032\365\030I\201\277w\237|\235\250\314\247\245\235K_-[es\224\337\037\037O9\337*#\014\276{w\016\276\t\367\377\001\035\245\250]O;\272\006\370\177\257\354\036\2237\'\024k\345\365+\221\236\344/\372>\205\3128-^\370>\203\"X/\362\026\010\363/\202\322\307M\357\340\237\351\177\364\3775>\245i\232\177\216r/\245\227_[\002\356C \377\340\035\363m\276$\330\263B\255g\375\357\022ost\361\377<.\003W\250WU\340\205R\366 \031\341A\275YAg#1\244O\177\317\005\230AiY\326\030\340\205\000N9\311\373\356\255p\\N\257n\305\306\n\350\225`\3172\014P\213\222\257\333>\265\327I\262\244\347\232\274\363\305m+\231\302\026\225:\177\337\354t\014\000\3479\027\321\374\246}\3271,R\r\200\367\365\2639\307\016\216\0357\277\250]\305\017\213Y\035\321\001\326M\207\231\257\275\377\351\372\nV_\030\271\205\257\334\321{\216}\233\365\005#\271\237\253\370+f\321\017\377\024\377\373\233@\345K}o\376P\351\257\005~?\306z]x\333x~r&}w\270.N\212o\326/\036\327\376\rS\334X^\313bx\247\274fc\251\372\353s\336\336\377\334\353\016\231m\374F\236\363W\266\2034\277\354^\254Sdf]\337HZ\014\370\231\263\364\341(;R\320\224\202`}\210\223\250\203u\262$\376\0101x\336\266|CH\275\361\002\341\354*\235TC~\276\367\247\347\177\024:\312\014\rw\321\372~\2014\277\202/\3738\227\'.\034\032D!\023\206\250+J4\307\2366A^[{\364\245\225\265M\234\377\"w\373>#\377\345\312\273\377\217{\277\031\020T,\002\346\207\241\246\232\177\247\027\225\373\220\227\334^\342\371\020\235\205\376k\340]\362/\033-\\\340~C\374\266\314\234\336\377\007\223\201-\357\320\227\255\337\033+\306\033\257\324\274\036\036&\230\256Ei\242Oo\030M\262\367\236\241o\273\'\021\301\275\245~:\177\366[\326w\360\274\330\261\016d\346_\230\240\317\177<\252\323\371FkG\312ow\260z\337\344}\375\372\373\034\267\373]\275\300!y\247th\373\373(}l\372\2562gx\326\360D\254]\214\2429\030ov6\023\371\026\331D^\344z\374\233\257\260\005\221\033\324\275\\\274mP\332\3105\346\202\252\302B\\\003MS\355\267\263(4\372\177W\001\364/\376\324\351\337ZQ,^\256=\002g#\"\313U\0268G\245\317\202u\214\372v\230\204X:D1\032guG\035\232\272\016m\345\035\023\304\023\212\342\345\375Bu\236\252\177w\246\3567\272\324Tz\201o\252\177\2055\307_\257R\214\272\352\361\277\351\233\3201\311;l\334\034\265\273I\314\273\035E\333d.\353\024r\264\312d.\216\3102\237\006\246\314\307\360A\374.\3678\352\337\025`\331>\366%\376\007;/\243\247\313R\235\255\333+\222\301kZ%\010\241y\375hi$\004~\270K\265\r\017k\342\0173\274\345\302\226gP\277Q]\252\310Y\257\013\006`\232\377\215\335\363\234\345g\037\354f\346h5$um\236k\321\022\215\017\351zW\273 \371R\315Z\r\332\273\024Wg\307\334fDkC\325\251\340\206\226\2343,\314 \317e\255\024\322X\236Y\364{\234dd\216\374\307\364\214\221\220\230\350\315!3`dv\373*(\251}\232,\277\215\234\257\310#\367\355\363\033.G\035\303\202/\355G;\275\370w\355^\202\275\2671)\213{b\215\245^V\263\373V\026\025\274\"\355\377zB\323\033\224\367\210\250\020}\372>^\321\205\021\333Y\'/~\377\346\324\246]\322\216\257\006\240\373\333\330\"\333Ig\377t\216\3719\233\254\363\225k\224S:\336\366\377G[\355\302m\274L\n#\331\373\241\277\335^`\356d\023\372\304%(\302\366\343\231\'X]v\324\371X\214\223\277|l\331\235\354\004\213\212\205\217~)\376\365\207\266S(\032 \252\230\244Me\303\023\353\017d\002\0237;\375\344u\277\205\276\332\003\223\217\332\367k\366\372\3752.\2224\367\2575\224~\377\034\016}\013\177\377{}\2546gk-\365\376\317\325\273\253`Z\351\373Z\355\035\316\202\327 \322\215\013\007<\031\247\036\323y^F\376U&>\363W^\276\212/\377\036hV\205\336\270\177\007\373\375\302\334%Uf3\216\277\022L\220\202ey\013\\\302\302\302\233\023\031>\367\234\3079\315\231\347|oe-\344h\037\354\310\320o`\331Md\366\342Y\377\323\227Nc\362\376\200^ovN!\317\304\247d\030N#C\334\237[\216\373\214?\354\377#fkzl\254=\233 \352\327\377\370\034\205\253\273M\374\335\354$\033?~\2336.\003?I\314s\260\277u\026\352W\373\255\334ov!y\272\252\252\225\0313\244n\342\353\353\3548 \201D$.\330\200\277E\212\336\230\214\331\370\3620\324\333f\315\231uOa\335#\327\376f\314\215\304\222\215\335\377\2315\250;dP\226N{\364\323\360=\375\014\n\277\"q\205\177\014\317\266A\343\320&\373\t\373\367\305\321n\344\301\033^\230\223l\037\212l[{\304\247\230\236\315\245\234\272\037w@\000\030\233#\340f\211a`\260km\032\010h!\277-\245\246\222\313D9\2236QEo\215\367\225\220\024\211\333\266\227&\035y6=e\352\242&\206c\010m>\332-lp\240\362W\263}F\303\334OA\026\203)\322\342n\3469\343X\330\273\371\240\2275O\266\323e9\250\213\250\221\332_A\\\274D(#\332\335\266\371\365\266&%\224B\212\030\327\205\241\216\204\207\214SuG\201l]\213\2755\255=>\333Y\224\273\342%\\\237\372I\257wWS\367\263\241\255E\337\037\245\314\316\320\265m\261*n-\245\336\014\230\245\336S\310STE\356\242i\350\370\226zJ\356\300P\355\251\351\332\331\276<\3373\330\204\2348\376\301?\253*\346i\367U\221\243\272D\331\213\014\262\031\207\360\203L\333\327|2rRi\364\364B\236c+Cu\014\210uK\2405\231\346s\214\023l_\024\225m\326\014;\235\016hsC\235\231\322g\372\233u\026\245\341\335\356\367\023n\033A\n\351\373\207\223\341=I\337\356\255mO\203\311\326\326\335\336S}w|\322;@\020U\002\014m7u\232\360;\373\377\334\347\372\226x\275\233\254\035\255_^\2053\033\366\220\277\267\256\365\305\275\323_\365\364q\236\367T\357\275\347\346\256\361\342\247\217b\276\352\255\323y\203\t\237xs\376\2104\321\225\230\367\003S\317c\212\243\216\217\347\n\363L\275S\374t\335dA\216k\225\327\273\370\375\346}\017c\332\373\362\3577{\363^\210\327\002\300\376\340X\234\356\267g\236\376\177\305w\276\253\031\323V\266\031c\370\002[\265\254\036\306 \205~\335\226Wf+\232\255\266\335\033\207\000\365\316W\276}\030\266\315JA\360\032\"\342\330\242\227\231\353\023>\034\016\264y\007\213#\300\243\330\267\261\216\311W:{A\305j)\256\340\357\006I\307R\224\007\347\247\037\201\367\361\230\306\251\373\367t\343\373\203\350\'\301!\354t\226\037\034\372\224k\225\207\324\262\353\221\220\241\343\344\214\355\234\031y\021\035\200\201\371\376\351\277\276\033\024\223\360\326\346|\307\035\337\211\257\227dv\353\261\313\253\025%i0\205\315\337\267\273\374\201\004\270T\227\316\005v%\273C\254H\301\002\266\275-\r\231\274}\344\350\020\177Z\230^\306\216\342\r\304\025\317\377\236\350\325\375\375\270\333d*\206Z\373\345\337\223\356\222\236\307m6\303\232-L\263g\177\002a\257\365\nV\201\t\270\273p,\252\331\025\250\353\n\277\276A\016\313isg\374:\022\377\333v\237\375\333U,\217\254\365\220J\351\250\3653W \366\361\3629\214% O\014\353\002\202\324\024\240z\363\231@\332v\240Ai:kQ\226\215\274\241\ty5\003\363\236\267t\362\252\241t\037*COH\277\'\346\2576\177l\032\204\244\344\322g\300\317pvV\264y1\351\270\255\272\303j+1\251S\t\006\177\335sL\n\312\013\276\366\271l\371H\235\336\375\343\'f^\377\242\032\016s\372\247\367\343\3766\334E\327\177>\276\333\304\256\326vn\271p\367\001w\037\335\203\326\241\233\362\351\304d\030\373\3337\344arH\221\021\336\\:\305\3141\246pf\321\336\346\177o\366?\2419$\031pb\036~\367r!\362\355\344\325\021@>O\216\370N\362\343\227R\t\250+(\274\363\327\363\010\375\277x\370\212\034\324_\333\210\344\205\255\355\225\316f\3321\352\326\247\350\365\273I\333\336\227\217\377\220\030\3366}\361\240\315\236>\023\257<|\334\276\315\204D\322d\210J\246\337\255n\232\354g\031\363\262\0227\264\204\256\017\262\371\264`\355\241\233\312\341\375V\275\353\235\031\277\003\364,j\010\007\315_/\032\3109\375\236\007_*I\232\033Io \205\274[\271\025jn\003\314U\210e\3577\260~w\276\254\226\357\314\274\301\234\245x\310\350\340\263\332\r\223\007\342\027\351\276\264\222?e\266r\022\276}.F:\254`\017\317?\275\300%\266\300\003C\225\366\0139:\3630|\267\003\262\375\317\236\3015\231%\334%\234~J\332\316\376\\\360\341\241\303\246\231\376\2150\306\030\312\363\025\362Ez\307\227\367\246g\316\375\216\033\214\262\\\300\347q28\036=\217F\326[a[W\336\226\002\354\346\201rI\230\267>\377l\0069\314`\340\013z\204\037\366\336p\001\345\312\375\312\315\230cO\254j\351\0003$?\321\243\034\366\246\275\363\317C\307\316\n;\317fH|;\203\347W\234\220:t\016{\213%\361\245L\361\340A>\236\314\353J+\3074iM\231\002\345\363\r8>\rf\000\0176\025\000d\230\366\234\350\354y\343/\362+-\365\017\245\206\253\"\327#\376\335n\250\006F\377\321\361\032\363\tI-\3532\327\233~_\330\352\247\335\212\225U\305R\255R\217\255\336MM\271[e6\254XH\253\266\337\261w?\311\315\222\301\316F\336Ovm\376\345\233\341\302\270\344m\002\324\273*\314\343\351\252\356\340*\235\372\362\270q\253\345Wx\232\017\250q\304\357\335\021\240\217\205\024\243\316\013\316\271p/}n\3573\236w\262\275\306=\331\214\272\201\005\243,\014\223\325\254\037\237\357orU+\2256\355\344\033\216\227\366\262\367\177\362\251\220dn\317\315{\350\010\356\032\357p\227\352D\252\313\374\256\334\'[\363\204\225\246\252\3705\274\217\024S^\264C\r8\003\2775\324\335\246\271WX\317r\023\377v\2039dh\261\336\372\201\221\236\215\375\202\207\233\373\361y\347\260\033\255\372\331\245\351\312\241\263\212^\220\224\265,\2626\267d\013\250\006$=f\265N\307\356\352\247\312>\177R\367\306\'^\367r\250\364J\221;Sk\231\341\252\227 \331\372s\213\250\373\376\006\002\216\263\177O\306\033\204\270\004\017\252M\356\022o\000\246\217\373Sd\317\031\371\333w\034I\325K\211\267\200\237\317z6\253\234_y\343d\367\375a\361\364\217KW\362p\003m\226\t\323\027\367\325\305&\3353\350`\026|\021R\364\205\274\374\235\212\367Jw\030\3660:\337\245C\\\014\361\217=C\351Y\250\235c;\345R\025\373\177w\276\005\017\2648\372\234\373\263\361i\326P\273\301\353os\\\365\327\264p\222\322\330\300\354\2543\007 \031\232\004\225\357~\000V\237\027.\003Z\273\030\007\356\236\\\230;\376\000\366_\217\347\350\036p\244\373\267\273%fs\216\343\234\004\034I)\377\327T\365\375;6\0143\316k\'Eq\377\312q\375\337\276\013\277\205\3475w%\3376\360|m\347\213o\272\016A\020\240J\221\312\t4Z4\235q\023\321O\272h\237O\261\261(\274\003&2\255D\337;Q\020\312^R\337rM\256j\203\300\233\320(\024\373\026\202\332\256\277\2464Z:C\021>\357\237|\364\022\374D\367\335\007j\027f\357}\335\211;\317?_\252G\366\013\326\225\276\353\332R\335\322\'mQ\326=\241\264m\317\345y^\353M\025\321\317\344\350\344\356N\307\345\345\270\350\240\374o\334\255\354s\035\375J<\374\371\033\310\306\261\023\247\nzz#\213\0131\2374\264\301\037\227\223\221\306\371W\211\216\205\022\255o\235\334\201k\226\375k)WD\355&B\337\034\343^\200\360}\334\237\255\363\323\356\273\326\2026;\027\323\3572\322\242\273\377\377\203\221b\014\325\310\210d\025\230>)6b\365\252(\360hD\365\240\266)\367\335\003\272\335\030L\000\335^%H\026\2656\365u;\363\356\267Z\315\2724\275z\215=\340D\3215(\352\215\374\211\356\253Z\233U\227\372\311\347\2524\365\006\277\354\034\211\241\332^\264n\250%\334\303\272\326y\247\223\024m\017\034\2034\'\245G\312M\351\256E\373\td!\256\263(\241\236\3406\357\233\314_\\\213t\032\207\373\306\335\n\334u\202F\375[\224\257*6J \211\021%C\321a\3229\274\336~\247\276I4I\270>Lq\013R6\334M\236\323\2757\262i\020\334U\254\276\253\257\340i\301\310JGhg\373z\375\034&P\021r\367\373\250\270\323t/6\3352/\322\216\333\"/\212F\367\346\323\331r\277\362\021\251\231\034\361\033t\311\265\257B\337,\016#n\373\3753\236\245{\270\371\003~R\373\270\365t_\336\220|\177\371\336\307\036|\035\213\002\024$\\y\257d\177\357o~\301)P\305\236\340`\002\361\253\372\320\177\222}\007\276\372~\"\333\376\313\267\374/\256n-Mc\303\236\372\304\277\231\010\335\006P\233]k\026.p\033\303\233\203\334\007\346\256\223\364\177\241\312\376\246\351\232\365+\013x\277\357\233N\274\367\222j\347/\272X)\237\341&L\356\203x\317\362\025\005\233\213=\367q\007=.\020\322n\353R\271~n\254\003\371oS`\377\270\364\363\035\223R\357\317rCZ\347n\367\271\240\254\376\340?\256\365Oc\\\307*\017\247\220\257\274\357\202p\267\231y\003\034K3\340\355\252f\032\364\367X0\372\344\224\323|\326\002\037\332\361\272\224\302p\374\341\311\271\337\301\251\243\341\375E\264\275\2172R\352Qy\317\017\335z\343\340p=\346\374\317bp\311\324\332\205\342\276=_\001\337\2638\003(^\273\r\353\036\342\317{\326\360A\032\013\350\034\343\016\316\231:pyf$%\374\357\353c\234\266\263\236\371\334$\2333]\237by\217\372O\231-\341\333\365\277w~c\336\273\\v\037\315\237\314\016\022\004\201`\315oo\226W\223>_f\304\202\272\303\207Y!>\236=u\256Zn\245\333\207\315\0137\231\201\365\364\031\274\371\371w\030\302M\265W\350\274\332YY\201Y*A9\037+\311\365y\315@0z\245/\377Ub\362n\005\271\232\372;\2032\346\326\327\002\207\031^\216K\316\316\352\345\254\201\233#{\265\025\027\252\347\261,\210\233UK\222\307*\316\353.*B\323\306\262\262}\316\'\361v\017\231\311\tR\334\236\226[\313&z[\365]i\372\257}\254q\237\235+\244\331(\021\031,X\234N\357?\214>E\256\306\253X\346~I\364@\323\277\310V\304\346/\003?>\243\214K\371o:\2575\363\333:\323\221\357\036\235\334\322\303\212}\361\234q\367\337\234I\177[\234\016\227\345\310\236\311\327\234E\272\350p:\006\016w\375\230\342\376\276\353_\"\264u\245\235_+\362}\235\372\343\272\372\264\245)Jw\247\345d\376\347\250\014\004MY\340\275\266\372\036\247\030\351-4\325\375\272yi\036Lh\344\305\274{\3273\262\252\262/\030\315_M\252\377\315-\343\272\356a\246^A\227\"\200\247\346\023i\243l\036\340|5\331\370\230\010\217.\267Xw[d>9^|\371\007*F\240\252ch\321\247\037\232\003;\222\325\345\367W\231\220\377UT$\331\0133<\347\022\341\\\264\274g\033\273\377\233\225\030\036\307\013H\024>\305^\032H+\306e\033\3255X|\223V\313\3661fp\257\177\255)\272\370\362p\371\263<]\371Q\323u\363(\273s\361\372a\227\344\003\221Y\266\017\327\221\231\276\262\371=t\322\346]m\037\251\351\242\317I\035\301\232\335J\tZ\352\'\260\200_5\020\306\362\254\363\226\214\332\326\274\233m\243\304\020\037\311\321\351\337@\267Y\317c\245\240\201X\364\3454\3032\027\374\215\207\301$\235\317:\240a\362\333\2076gr\342\244\311\232\243\273\202\265-P\254\nj\231J\364-\3254\217\276\206\272~7\263\356u\313\326\350\315\216]\205\357i[\261\264F\216\332\306\2259\206sVB:\336?\256\265\007\355qg\320\031mA\267}\350lS\211G\363\337\210[\333c\325\245\035\257\3256\372\260O7\033/U1\317>9\203\357\255w>\370>\372\010TH\020\264y\305\025Wd\007d\367\337g/2}\272\364\301\376\020\226\3248)Z9\376i\272b\263\213\233\203d\017.\244\\\277\325\017\263\376\027\370{)Y\222\032\376\366\254\326)\362\252\376\275fv\334\251\361\026.\367\0273 V\353\321\310_\354\246\222\343\377\3443\201\236\237n\034\374\212\337\312\334\333}o\222\271d\037\217\331\336\347\327\'\224\333\0259^I\0066\321\347\2167v\3674\'>\267z\245\272}\315\235e\255\336P\230\246\316\227 :\253\373\214%\232\177\354s_\352|f\376\341\216\022.\267\\V\263\326&\335\367\023pK1[\336W\3071\241\276]\3231g\271\206}\3779\317{\0139>\241s\236g\256\367\271\332J\272\323`$\3312\022o\253\307\251\361H\204\271\375\017U\206\225\324[\341z;mV\266x>\322#\361\354/S\314U4\242\362l\350\035\215\362a+d\222\307\220\030\330cV\3149\316\026\350{\2329\317\032\177\340\'\331x\273\320\231N\367\230>\377\340|k\235\004\331\312\343\364\315\235\232\352\260\375\r&_;s\262h\326\021}\347\332\315\036o\202\321\304\034\030\264\274Q`Vzq\336OT\223\277-.>.\207\211\370\010h4\217F\271\247\354\343X\224\260\362\277e\305\235i\336\0312ZI>\316\337\022\007\256F\217\001\233\201\347\207=\370u\365a\\\2729N\305|\271\257\363\252\271\211\226\007\271\247\324\200?\024\326}\375\303W4\371\307\355\214{B\311\370\037\342Fs\025\364\222\372\341\241\337\322X\300\254\317\200\237\007]\363#i\252\374\232|\344\274\367\003\372\351\300z\2468\036\263\204F\035\036\304\353\223\356p<\3460k\234\2671m2Y2f:\307\220\013l\014\301\312\017\020-\nG\317\244\316\272\362\017\377lw\030\347{\245\222\372\000\243\347\035\311\323\r~t:[\240\235\210&t\035\306\000\354\275\213\023\335c\336;\371+\016\302]_1^K\200\032\365OK5\255H2\\\251\377\365\366|1,\320\022\026\260\363:\000\304\352\215\022\307\275\240)\272j\031\231P\002\\\261a\205\363\334\343\346\225\230\305.\201\333b\324\266\216\251\343\243\263n\323\345qu\333\300\020r\310\264\310\345\027m\232\014\236\215\365\336s\352\306\370\265\253\227v=|\177\366\315k[i\373\336\331\242\327\370\263.\337\362\3264\022\227?~\231\375|m\216\216\322gt\360v\330\354tcn\333\223\2579\236\265rY\306\346N3d\t\247\033\306\267S\033Mh\326C/\233\364Z\323\262;\273\023\276LJ\355\210(k+Y5OL\211\353\367\344\372N\337\324>\210\267Tg\'\312\224\005#\341\360\254nJ\274\307\214\350:\035P\303\276\037;>\023\277\327\371\224\345\361\346\213F\202\251\342i\332=\311y\n\247!&\311\261\220\271\334\261\247\336^3Ow\276\263\3535\357d\324B\203\347%P\236\355\211\243l\335\021\334\377@\262\236SS\316\n\257\275\267\303H\274\036\0201\026\235H\225\361\366\242\242\366\335\247h\251u\273\375\254\000n\263\316\2246\332\026\363y\217\215\252\265\300\035\351\325w\364l\006z\303\004\322\333\254O\244u\321\270\365x\216\022.\237\025\206\022b-\321\314@\216KC\346\206y\347\2117SFr#\204\244{\236\311\"\302k\332\313K\334\255}_r\344~\367\253/\267\320\345\311\373\263G\000[\241_\370O\242\337fu\315W\270\365\",\"\030\375\306R\271\020\311!=\213\237\220\321\322\"\244\357At\027H=\357<\373\223\213\256|]\257\"\322!/\260\221\315\"\276d\206\2149\334\t\243\204\204\325\334\247\273\327\311\336{\007\221\014\222\373u\366,sAp\201\253\017\t\030\227\313\031\310K\241!\030W\023>\363\002a#\021\222t\021\302_W\234\243\272\366\265\231\320\325\210\021\213\016\227\334\242\372\333iC\365d9\356\022MVr\217\253\250\347(\276\235\353=\357B^\353\237\035\233\256\273\262\310|\256\270\310u\363<\367q\316H\031\347\231\321\372{\211BBe,\305s\010o\017\241\357<\206\252\376G\211\346\240\203#\347M\337\355m\365\361\266\'\272\rhT\033\366\333l\314\177\342=\356\367b\277\377d\010\005\344dk\355#\337h\305w\350\356EW\213\314\331\007\373;\353\334\007.\320\177F\372\230\3543\315E:\341\0014\231\336\257\203\341\264\377\330\275!\237\231\321\242\215]\237\353\336\312\334\336G\313R\330\265\271\262\r\215V\2523\272\203{\223\232\346\rz\213z\371^]\206\321\345*;\335\357\354\017\325\374 9\266\324n\247\247\267\362\325\204\271v\367\030/^KWk>\251\267\232\3476\347f^\243K\272\265\256\025\017\240\331\2552\361\010\254\027\327\232\353Z\373\377\224\010\r\217\234\030\243\267\373Z\225\205C\227\"\243F\217$\310\366\236s\'@l\267!\177\233\267\014\204\333G\0323\307/u\276\321\375\374\223\261\231\206:A\237\360\277\375\376\375A\207\233\207\363H?\222\301e\273\356\270WTQ\241RzI\001\260\016\353\003\231\251\261\234\307\360A\036\265\241\177\013\314]\225\3233\027\206M\266\331{f\334\327#+=!\371\347\020%\311\351\36796\237\240W\372\317\341\367\335\352\201\315\317\013d\322\014\241=\273bx\220\272w\304\207~\374\027o\317\253\311^\300\261m\303\342v\353X\271\2208T.\262\207SMy6\360\177\367\360\345\337\357ci5\\\252\257\305\260K\370\320\372\346\027\220N\2124l,\001eT\377\273\230M\3164\244M\251(\226\016\332\323\177\377\n\311%\255m\201\375\2454\323h\206\332Z)\334\366\355\331\367z\031\256\304\001\306V#\377\353\256\306\332J\272\t>\320\242\373\366\255\321\220\313/k\031\247q_\317\3128\267\264@\305q\265[w\376Wg\375}\220\'lw\225\343Cg8\375e\255,\234+`\014\376\234J\223]\270P\327a\236\223Mm\224\332`\247`\021\210\274\3566\240\232\315\\+H\276\363\315\371(\316K~I\274\276\365\362\332\231*\013\311#\234\311\213\3574/\274\333qR\232\361\301\335\2766\210r[\271\277R/\261p\337=\257r\250\2028\261r\212F_\275o4\236;\366|m\035\200\014c\360\232m\034#u\257\251\274\245\313\233\362W#F\215\234\364%\366,\315}rTb\361/\027\213\026\023\036\364_s\\K\227B#\276\305\325\036B]t#p\235\347\205\227\255\266\006a\346\371\267\027Q\334\245CLq\272\344m\267\026/1{\t}\276\216\353s\234c\207\"\305\305\327\"\304\010\201\310w%s8\360\210\374x\t\273\315\346u$qa\267\300Z:7\247\314k;?\212\334E\026,r\355\341g\374\213\3073S\306Q\tH\243\t}o\231gJE#yE\034UE\000\272\377E\362>E\367<\334\323~p\366\271\356\036a\320\220\235Z\336\341\214p\330,$\316\010\006_w\006\007=\306\257\265\356>\323\244\347\247W\2758\226\207O\371\006?#\020E\344P8+\232W\006\262\352\225\277\350\021\350\020]\317\353\037V\341.\300-v[\246\217\032\374p\372p)\325\177\004\034\345\200\314\276{\233\036+3\372\177~\374\232\326\274\233\256\303\225\215\335\312[\233\325g\350\327\253\365Z\307\240\330@}\261|\254:\371$\022O\220Vccce\226\0340\300\0038\326L\303\255R\252Y>\177S\246wI\333e\362\272}\323\347?\300\231\320\362wq\205\036)V\233k\256J#\030\227\307\303\317\271U-\2560\374_\371\363/-\003:\323\344\270\2249i\345{a\301W\000\247\037\245\277\t\210g8>s<\353P\252\373\364df4\316\352u>\230\024\225>\024\027>\3610Vk&,\372\373\370#\363\217\337\2570\324,\037\377\362\275\237\372\274\307\373\236\340w\000T\314\327\022\305\336\325c\017a\200%\032\305\232_g\2666x~\362\373G\315\262\364:\346\271?\022=\013X\235N\231\3568\375\323m\352\326a\007\260\356u\230\030\004\224>\325\320\r\351\036\271Wn\350p\365\322_G\273\255\023\254<M\216\350[\276\001\371\215~s\211O\256\305A\370\023\331\307\270\353Y\350\255\235\016\315x\317r\346e\033\316_#\377]\264s\332\300h|~\027\264h\254\3571p<=\343Q\343\221y\t\227(-\222e:|\317\334|\014\377\245{\335#K\263\213\271\200\357\"\242\r\241\233\243H\364\362X{\274I\254J[\226\377\366[&VKg\216\\j\301\327\326\274\333\005g\304\373Z4s\034\001\363\035\314\300\010\250\264Y\357\007\347O7\217\363\267#8\035|\034\322(c\001<\315\307w|\346y\202k\356\226\253\350\223\235\356\016&\355\023\2621\365\200^}\'\204\342\276\225\270bu8\227\357jK\254\233^\351\225\250\363\'\363k\003\334\325\334\364<\343\316\252?$\303\273\275\274Y\335\302\335ac\243\310\3474\343\343\204\202x\016\017\2573U\3208O\003\257\240q\327\2404\331\353\245\222)\236\211Xs@K\205\273\356\037U\307\353\353\276+\347\343\005\330\3533Xt\250t\353\277:u\373\320<\343\216-\347\017o\307\360\343\234\300\035\235\025\320\343\203\313\374\311\002V\376y\320\034\365L?<\354\327\261\347\017\203\244\263\272\304\367\017\245\233\037\246\274\362f\357\346\035\361\346\007d\177p\223]\013>JC\330\217\036{U\372\375N\033\365\3648\344\254\246|\315c\223}\363\257\243@\232w\332\215;\265\264\303M\277T\231\340\366\361\377\247\314\r\0064\341\227\357\036\237\004{,f^k~\326\001\337\231u5\221\361\206\204\246\236\010/\311\025\365\'\352\314\223\237\357\350u\363\262\313\177W/\333\304\267\327\256J\004\327\261\375\222s\341\310W\251\320\351x\373\353v\237=\3769\210\255\367\325\316H\261\276\254G\236\035\203\375\207\241.\323\274\246\262\367\2312\252\333\313\267E\036F\017\204\334\000\345P\013%u\340\373\256\231;\222\\\005#\330\206\323yj\022\3573\256\035\007a\247~v\036\3554\303\244xu\270ui\227\330H\347\235\277\030\315\3640\345N\350\t\366;?w\022\3074\3567\317y\357+\3170\317\262\274k\243\226;:\325\006}\027\036a\266\333Z\322\323\225\274\301\374\033\264\352\272S\273\370\034%\266)lX-F\215+\270\026\373Sk/\206d\242\301q\033\273\274*\265\230\230\324\243\353\232\370\246V\323\214\277J\022\027S\311w\234wm\022\375\200e\237\t$f\363S\273i*\375\373A\222\262XS\326\3624\300\'1\n\037)\225\302P\342\024\027\206\312\361\256\326>@\234ymr;\3364\020&\326\307\014\247X;\035\356\343\371\344\226;)\254\274\345/\277\361\326A\177\377-\337\002\010\332\356\357\3154\247\235\325\213\004+]\241\263x\201=\332\010i7\252\342f\261\267\227|q,\273\243#\254\232t\246\344_\333\244N\205\367w\023\356+\276PH\300bN\264\366\245tw\016\";\2121r\343\374\236\327t\262{\'\2579*\206K\271=\317\246\377\245\206\361\333\377\004zy-g\022\002\363\221\006^CN\310?\366\216\\\335o\3204.\305\013i\360\332/\267Q\232\373p;\355\265\251\225\212\261q\347\223\207\035\326\273\2707\346\205\302\376{\004k\352q\243V\333\213\370\305\261\310\263Z\262\3520\375\352\246\021}\016\"\t\263{\311\371\014\001ib\367{\005\225\324Z8AH\367\316\340\322\255!\265`\307\361\024\\\274[\274\272\353\256\311;o\177\357m\346\334R\357q\t\266z\374\255\177\221\3634\216\354\377\227\254\2761\003u\345S\232\212P6\266\333I\032\322\232o\343\272\230\207\273QV\224\317\212~\343^\277\210io7\221[\271\265\240\256\033\204o\337t;sb\3033\025[\245\014J\361i\275\343zm\371\317][\371\372M\227b\330\342K\006\342\242\024\326^\345h\357\344\233\276\256\233\276\325\273i\233I\003\207\\\027\212\231d\356\273\376\021\336\201\025\274\275\323\342\014\275\365M\305\240\276\365\346/$(0\226\361\345\246\363\014\326\223[\367\211\017\017\337{\222;\373&\331\351\207<\263\0207\367\376\366\251\254\270\315Q\326\017\200\007}j\355/\222\271a\230]\356\273\037>]g=v/n\367y[\251ml\315cZ\237&\216\251\231\250M\343m\016\264\243\331\362\342\'\020D%\227\027J\345\357\324\325\310\024\274\026\306\277\321;<\337\274l\221:\245GJ!\226\372\nU\242\207\271\0102\214\241#\264\365jTQ:\to\236IA\304\217\2115\252\357\255\237\316\363.\017y\023\207Z\023q\262\365l@\366\367\361\374\025\356\276\324\023\311\3461(\022\305\306\332\007}\227^SSX\332\320F6\254\345\331\345\3579\204U\204jT\207\036\301\234\3622\267ST\335\"/\035.P\245\251\320\177\236\310\016~|I\263\362\240\222Qcc79)&\322I\0056\2257y\245\032\373\335\302\245@\320\350T\302d\331j7\276p\353\362\256\277\343=\003_\365\016P\275\330\231y\257\272\260n\310\\\326\251\244\270\233qW\342\221M\2773\225m\037\320V\324\371w\362\313\251fsN5\353\272D\326\257o\323\223R\341 \001\213w~\322A\361\260\352\364\243^I\340/<\3604m\'\272\211\234\366)\'\233WG\006\255\026\217\336\026\3563\013\202\335\245d-w7\271;\223\245\226\252*=\351\031\315>p\224\024uY\214\337>\231\307\203a{\267\227c\233u\337\370\370\324f\365\375\tk3[\371\320+\354\177\366\356\272\326\224\200\226\371h\036\225\245\\I\253\336\302\300N\310\310\203>f\363\031\001q\356%x\327\260\260c\001\365b\265\341ge\033\232?\257\021n\230\346\021\r\3222\314\350\3368\033\240\332\306\275Rn\352o\177\227\273\300\ta\2567m\345\376\177\267\375\353\332\354\250\342\352\226\367C}\367 \305#\216j\337\261\027\362\014\307W\224v;\221\005.\004\257\276\341\263sD\375\325\344\'\354\320\337-\304\201f\312\027\002r\356\335\031\333\024F\350\233;\362\310T\321\035\237f9\246\256\025\374\255\332:s\375\357\030U\274\254,\005l)\325\256\026?\335)ZV\017\371}\224\352\347\201W:\225y\341\315\254\377?r\367\025\313G\362\212d!\352w^\334\320\351\020\224[xDd\271\222R=\254\007J\225CP\250\242Qm\337\346\246\275u\261\216\361r\251yLd\233\357$\244]^\215\373\rZ9N\0244\217\013\313\265\361\266\212:\013\247\\\205\330\350t\355;<\247\335\275\363=\315\224o\257{\347\324fR\305\266]t\3629\3112#\270\357\032\237q(\351\\\306Fo\275`\261\235\353|\307\241\345\024\214\245\026\366\274\212\2161\241(j\t\354\227_Rp\017\271\027\010d]\345\354@\215,\231\323q\224\207\255}{\025!\0075e\000\304[\244\325\033\305\204\204\204\271\034s\350\310\310\201(\347\210\351\024\363<\316K\013\230\314\271\3079\031\317e\335\371\263\221\236\225\374\337#\'(D\021\322\021\336[\246\376\370\213|\235v\305\342\336.I\252r GO\350\267\331\017q]$\210\367\027\007w1R\242\336\241\327Hjks\261b\227\330H\2037\357A\237g\240\350^\353e\354`\315x\036/\265\2153r\225\304\215\305\325\352\\i\206\302\232\276\237w\353\364\367\275A\035\306\373\307\233\270\264\322)\034\265\034\305\233\252\303\311\317\375\177\326\276$\226+\325\223<\326\\]\265\327rL\244\335q\317\\\216\235\253A1\227/\313\"\352\333uF9\312\201\317X\220\016\321\361\323\321\025a\2428\305\342\267\354\277\0037V\373\236\016c<\236\335\342\307\275\310\351\357\262\3225UY\310\276\342\276\313\256\362\221\026\372\216\376\257\237\224\324$\310\006\221\201\241r\227\023\363|f/\251\"\031w\267\334C\3472\335f9\'z\03549\352m.Fk\310\3112\236#\226\362JE\025\025\314\226,\020 H\004\252\232\331\347\016]\345\205\327\\\3509\213\336B\267\222\013.\276N\0075\030\324\304\347\263\264\310us\247\271\2379\213c\000s\225\276\305r\371{7\265_\246\274\312.\326\324Q\232\007\370gA\376<\353m \256\255,\327m\340\217\214j\222j\344m\345\363Qb\300\320G\307M\377\277\373/\313\242\213K\235i&(\276R\325\006\203\210226vep_\234\202\374\320G\356U\246K\374@uZ\004\246\235\032x\231;\237\022\246.\275f\213\312mM\270\341\270\355~\217\210\177\335P{\223&\370\001@\336\206Ev\274}\017\241\341\005\250\265\273wis}%D\025\243\267r\232i\264\037v\216\335\366\234\n<\327\326V\374\233M\035\264\264t\364;\375\372\375\246+\315\273z\232\271t\337\266\321\332\304X\200\371\nI\246\270\373;\340^\333GDV\252,\242\240\234\256\243(\321\357\326\257iz\247\3566\330\221\0268R\331\346_\310\362\234\354\377\250H\222>\355\251%\016\250\273h:\217\313\254\226\325\224k\346\256t\ne*\246\332\nW;so~\370@\315\271Z^L[lL\031\315\237\267\232\242\366\302\022\213\016\306b\227(\273|2\324<\204\217+\034\031\367\344\237\323!|Z\010\217!4\363\310\217\255\373\330\376\002\211\305\232\357lA;\370_\331\266\360b\370\211\0357\236\\\215\232\366?\376\227\376\266A\033\310\332M.\374\320.\254\254\314\200\307.d\216\006\207\017\031\356\363\315f\246q\317\007\271\252\326z\037{\030\177.\334\347<\306q\336t9\341\361\315h?t!\316\273\203\316`\274\376\214\351\377\363\355\016\032\227\346\017h\317\332\326\031\314\017\251=\2563\272\236zgC\204\353\230\347\235\217\302m\216?\237\036\321\325\313\200\023\347}\022q\027\216L\207\037^g\275^8k\317RfL{\216\315\0254\007\'\254}m`\016\017\347\265\2720f\030X\235ia\354`\261\257y\213\255\244\354\270N\345\352i\216\315z\263\320\341\255xWC\272\364\376\367$\353k5\241\200a\232\347\007\350\307\001\346_OlU\3720`\000?@p\236\270\032\022gY\256j\237\310\365\250\372j\233\324\031\027*\260)\034\234\274\264\263\003\377\253\013\2247wS\347?\334!\245\317\002\367\365\277O\241!!3\202g\370\"\235\3261\205\024\177\376AJ\226\377c\2028HK}>`\245\032_\2157u\335?\243g\301\311yA\215\260}\256%sI\272\276m\264\243\305\330-\355\234\357\363\000\277+1c\021\325(K\262\273r]\243\230ejX\354\243\261\245\206\204\r\352\365_^\243\202\361\367\027C\327~\311\227\373\305\367\215\324\307Op|`y\247\361t#\n1\231%\001\013)j\332\376\r\312#\223\246v\225\215\267{\323\267\213\020O\310[\371\010s\243LR\330\367\257q\027/\215P\014\177\376\247\261\227\373HW{_\220\377\212\242\225\322\374\337\367\323\034\227\"\243o\033\004\256P\301\275\336\317T\330\324\314\016\251\320=?\023]r\025\016d%\2270\034\260\355f\027\360\021\330\255\217+\372\340\347\276\377aK\3667)\247\263\026\357\231\324\337\377\373\337\330\361\036\377!\021\334W\032\267\023O\3447y\033\221\374\321\243\t\267nWA\346\337\236X\r\005\341\2745$\357i\355\337J\373\200\325\265\253[J\360\354\307\264\007\366\n\273J\003\270\255y`\374\372\010/0\255\342cwpW/\236\326\257\236(0\320^\024\353P9Mq\371\356\377\366D\177\242\030\330\356\203\372\017\357\016FF\357\236\346J\216\353Vd\000\236i\365\364Z\311#\366J\274\336w\360\341\356\367\211\023\376!\020w\027N^_U\332\037P2\250\345s\221\316^\033\302\236s\204\"\316\252\032\037p\016\376\002\031\316\177\362\342X\213j>\261\366\377\270\264\005\377\255h*\227\225h+[k\000+n\346w\266\327+U[\302\n\370\001:\304q\365\351\374\237a\026\370\317\253P\304\031\327\377\324\357\302\270fU\035\035\026\036O\271\211\325\324\364b5\272\342\266\376\310\333K\247q\324\352\240\377YH\006\377S\355S\323\346\226\337\372\315\267r\024\201B\266\3359\'\253)\325`\035\356\341c\232\211\260\210\312\222\316/\364\346`\255f6e.L\361U;\255\276Q[)\321]z-\377\355\236\246}M/{\332\034k~C\343\222\361\247_\312z\252\'9\t\344l1i\317\"\360\307\210\030\235\373sZ\344M\264\364\322p\252\347\3068\023\032\230\203\214\3176s8\370\356\271\0101 \2563\013\016D<\244\357\353/\273\375+\307\336\355\243\304\343P\031\n\246\236\354\267\335\026\272\2474\231\316\265@\320\342\036Q\306\227\364\356sS\351\310\256\363\360&\306\345\212\376y\232\203\367\263\331:\312\223\364~\372\344\027\315U\326\254\266U\344\266\201y\363]\377\226V\200\327\345N\330\375s\221U\333\331\373@\212\212\247g\024\n{\177\330p\375\322\272R\237Jk\244\310AB;\023\217\257\311\356\323\274\250\246\303\263\321\325Q]k\341\303\275v\224\372\357\017\331a\216VY\206{\324mY\364T\216\236\334\240\337IG\201\243Z=(\"\212\353\203\202\333\271\231u\237c\023%\367\214\347\252\304T\024\213\261\211\305\311s\r\337\377{\222\177\336\341\345\301h\265\244\324sL\253J\331v\347;\036\342\013\372\256i_m\334\261\023\326\327g1\215L\353\334\'\\\367\260\030\304\236\3473\234\255\327{\322\372\2730\266\274\006\214\313\030wN\251\327.X\325\347\217\0265\343\225\321\370\022t\365\035\006\321\026\222<\223\214rv\355\321\234\200\315sf\302\205\213\275\'N\260:v\365$\207\350z\352m ,\337\007=\352\226\266\'\332\3463\177K\031\3159\355\023>\327\251;J\273\231p\322\2576\371,]\314\022\001\216\213\237\035\347vcG]\375i\360\317W5Yu\207\347\271\313M\311z\243\315f\332d\370\347\000\016\272\316\367\267\267d\227\000\302\177\247\270\361\344\217k\247\307\264\345W\307\357\250\342x\347\270\307\300\022\271\231w\347\305X\000`\001s\233.\350k^\3464\346\264\025\366uc\r\275\301>\357_\332\177\030c1\256\263\263Y\341\323\230qN\343\363\3304\257U\r9 t\036I\030\037\0028\347\240;\263\035\264\313\353\332\003\236\302\302\270\321\336\3240\2274\345\2539~\334\352C2\274\223\356\342\246\265Y\237\271v\014\307\325\274\220\314\372\272\271\321\331\342m\307\314\263?&_4\363>\'\026\007pg\265\360\363\316\022;w^\353SBm\005\273\241\372l\260\250\3412]c\316\363\356\303\342\005\2178\227\017jq\206\017;\274\275\331>\235D[i&lJ\201\322\216\212\257\377?\271\311\014\353\025\265i\021\317.\303_\251)L\265N\010\342\004\247a\225G\225\243w\r\204\301v\347:M\'\376\367U\252\322\205\2750L\255ME\305{\323\252\240\314&\337\007:\245\231\375\256\310\230\267#\211\246om\263\231Fq\355\356\036\327\362\361\310\335\317}\210\313\300\245\233I\324\304\"\212sM\305\247\333\356\231D\276Pa\031Q\255\245\243-\240s\327D\373(9\274R\004\321\333\366\341!)\237\225\213\010\356\037\010j\234\266\255LU\262\366 \243\023\215D\335\031\223\250\301\\\321\030\345V\220Y\002w@\036\213\270g\370\367\335 \265\376\371_\357\006\242\010 \345>)\252\306\306\367\354\354\251\230\0109\023OmQl\354$\374)\333w\033\312\354\223a\232\013\263\353\023M\247w\017\215\237\261\313\243\033\245`\310\234u\347\260)\007\247_\377\263\344\221\363\r \342\250O\356\334\313U\336\333O\351\205R\2255\246g\230\316\177\372\367\271\304!n\351\327\321\232\305\364\312\026\371\362.\"}\256\351\376O%A)3\020%\032\236\010\271t\322\375\336\314\335,\327\337\033K\227\376\317i\233\257\227\216\365\3079\215\2239\333\273\215n5\263\340\373\277\223\343\275\321\214\320s\355\356\213r\370\313\207\365a\333\314\231\231=\265.\177\007\334\213\031e\177\371\323\247\325\255\201\274\275m\347\t\340\354\302\226\003\245\265\263f\353\275wW$I%>\323\362\355\220N\220%\374t\206\013\366\370&P\212\000\370\334\306Q\025\010\t\357md/\273\233*\026!\344|\257\376\254\327\307~\374JIg_\304|~\275\366\302\3323\265\273\2632\017\276\374f\215\351\304\031\327\277)\330\237\035\205P\n\022Nv\323\352\262q\316d\232T\025U\014\267p\301O\213\'\2370\360C\246\315\035\253*\277\241W^9\367\353\234\352\260\376\311k\336-\271\320\254Z\347\375\271\017\222[)\352\335\035\372\2467\026Fo\311\177lx\264\204\227I\211\346\357|\024\347\201\236I\364\215\266\361\346\347f\326\362\377\266\345B\353\333\325\374\327\357\352mK\375\352\252Q\001\272\257\036\001\003W\2244\037\354\273\202\210Vu6\362\355Jm;\275\346\356\321\271|\257!\371t\247\361\325\271O\"\017\311\215\377\356\321I(\324\273\376\362\273\370\343\033\374X\317\360\236\355$\013\246\367\325\346F?\352\366\306\203\034io\320^Z\207|\270\372U\241P\333%H\234\217\275\350\262\230l\317\277;O\216\347\350kD7\220e\006\317\267\352\033\335\212\333)\243\241\370\204\343\255}\27265\360\376\274-\007\335\245\234xk\231Z\351\274\266\215\356\357v\224|)\2003\025\242\263]\377\362,\212a\362^d\252m\305\"\376\375v3u\307q\261\016-\265\277\206[n\332>\374\307\366\307hcD\374\275uY\177\003+@\312\344\210\261\010\324\373\252\201L\211\214\343\373\344%C=\372\026T\277C\310R\353\313A\276\0244o\231CF]\315\263r\312\303\254\356e\003/\236f\267y\362\263\271\225\205j\210s\315\006\3567F\257h\365\374\271xu\225\350\367\257oX\316\022\202\t\210r\341\247\225\276\"rZm\002\231Y]i.\032\3354s\314\034d~\355i\2771?\225I\017\032\035RM\347\034\206\361y\007\250O\276\025[M\345\177t\256\355>\3422\353\374\207\360_\365\362\301n\315\225\277\264\357\214:\371\367\337\206qn@M\203\372\0202&\326\276[\357\371\030\300\373\355\3223\275\335wR\0234\272^\371\307UZJ\272\245\027\247\323[x7\005\304\210\364\004\n\371g\005\326\257B\3719](S\304\323\311>\350\302r\236\220\236\205\241\232\254}\344\261(\020\023(q\022\336a\306\336cs\223\\\314%\2336\331S\314\003&\351E\356\353\231Xi\336\030\324\023Y\223%\344n\342h\nI5:\263\225\r\366\207\373\355\275}\336\201\335\306o\213\340\351,\323\237\344U**}\004~\357\314\307\337\236\r\262{\315\311\312\324\231\344\3115\013L\353\3012\311\232v\316\235\370\364^e\345\343\321\027=\215\326\022\363\317\007\367\260O\252\034\274M\265\342G|a}{w\275S\032\304\2146\006&J\353\270t\311\355\334W\325\365\n\205\356\235\273\323\357\025\277\263\003\217\315bu\330+\316\216C\335s\244ks\343\353s\300\022}B\313\257\260\375%\245E\342qY\254\315_\325\034$\263\"\201\314P\241\271\317\017\265\314y\337\337\321Ia\257v\255\370N}\352\246\006\037\236NB\357\0061\313\2608\3660\372w5\311\367\037\\\316\224\177;\367\334\267\274\356\272R\337\347\270\035\n\037\247\257W\t\327\'\322\365\307\254~\341\243\201\320:[G\366\001\315z\213\225\255A\354\017\252\354\227\2313\005|\375\035\313\023\317I\340\003\016\306t\327\030T\220\316\325\365\033\334\022f\311\236``X*9\302O<\222\3622\330@\374\332\005\330\300\3753?\252C\263\332\225\277\235\363,\372\361\313\265\274\342\264}s\362~\353\230\300\231\350\310\316z\213\2743\014\234\030\326\246]\337\2312\206\3578\005\216\276\3112s\332w\030\t\327t\346\ttb\364\022\273\004\357\2724f^\242\270\367\235\301\300\n:\333\3442\335\220^9\3409\211Y\2005\214\005\221\340\277\267\007\177[\262\316`\014\025p\333r1\346\252\204\310t\003\214\001\301\375<5RI\314\234\030\327{\251\352\300\261\230\031\217G}\357\272\327\033O\203\273Z\211\276\331\236\2600\007\307q\245\236\323\000\227:N\200\226<\262\262\362;\365u:\340\303\274}1\300\303&~\r\000\356X\017\016\356`\rH`\324\207\334\320}\337V\272\220-\251:.u\211\256\207\254\214\237}\216\201&\214N\217i\355,\223R\372\237`\234N&O\023\302e\301\3542@\226O{\360H\000\37652\001\202\323\320\0032\300\362\3037\326\237Zq\347\330\001\337\216\026\374\353\200\001$\231\343\277u\361P\231\035\373\240\227\0003\t\350\017\364\273\016\022Ht\326\247@\035\035\307\300I$\203\t\366\002\3001\347>\204\366\300\000T\000\003\2408?zv@\220\200"
      }
    }
  }
}
node {
  name: "Assign_15"
  op: "Assign"
  input: "conv4/index"
  input: "Assign_15/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_16/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 246
          }
          dim {
            size: 3
          }
        }
        tensor_content: "\240\024\242:\210\263\215\272&\245\002;p>\326\276r\t\341\276\360\317\237\276Y\211\226>s\274\245>-\337\226>\r\377\232=\230\315\241\276U\203\242\276T?\262\276t\032\322=\370\307\212\276ML\243\276\241+c\2760\023\220=\256R\n\276\246\371w<\216\274\260>\335\023\256>\363Lw\275\224#\006\276\t\rO\276\372 =\276\225Ak\276,g\354;\030\252\234\276\206\315S=v\234\t>O\313\373=\360t\202\276\364\021 =\302\317`>\243+8>\2635\243>\010T\030>\354\006u=i\025\206\276J\325\005>\346L\232\2749\233\020>\177\3574\275\242ZQ>B[\336\276B\371C\275<\316B\275\"\371\242<\346\312\276\275\'\202\200\276\3028\374\275\272\323\002\276\350\003\026>k\n\305=\261-I>\037\003A\275jou\276\345\250\257\276b\'\312\276\351\235G\276\231\035\243\275\261\020/\2759\r\312=\331EB\276\006 \267\275\024!\037\275\010D\260\276\004\356\033\276.R5\276d\035\216=\370?\037>\372C\255\276\014\224\241\276\377^\'\276\373 ?\275\302\366<>x\271>\276I\356\222\275J\372\342\276\235\330\273\276KMW>\314\230\373\273\2044\375;dh\\>\237v\035>P9\224>0;.\276\321\334\201\276\254\240|\275\034\343U\275]\317)>y\t(=\243Q>\274\227t*=rIK>\253\r3>\036\341\013\275\026\353J\276\352\210\222\276 \017p\275jL\001>\326\364&>\t2\364=\321\307\354=\346\325\246\275t\331\236<\274\3437\276\"\262T>\023~\221>d\275$>6\366*=5\355\017\276\271K\364=\353\345[\275{\322\t\276\315\224\345\275Fx\260\275\032\026\031\276\334\000\270\276\266if>\225_\340=\244\243\371\275d(\254\2766\250\014\2763U\007\276W\340\301\276x\330Q\276\366\252\206\2761\254,\276<\263\211\276,\n\002>\315en=\361k:=\222\256\003\276\276\202\004\276\364Q\031>\222\377\224>t\317\231==AH\276\351\310\313\276\026rx\2753\356^\276\250\334p\276\234L\014\276\301\206\"=\200\370\037<\256\327R=\345\216\003>\302\276\224>%\027R\2760hF\275\036\324:\276\327j\210\276\263\242N\275\205\273\207>(o\221>G\255\225>\273J@=\322\034h\276\007\"\253\276%\237\204\276\3053f\275_\357\017\276\317\022\300<`<D>\2449)\276\321\264\\\276\272\032b>\255\206\304\275\223T\264\275p~\311\275\217\236Y>\311\352:>\3410\331=\351\"\252\275\332\346l<L\323\226=$\326\224<\235d\324=@\016\323=\305\324\232=?\275\332\273qu\253>Q\213\207>N\373!>\354\317\255\276\232H\352\275:q\031<5?\333\275\253\207\307\275\004\177}\276\001\234y\275\265\225\200\275&\'z>\226o(\276\315\261\250=*\226\351\275]S\203\276\'`L<@N\231<\226\274\215\275V\237y\274W\211\314=\354\322/\275\t_\303=\007)\202\275\000\257\007\276\007k\213\276\266\266\242\276\340Si=\214\225\234\275\202\244\337\275\022\014M\275\3206v\276*7L\275\227\250\237=\'\376P\276\217ad\276\210(\224\276\307Sz\276\227\373K\275\247\241Z\276|1<\276\362\343\365<\272\352Z>R\351\020>/A\030\274\037\336\241>\243\255\246=~:[\275\377\277\270\275\010\233\366\274\226U\223\275\031M\037\276q\002\243\276E\266!\276w7X=\027z\026>i\207\265=\211\024u\276\357b_\276\246\230\253\276\323\023\000>}aO>2\266\260>N\3203\276\255\211,>r\374\301=a\016\026><Qc>\252\302\205=;\314\037>\354\365\022\276H[\027>\371\263h\276ud+\276\226/\353\275\351\2323\276\227PF\275\333v\220=Px\311\276{\330\251\2767K\236\276hO\024>V\261U\274\200\363\262\275\323Tl=\022x:\276\210g[<\275\345\004>\035!\312=\033\222_>j\355\231\276\350\372\026\276\022\231?>\2073\025\2752#\244\276\236Q\204\276\317\274\327\275\362\244v\276\234\2438=k\324\020>h\023W>\312\326S>gM\203\275`\254\274=\274\033\373=\265\277p>\300_;>`\251\'>\231\205%\276\014\013\030\275)c\204>\315<\201\276\356K\203\276<\037)\276\320\217d<~^\213<\252\256`\276\177;\211>\021\210\265;\237\t&\276tr\312;\225\2752\276\360l\245\276\217\322\004\276\347!\"\276\263\377?\275\360Y\t\276[\217_\276jc\'\276\320\326\306\276n\346\313\276_\213\013\276 \324\003>D\016\346=\275\352\032\276&(\237\276yi\216\276?\205\226\276\033A\224<\241v\213\276\231o\346\275\257V\335<\274&\037>\364\357\003\276\223c\022\276*T\305\275\307\324\377\275(\327\350=\032$\360\275\037\241\204\276\360?A=\336%s\275\266\311>>\235\253&>\333\241\227\274\376\253\301=\232\371\037\276s\256J>\263\037\236;v\177\276<\021\361m\275\227\t\225=\021\177\016\276(S\017\275\335:(>\267\t\365;\212\257\275=\224?\305<\367\032`\276\232\007\001\276\027\360\021>\364\024\241<\261\004\311\275)\300\274\274TQ\207\276ua\240\275\362\027\200\276\243\357V>~\323}>t\344\230>\351\"\215>\014\207\212=\241f\250=\216\204\235\276d\376!\276\233\303\233\276cL\351=\372\235\227>\027\020\351=\374\244\007\275^B\025>1\317H>\316\316\201>\032Z\202\275>\221\217=\233\345\200\274\324\277h\275\r\236-\276nD\224<\322M\354<\3772\222>E\276\221\276\326eo\275\362\344!\275\226\313\300\275K\367c\275\017\313\252<\013g\237\276}p\272\276\3275v\276\272\033N>$\224\245>^Cy>\260h\254=\377z\030\275I4E\276\277\2268\276\343\352\210=Q0|>\350\353z:I\343B\276D\342!\276\023I\255>r\275\202>\370\007\203>\005\'\363=OZ\022\276+\260\'\276\207\257l=\206\022\311=\203\341\'>Zk\201\276Z\377\260\276\010\202*\276)\244\022\276\251\240\014\276\017Bs=\240\346(=\277\261d>x}\221<1i\013\274\277\016\256\272`\374\275\275.>e>3~0>\266\263\236=%\232\213>:!\347;\034p\212\275W\325\305\276\322E\211\276\335E%=\233\324\314\275x\345a=\203\373D>\037\006\221=\035\201y\274W#\215\276\327\202,>_@\230=q\256\200\275\"f_\275\002\206r\276\001_\247\276?z\201\276\371\331\314\275K\337\344<\306\007\233=\302/\274\274p\327\035\275- ~\276\342\202\366\273D\374:>\233P;\276P[\365=z\270\313<a]S=E\233\273=rfL\276Z\347u\275\315\340\200\276\265\203\016\276\020\304\005>%\305\301\275\326\317\206\275rcn\276\310\210[\276\365\353\005>\352\222V=Y\322\366=\312Tg\275\375)6\276\211D\032<%d\231\275\362y\n>\235\026\032>\325\371\275<\350\020\007\2761\266:\276\343\225\214\276\010\277K\276]a\212\276\013|k<Ky|\275\373\333Z=\005\250I=\347ss\275{\202\023\276\212\220F\276\327i8\276z{\214\276:\355g\276L\374\230\274HA8>Fx\353=\027\374A\275\213\203\312\275 \320\007>)\034E>\300)\022=\336;\035\276\244*\'>S\036h=M[\201=\234>C\272o\n2\276\203\2028\275\036\334\033\276\027g\360<\307|\266=\035=\233\276JRk\276\274}j\276\302\334O\275\364V*>\313\022\321\275\334,\245\276\362j(\276\331\237i\275*f\007\275\273\016\273=2A\225>\031\343\343=\343\2120\272\343\006\373<\010\342H\275\'k\214=0\253p\276\321\273p;7\267\021\274\245\227\010>X\275%>E\020r\275z\203\222\276x0\337=c\256=>\356\014\005>L\223\215\276*\021\036\276\256\367l\276F\006\007=@\307\211\276\304\276B\276[\340\334\274\265\035n\276\222[:=\260\003\230\2768\200S\276\201Q\375\275\205\341y\275\312\270\013\275\370\246\202\276\016y\203>\003\n\206>\002\352r> \262\245<\032\252Z>\300\254\202>\2223G<\275L\215=\262\030\335=>S[\2762\362\224\276\213\376\245\276\3775P>\'\365\370=\217\206U>\265\263\204\275Cb\316\275\301\2500\275\212\354\301=\351\303*=\275\341\203>\025o\234>\017|%>\311!\017>.\031\311\275\210\307z\275\223N8\276\320\337*\276\321\033\360\275\036^G\276\001\364P=\005\335\220\276\017\027\337\273\\\235R>\302\213h\275\014\257\024>\361\025\365<\032\255\367\275]\2628\276\256j\327\275\324\3513=\263\237\255\275Og\'=\23045= $@\275\017\333\020\274\205\364\221=A+\035\276\314H\023>\356M\231\275\036\326\014\276\372A}\276p\324\021\276=\245\014\275fUP\275 \273\005\276/\001\222\276\257xl\276\323y\253\275\233\340\335\275\242\302\331\275\300\310\004>=#G>\251\037\214\2758\025\275<\270\002\277\274\226\221\217\276\300\002P<\260\036\332=\200*G>\267\277\243\275\202\360\024<YZ\220=\250\326\240=Z\234v=\275j+\276\365\356V\276\353\252\262\276}\272p\276)\233\225\276\223i\202\275\017\275v=\225\273\027>!\3400<\365\025\357=\\\275\313<\004;&>e\242\253=\014\016*>9\277V>\237\004\243\274\035BR>\013\262\202\274\033)o>\336\200\263>\036\006\032>$\021\3009\345;n\276\r/\212\276\210\231R\274\036\224\237\275\226Q\276\275\342@\311\275\250\313Q\276Zs\316\275\006mH\274H\n\235\275\337\034\240\276W\017Z>G\327\221=\371\030\224\272!\223J>w\365\211>\232t_=\020\351\234\275\370\365v\274\275\246B>\\\347\004\276\361\324\342=-\220\217=l\023\004<\330r1\276\272\035g\276d\r\225\275\374L\353=z\242\036\273\365\314\211>4{r>\205\353\t>\017\233\017=\'\035\022\276Rz\346\275\330\242$\276K\310#\275\344:G;\201<F\276po\202\276_9\003\276\235\244\224>\371o*<\237\360\016\272\265\0162\276\306\345\235=jb:\275A\245\220\276[35\27660\357<\333?4>\263\036\025>e\274\211\275\274\277\314\276\265D\277\276\320\232L\276\211\254\314\274\227\230\211\275\255\034\241<\245\330\"\276\370u\\\274\200;\024\276\270\347\256\276\001\362\224\276a,i\276\3720\014>\256\354j=\001\222D\276\200\000_\276\n\266\013<Zn\240=\244\300S>\353\356\214=<L\006>\010\316\216=\332\234h\276\241\343\222\276\327\377\326=P\237,>9\260\215>\265\331\320\275\355\220\265\275\233:\252=r\340!\276\243\262%\2763^\010\276"
      }
    }
  }
}
node {
  name: "Assign_16"
  op: "Assign"
  input: "conv4/centers"
  input: "Assign_16/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_17/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_17"
  op: "Assign"
  input: "conv4/shape"
  input: "Assign_17/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_18/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        tensor_content: "W%\000\000\002\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\002\000\000\000\001\000\000\000\002\000\000\000b\000\000\000\001\000\000\000\001\000\000\000\005\000\000\000\002\000\000\000\002\000\000\000\004\000\000\000\001\000\000\000#\000\000\000\033\000\000\000\003\000\000\000\003\000\000\000\375\000\000\000\024\000\000\000\003\000\000\000\t\000\000\000\007\000\000\000\001\000\000\000\001\000\000\000\021\000\000\000\001\000\000\000$\000\000\000\014\000\000\000-\000\000\000\021\000\000\000\004\000\000\000\210\000\000\000#\000\000\000\004\000\000\000\013\000\000\000{\003\000\000\002\000\000\000\010\000\000\000\003\000\000\000\002\000\000\000\001\000\000\000\324\000\000\000\003\000\000\000\001\000\000\000+\000\000\000\237\000\000\000\005\000\000\000\010\000\000\000\002\000\000\000\001\000\000\000\t\000\000\000\032\001\000\000\003\000\000\000\004\000\000\000\002\000\000\000d\000\000\000\006\002\000\000p\002\000\000\002\000\000\000\006\000\000\000\037\000\000\000\002\000\000\000\002\000\000\000\001\000\000\000a\002\000\000\204\000\000\000\004\000\000\000\013\002\000\000\023\000\000\000\t\000\000\000\016\000\000\000/\000\000\000\025\000\000\000\002\000\000\000y\010\000\000\n\000\000\000\255\000\000\000\003\000\000\000\002\000\000\000\003\000\000\000\007\000\000\000\001\000\000\000\207\000\000\000\205\000\000\000\004\000\000\000\260\000\000\000\034\000\000\000\017\000\000\000\002\000\000\000\003\000\000\000\r\000\000\000\020\000\000\000s\000\000\000\022\000\000\000\003\000\000\000$\000\000\000\017\000\000\000\003\000\000\000\007\000\000\000Z\002\000\000\253\000\000\000\001\000\000\000\013\000\000\000\006\000\000\000\005\000\000\000\007\000\000\000\241\002\000\000\014\000\000\000\017\000\000\000\r\000\000\000\001\000\000\000\356\003\000\000&\000\000\000R\004\000\000\017\000\000\000\357\004\000\000\001\000\000\000\003\000\000\000\005\000\000\000\001\000\000\000\001\000\000\000\023\000\000\000\002\000\000\000\207\001\000\000\006\000\000\000\007\000\000\000_\006\000\000\004\000\000\000\003\000\000\000g\000\000\000\003\000\000\000S\000\000\000\002\000\000\000\026\000\000\000\213\000\000\000\006\000\000\000\267\000\000\000\006\000\000\000;\010\000\000\025\000\000\000\006\000\000\000\001\000\000\000\036\000\000\000\005\000\000\000_\000\000\000\006\000\000\000#\000\000\000\257\006\000\000\003\000\000\000\004\000\000\000\006\000\000\000\035\000\000\0008\000\000\000\006\000\000\000P\000\000\0009\000\000\000i\000\000\000;\000\000\000\003\000\000\000\344\004\000\0000\001\000\000-\000\000\000\036\000\000\000,\000\000\000\014\000\000\000\215\000\000\000\203\000\000\000o\000\000\000\016\000\000\000\003\000\000\000\n\000\000\000\004\000\000\000r\002\000\000\003\000\000\000\355\000\000\000\001\000\000\0004\000\000\000\016\000\000\000\010\000\000\000\t\000\000\000\027\000\000\000\014\000\000\000\006\000\000\000\002\000\000\000\260\002\000\000\014\000\000\000\010\000\000\000T\010\000\000\003\000\000\000\001\000\000\000\336\000\000\000q\000\000\000\003\000\000\000\001\000\000\000\177\000\000\000a\000\000\000l\010\000\000&\000\000\000*\000\000\0005\000\000\000\017\000\000\0005\000\000\000\t\000\000\000{\n\000\000\003\000\000\000\014\000\000\000q\004\000\000\007\000\000\000\005\000\000\000V\000\000\000$\000\000\000\022\000\000\000\003\000\000\000\001\000\000\000\006\000\000\000U\007\000\000\263\000\000\000\001\000\000\000\033\000\000\000\001\000\000\000\036\000\000\000\017\000\000\000 \000\000\0003\000\000\000\002\000\000\000\223\000\000\000]\001\000\000=\000\000\000\001\000\000\000\004\000\000\000\007\000\000\000\t\000\000\000\002\000\000\000\"\014\000\000,\000\000\000\010\000\000\000\t\000\000\000\021\000\000\000\n\000\000\000\001\000\000\000\004\000\000\000\275\000\000\000b\001\000\000"
      }
    }
  }
}
node {
  name: "Assign_18"
  op: "Assign"
  input: "conv4/freq"
  input: "Assign_18/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_19/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        tensor_content: "\017V\320\275\010\202\212\275sX\017\276)\245\210\275\372]\016>m\010$\276N\265\276\274~\331\026>\334\331\000=kv\264=\231\005\275\275\033\373\">\026\305\266\275\204\225\263\275c\347*=\257\312\\>\237\022\261=]\212\004\276\274\017\031\275\211\325\036\276\016\3318=\312u\n\276\312\276\233=\220\347\225=4\035x\274\322\234\030\276\010\272\020\276\237H#\275w\365\376\275\306\030\035<\271^\362<\255\374\345=z5\275\275\202\307\002\275zR\231\275\002\257\363\275\357\r\366\274\242*M=\205\210\234=\034\231\323\275S\\\030\276\260k\227\275FV3\276\254\302U\276\240\337U\276f\315\201\274GCw\275\037\305\037\276\007;d\2757\0174\276\306\007\230\275\305\313\346\275$\240)=B\373\306=]\236\213\275L\317\361\275wAC\276\374\323\302<\357\371B>\345\201s\275\347\311\342=\266B\332=<Di\275`SE>t\3075<\377\2715\274\215F}=\002\225H=\377\304\013=\215p]=\003\301\327=\025\350\356\275\361<I\275m\302w<\351\"\302\275\257\367b=\376\n\034<\325\377\372\275\035\300\027;I\377\'>\200|\351\275\\nB>\"\231\336\275\366\254O>\037\223\234\275/\t\233=\030p\375\275\305I$>H\356M\276\336\207\363<\347\363\013\275\244Y\203>\354\2663>\250\207\003\276q\205\213\274Dt\232<U\324\337=\213\276\030\276\350\005\210=\216\007F>?\3559\275`?.>\257B\277=p\263\334\275\243\302;=R\217\254\275\277F$\276\201_7\276\177\276]>\016\0142\276\255E\352\275\366\317\030>F\321\373\275D(\335\275\007\'\340<\345\020\021\276\372R\021>\031\266\320==n\232;\377\275*\274\031\320A\276\300p3=\323\375\027\276Ia\034\276P\017\315=\005h\244=\332RZ\275\335\314\365\275"
      }
    }
  }
}
node {
  name: "Assign_19"
  op: "Assign"
  input: "conv4/biases"
  input: "Assign_19/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_20/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 30258
          }
        }
        tensor_content: "\365\177\373&\324\367\374Us\025\027\\\3728Zu!B`\325W\r\226\217\306\357}\324\343\312}\330\234\343\307\355)\326->\030\\\'\332R\347\276\336\226\020\n\0057\261y\257s\373\354&FP\027n\301\272\355\230\000\233G\344\334\225/\267[\245\361\366\204\204{P\217\267\274\375\342u.\nk\224\321\307\246<j\354;f\267L:={\314\315\307\362zZ\315\271\213\337c\232\322Ro-X\036\017\006Vjk{k\305\217\261\237/^\275}\311\343\032\220\266tL\340u\337\'F\326\242\313\006\322\2654U&\367\226\232U\372\034\316\325\017\320,\340=\273\354&;C\021k\303\215\271f\205\210\250;\353:\274\\\231\225\311\303p\251\224\330\212\277\206&\231k\304~\375g7\331M\362\201\033\325bi\266\266\3139e\323\3448\001\332\370\361t\256\355\224\326\343\016+6\200\216\210\324]>a\261\005\323i\312\375\002\345\257\372\202\202\265\336\335\337w\251\006\375\220u?\233\027\251^e(}\327\336G\221.\342bs=+\367\207\027\336\255\344!\254\320\246^\340\252\253\227&\230\214\342wI$\306x`\275GT\326>\247\307\377 \323\224C$T\247r\226&,#Uu\321\365P\032/\005A\\\275\nU4\"\3647t\315\336\326\222\016\233\233\367\275\027l\311\034-e\010\306S\277\257\350\316\207\'{{}\312\344\3721\247\256\033\235_\363\031wz]\022\372\200a\324\315\261\365o\251\230f`{\244\270\276\350YL\251\223%\363\361Orpm\037z\210\311\tp_\021\276\273\334\212\367\262\231L\207\321oc\336\355\266\204\243\034\022VL\205\264\025\265\363\314\213x=\342\250|\325\357\314\014Q\363\312\244\310\365\310\032\375Q\353ra\016\035\323\224V\301\371\306\032\356G\215\335\3622\273w\207\346rIJT\244\273m5\271\307\345\366\301\325\271~\214c\270\255\2524\0146\371\373)\034\020\261\340q4x\333\037\315m\314\241o\323\324\246\357`\352\362\352\250\275\371\214}\007\264\272\327\356\230\3046wW\256\002\355\006\203\2137\376\320s\350\367\233c\177{\255\217\217\342yV\224>\224_\346\013\322{\304\213\255t\"\335\010\264\034\355\377\2614\343\226\211\227\364\227\037\226\357\353\267f\016\260(\355\036\221\023\234\267\343w\022l\'cA\216\251\371\371\360T\031\317\345\363$\230\026#x1\014w\016|\263\351\275\333\336u\315\343\3633F\357\216\037\027\317#\276\360\346\177\346\234\274Ibe^\234(\032\373\223+\234\306q4x\360x9^\367?\246\001+\312\'|J\206\004\037\205Tq\235<}\275\351\330X\007\275\'w\240){\301\332=U*\201t\037\357\312|9m\\\177\345\254\211\337\225\301\334\206\302\231\327\027\213\341v\314\273\313\241MmP\325(\0250A\275\311\2051=\321.\357v\234\235\253o\360\375\370\273V\360W\360H\001\033r\335:\204\271]\326\022&\001W\275a\275\372M\246\004c\311\274\205\335\336\253v\313\351=yg/\335\353{\n0DW\377\221\032\336\231F\275\345\337\256\275P\330\021!\np?\322C\220\230\317\327\223&\212d#&_\003R[\207\027\374\375)\022\356\222\366\367g$\336\274\376{\241\216\334\037\305\202\017\210\275m\307\177m)g\336\2539\276o\023J\267\3449w\335\3702\231G\366\005\364}#\235{E8\216j!\027\327\301\360~\347\314\220\023\277Q9\376\273z\303\n\261\270\037\227S\252\337g\365\365R}gA5\272\3707Te\363\321\315t\272N\330r8\356\344\367\375\273\335\206\240/]\226\315o\212\331\037\037\026\214!P\217|\003l\352\337\215\223\315\215\310]\324c\306\3177C{\260\224*\356tq\251x\373\206\r\250\273\025\252\367\022\243\236\352\270U\314\254\363\336\036V\200\337\233\215GmW\342k\020\3328\372\005\025?\312\236\354\025\270\032\177\266\377\274\356\0176\353_\214;\253A\247\034\331\323\336\253\255\006>y\245`\245\313K\276\342\257~\021\026\275\272\327\257Y\363\300\250\307\200A\321\321?\314\007\374\306K\217(\334\374\021=\034|\277\034\251s+t\027z\367\264\034\376\366\336\321S\035\337qc\337\273\026z\245=\357q\266L\206\242y\234s^/\033\261\307\316\256\215\234.f\346{\371t\306\272\006\341\247\247\236\277^\217\322\035\314Z\203\307\023\305^Pre\035\310gw\250_\315PZ}\253\306\247\235\301\321\254V!\21659/\347.\346\031\230k\316\343\233\302\351\351\351\344\237\357~S\342\244\260\335\034uj\312\234\332\250%\252\035\236}Q\223`[agM\277\264]\347\013\304\251\370\277\272u\306o\325KA\335\036f\346\037\364o\314\362\347\375\270\177\301\336D#2U\336\320o\335\244\200a-\310>\366\270\001\240\257\262\305\257L\323\356t\333Q;%\205\004\206\250\203\356\326\375\332\222DI\020TS\221tK\351\267\275\336S\262\300\275o\260\313\243\023E\357+H\325\204\006\250\002\355z \257[R+\n\0314\232<\203)}w8\275\266?\016\273\327\'#\251\n\321\367.\376\311U5m\021\216\024}\352\006\244\372-\366\330\232\3227z\303\352\316\273\035\316W\242 \000\360\232\311\312\317\253J\233<\373\332\335K2\224(B\204\003\243U\340\223\250$#\027{\374\242C[R\377\301\343\275U\315\017<\326\305r\244/T\020\274\366Q\023\3037\370\315\206\013A\ns\337\275\214\342A@\335EAm@i\023X\350\336\236\0214\351\nBD\001V\331\227vNV\222\317\232\227\363Nu\257\325\000\325\026E-\215n\267D\200E\234O\222\016\301\032\360S\302[\377\363G\222G\360\213\243\016\224\322]\032NU\214qM/\325\353\252T\372\265Zv\240\347\276\205\036A\345\257.\0331\024\036\237\037};\301\367>2n\242\363j}\300aR\243\247\273\326[\241[\201\351K;\202T\204\203x\237Z\025\342\236\316\332\003/\351[e_\016pMb\244\034\265O7\rl?`\371\221\374\276\244\260\373m\374*\210\243K\223\366\371Wd+i\307\353&N\356\234\221*\326\313\251!\251\337\303\361X\224\222\2028\3350\222\034(D\"/c~\267\034ls\331\210\017\007\376~ :\343\272F\252\267n\216\364\327q\216I\244@\265\327oa\217M\376\010\326\022m\260\261\376]t\333\301\210\245\251I\235L\263\373\305\272\267\355\3008\217\365\231z\207+!UV\371(\351\013\251uat\307\347\356{\032\336N\242\3345\273\\\314\300\315[\024\252\250\335\337h\014\021I\326\010\270\374\375\370\372RG\275\317\303\201\007\341\364\0100\364\246\377\nN\027\003T\331\276k\353\037\023\0201\266-9\363\277[\314\336\352\301h,\260e\365o\360I\203\017\225L\363\007a\374\257\333A\362}\022&\177\016\207.Rl\3537\321\013\252\240~\364\325\2740\217O\302jg\200b\356\200\214\016\211\257\265\313m\302I\203U\317\377D\277>\026g\265J\035\257\217\033\003_\225\\\257K\376DM\322I{\370\321\355`\366kY\257\033\232\275P\377\'\251K\n\360\215\260\335,\354\373\272\243%\376\024E\226\373\355\302\255\271\357d\0330\330[;\230\201\251\323gz;P\177\376\345\033b\224E\021\017k[\310T5\346K\001\275\177\276\376\262\322n\265\207[\375\213\336\363UUI\266l\002\274\202+\254\231L\243\312ky3\2532V7\000\020\227\000\361\031\365\355W\301c/\274\377\241A,\273\375\353\255\374\003\336\363\367\205\303K\265\271g=/\271\244\236\240N\263KB\016\373\233Vp{\200V\237\020\204\263\200\036?\3039r\336\000H(Ao3\002H\361\215\376\317\177\206\367[\252\374\262d!Q\251&\377\377(\245\353\332w\323R\351>\242\335k\277\333\217u;\307\321\332 \0135LR\345\320\371`/\017n?\344;\315\005T\275\372\266\336\343\321\315\235\215c\233\346\014\243o\337:W\\s\177\323+m\266\374\316\336\217\325\326Ti\323[\323\221\372\345g\223\177\334\220\246\260\367\206\355V\354|y\241\362\335y7\351\273\017\275\200[\327#\270w\037*\324{\217\216)\211\307\351n\t\260\377\037\3205x!\273l\363<\315\217\242\355\344\314\273\37372\315\037i7\356M)\245\362\315\023x\217\230\376t\351\214\026\264yf\346/z\373\002\035\261:\246\r\000\217\374g\024,\204=\036/\234\215~9\027\257\374\033>\023M\302s\t{<\252e\255\316F\2464\207\'\337\"m|\226\035\320\030\340\352\237,\307\227\330\265\326\200HK3\203\'\200+y\277\230nTdW\217W&\364_>\267U\nw\303Q\350\334\341\237\266\243n\323\357R{7\360\341\341\240\307\314kNG\206\317\306\013\035]\2535x\301\217\357^\252\274\234\257U\272\205w\363@$v\346\177\'\367\244F\367\265\323I\025\236\223\005)\354:\227\277\000M\204\224\025B\312)m\275B\201M\"z\335\007\255\324\335\367me\177R\r\t\027\234@\245\352\366\0105U\016\373\004_J\325W\345\270o-\n\220\0134\033il\276\276\010/O9?\342E\222-\251\0034\201\260\371\306:\371\356\205P\327D\252$\202\277@\252gl\274e?m\245\260\"\276\323\251\036\373~\351\226\311\233\310\221\216C/\"Q\'\'\337A\271UR^\036\202f\210\235\2531\345^\232\246\206\365e\217\274\026s13\245\355\312\272\020\275\021\002\025\353\273\203u\336WDPg\r\331Kt5\272\271Uw:f\312i\312\253>\276\256\336|\316\3679\274G3%\334\022\320\275\337\327\271\247\363\340\356\366C/\322\2314;\355\r$\303\270\262\027zX\277\234\301\232$\222\346fw\376\257\341{\254]\210\237\357\036\010G}\371\363\371\375pzF[\217\313O|\224-U3\026\352|\311\'[y2\205\221\337\352\315;\310\372\343&\375(\223}NM\323\203|y\344\302\271\321s3\177\257\233f\302\361I\362>~\2074\347\343,\221\024K\375\317\336\021\026\2765f\236\375\035}1\300\337eg\'/\236\3628\305\205\220V\352\013&O\236\342\261\217\217\237\212Adn>\351\340\243n\362\np\272\374?\272f;\342L\336l4\255\216\002\266\277\351\315a\334c\034R\352\332O\262\327\275n*m8\213\027\374\237\265-\271\361\361\014a\247N\014\224K\016\002\353r\374c\333\255\263\026\rk\031~D\237\033\275C\021\314\323|8\256\240\227[kU\030\351s\270zk\216x(\013\226\324$\374\357v\355\021O^\367T!\005\007\220\350\374R\331\005z\026]\333\260\367\272\346\344Bw\264\210\240\327Z^\266\347\357j\275z\255\356z\246c\022\3710]$|\375\010_o\207\346\237\332w\2702\245O\027\267\351\t\016`\241h\205\314\332\326\316D\000\000\325K=\323\347\212t>b\016O\313u\035\323\022w\277\007\001gM\301\317?\177\257\237\334\235\213\325p\377\013\303\276\263\035d\212%\252\252X\254\006\364\031\370*t\351\326M%\035T\301\014\300\000\014\252\004\235\243\373\275\232\026\335\3340\250\035|=\360\020\362\233mtP;\341\360\271hx\216!@\327!n\367Lzi/M9j\265G~\336}\367\362\370\372\037+\376h\372\365\364\371\362\n\004\302\253\305\031\324\271w\027&\2551\3378\357\335\203\275\314\332\036)z\255VuV\026\367{z]\3756\276W\346O\236<r\311\314\376TC\223\005o|R\031\231\374_\356e~g1\370\271\023\265\304\313R\236\013D\376\n\257\360\347\323\363\237\270\204[\267\375o~W\345\332\245\260\342;\373\225\251\377\237\227w.\313\371?\252\314\360\177\314\376\\gS-8\372\'\203g\027<\031\320\276ZE\374\276<\010\370\262\343\363_\272}l.\034\217\003\367\017\302ob\374;\311\311\343:\227R\'\332\022\344dH\377\206Oq3\271\020i}V\257\304\304\263(KC\251u#\177\317\304\237y\214\222\331|\314m>\347\307.3\247W\235\257\216]\211!<\177\367\276\376O\205\377\214\014\025\211\225\325\220F{3hm\025\354\323\371]\rn\363Q\302\345\304\352\342x\241M\tT\313m\ti\376g\263\317N/\227?\241~\243\036\363\370\276N\231r\356n\327\315h~\342cU\272\334\241_\203^IC\323\334\235\021w\233\316\337\360\357\333\021<T\376y\t\362N\367\357?{\010\350q\344\216\341\215O\265\227\270e\213\251\273\357\313\0375\353\315An\010:\255\306\3060\357<W\316w\321\242\376\t\274\271\371M\255\347\316=\373\207\223\331u\262\272\206\256\362s@\244\245S\002\227\014Wh6\036\255\364\320\375\207\300_ u\363\211\307\257\027r\257\317\016\217!\036\276\355|GGIbG\225\210,pp\305\261?;0\0232\300x\202Z\361?\306p\204\207\247\247\217\374&\326^T\365\313\027y\3558\321c\003\224\366\253\342G\377\177s\347\326\306\244\367\213\035\023(\351\234\322\220\"\241-\3535\344`\333Y^\222\232\203\324O\217\335e\354\275\253(\245B\337\021\252\re\321\252\315\372\240\275P\251\214\022\274\307\262\361\352\274m\240\214\2174\300\361\023\370\216\203\023\374f\322E\367\347\367{\303\336\233\353\344wS\024\333j\303uUl/4W\367\242hw^\212\377\363\036\205\370o\021\026\310\275`\3246\237W\2239\232\276\267\272\250\240\020\274T\211\231\233\350a\2575J\027\311\251\241\250tK\325{\350\327^\270\002\243@\017\n\225V\367r\n\350\010\232\007\360\2651\321i\320!\217z\354\202\3179Wa\356\332\315\022\212n\220\347\357}p\003\244E\270\245(\273wL#)\230\206&\327zG\337\177\031IZ\237\026\357\261\337\336\020Eq\367\t\273J]\302\355z\326\303\272\376\"\365#\373\267P\034\2101 \"\025\353\275\365\356\326\365\267\227$\021\253\337\032\323\272N\335\361\005{\270S\261\336\226\014\3330-\023A\360q\361\374\032\212\345M\005TE\351\227v\347\3431Y\273\236c\021\256H\223\177\340`\347L.\221t\274k\240k\312\205F\036\355\345F\027 X\231\030\026jb\035\315\200Z\316\256\177!y\271\307\'?H\022\375\267\215\353\3451\2430s\361\236`\345\362m\034O\227\306\255\336\374\237(P\315\207\020\362{A\306Y\037\020\253\360\227ku\364)\253\352\203\t2\340\320a\306\377%\370\306\203\034\201\214\237h<mA/\177\375\243\247\265\346m\261\340\361\315\230.\2121\235\017\243X\256.?]\217ie\025\313^\273\355\242\250\2577\275\355\027\317I\333\"\177\205\207\275\354>\314\335N\374\275\307ZY\275\033\343\361x\364\006\247\230\321\366Y\3722D\030x\300\201\307\220\350\325\375\257\237\337-\276\242-B-\356\362\215L\033\031M\177)h7B\361\246[\031\026\3261v\220\253\274\354\337/\204\327\324#\237?\031\2162\320h\035\303\270\030\365\341y\233aM^\240\354\036\034\030Y\231\327>x{\266\354G\361y\255.\031\352\202\371\032l\267\235\272\255\304\251\014\273{\337\355\375\335\337\376PCm\3409gKl\374\336\244^\334\341 \247k\321>J)4`\327\344\302E\322u\354\231\212\200\212W\373\255&;\260J\013\325_\037z\277\347\363\370kQ\271\\\3711\365<\177\227\023\036\223&?\237\310\255\353\356|\203:_\367p\365F\242T\372\301w\013\026\373\215\246\235\031w(\210\207\317\374\2556\274\313c\354\004~\223;\273\236\373-7q\275\313;J\212\305n\035ur\245f\236\270\377\277\007vw\010;,\253N\036\333+z5\311Bc\025}`\341vm7\260\2576\305=\270\267/\377m\3039\226\215\334\001\'\362h\265qx\335w\007\r\023~p\354\235\317qQ7\0369E\360-oUGM\321\334\026\361\266\000\0024\341\200\352\364\'\nP\246Y\265\325?\334\032\363\375\303\325\217\217\247\333\213}R\241Kv\304j\250\221\016\235h\277\213\004~5J_\264\010\373L\034\236=x\341\3722r\215\354fy\276\322\213\224\220J\255\320[\013\325\343\216Q\341\021\222\336\3205\341\373\203\347\226M\034\275t\3255\010\204\2609I\231\2131AM]\302p\263\216\2715\356|?\361\027\323\317\034z\002\224\202\234\265\270\022>\001|\356N\303\216\032\346\347\320e\016<\232Q\260\375\234\347\301\000a\304\277gV\222\014\246O\205\233\325\372y\262\272\034Y\272\250\000\345\255\214i\355]\202\224\330MA\331/\341K\217\001G\345\263\344\345\311\\\242\024)X)\003\300s5\r\302\341\034u\301M\\\360k\242\355\271!.\356\244L\013}\357e\257\355i\337\250ydWj\305\330=\010\263\232\356\346\367\005\026\r\335\322:\3270P\311\n\357\333h\025x{\r\356\367\243\377\345\357M\005W\257Km\344\337\033\376\302t\262l\010\274\227=T\325\016\351\226I\276\222U\241\304\307\360\331\217\253\177E\326\367W\3757C\r\003\245\230\354\264\375\263\022\255e\355\372\374\257\320n\016Bv\362\230\235\303\036\230?\247\014^\361{\275\221\031\272\335\3649\033\204\370\350\"#/\214\334\3545\336\270G\353{\303c\355\347<\216\026\322\223x\341\356\276\177\205m\271\244\274\313\272FRk`\021mJ\275\254do\017M\327zg`?\014<\246&\225wv\005\223\375\213\276P\2145\266\273^\250\264\035\231\240\251BE)\224`\221\025d+\013\366\351\366\217k\246U\004\333\253\021t\225\364L\234\rF\357\340\017\3345H\371D\010\347\323\352\251\255\301g\230\211\361d\340\350_\237\330T\005\034\373\237\255_\021\321\312\352\3329\360~f#\t\356\365N^\252\223\353\210\021\366\266\275\000\005Q\341\363\033g3\342M\337\245Y\307M\347\355c\365\303\337\005\236\273\246Y\332\030\336\372\367\320\207\302\002\370\307wO\310\371\255V\207\027\006]\3669\354\314\035/\274\242}\347\205R\346\231\235\006|\035\016O\233d\305\325\375\325|\317\314\342#\307\214\2528\341\252\314\340\341\226\263\225\314,\035s\216E~\336o\377s\013/U\244\337\237_\365\267\325\346\037.\227\326\252\250a\312\230\257g\365\354\307\220.\"\365\337W\210a\0317\034\356B\262\310[\013\323h\342\024\315\230\340\376\236\374P\240\241_\356$\022\277\265l\316\343\257^\253\2206\322\275]\265Zq\365\337\323r5\323Pl\253z\227R\367\333R\241\234g8\005\377x\016f\036\315z\000j\252R\017t*\265\276\345\244\345\377\265\264\246\367M\344s\315z\213 \276L\314HS1\300\365m\303CB\2053\215\336:\376\245\201\361D,s]\3168f#&T\303\017\377\241\370\257\226\332\200%\262\365g\364d\232\306\224\331}%y\376\302\024\277\265\346\213!\227l\303\326\033\210_\354\263\276v\313f\3777\034\377\377\335\255h$v\276{\335\2505\265@0\213y\244\256\277\301o\327y\002R\237\255\241?\375\352\22336\343\271\330-\214\224\240(\241\025o\227\370mq\247\363j]JS\311\361,\203\313\266\266\317>\235tS\255\341\231\252\220;P\356\253\251\277\275\332\365[D=\373\356P\2003n\003`\006\250\177\206\361\002\352e\327\377\210&\264\200\022\035\372\032\337\3641\211f\224K\224\010\024\364 \266\365~\021\351\241@\217f\213\340r\033A\307\317&\304\024\202yz\201\022\275\342\016\320t\337\004!@\345\353\272lf;^T\2155\000\211\306\350\277V<\006\231\245\3352P,\322\261\237|\241G\n\307Q\307=\250@\231\253a\264\324\036\270\003\372O@hi\367\362\024\022\335[\233\347~\307\344\243\177\322\202\1771l=\273\\\024\013\335\326kg\257a\372{\306/\333rfq\3545\224\312\001\254\236\002\226\326\025\340\352\006\241lI\311\270\270O\000z\344\037gq\305\362L\267\272\203,\037\203\224\242\000\007#D\306U{\217]\334&\252\006\375s4\247\177\375z\217\204\351hi\006\243\357\253Jf\010\'\316s\346\352\260Pt/\237\362\367\371\276\345M\220\360\344\324\001\312^\326z\025\272E9[\274)\3329\3237%YP^\335\357\316y\352\277^\242\203\030\'\247\221\002\250}Sq\341ryJ\337E\006\253\037\014c\220\021\345[\177o\367N\316G\266\211\364\177*\325&\342\r5&\362\255\310\010\254\035*F\266\377\010%\362\025\200\371~\014mD\030\256W\374C\374@\000Z\207\270F\326U\001\242\003\302\206\217|5\336~\021\257\027\274C\337J\030\302!j\342\037{\357?\313\241\270/\237!\247\003\023Dg\231k\366\300\031\322\335r\206\251\201\022K\275a\344\2026\037\257uyp\323\317\"l\370po\371G,\213\003\316\361\253\023\3261\243\335G\367\215\250+\265q\034\001\007\236\340\274\253W.?\225\244\252\254\247\274\226\304+\255qL\320s\351\305\360\356I-_\361cc-\314\346T8o\265\262\367\235\266\357\257\377\224\367U\277\325\257\332\033\372\034\227\376J\036R2\376\335\311\334;\254\345[\n \214\025\257\377!U\277Xz\345\231\236\267r\337}\030\3676>J\205\013\014\r\324\330\366K\326\374&#\236\"sy\364\257\263\233\237\237\365\377\302\343\366\201^Nw\375\356;\014\037x\016Uk\325\263\016|\025\277\257\363\211\316\305\365cw\026\203\333\3617\377\377\'(\267\201Q\230_\327\256o;d8\254\253\344Y\237\272\237\344z\252wu\330\327W:\330\344\306\017\013\216\0238\3512\020\277\321\033~\311\206\030k9\311+\327\260\366$\321r[I_\361\270\302\244\332T]#\251\017\3701e\311k\231o\345\214\275U\355M\303]\336\035\252{\233%\177\272o\377?\3717\264\361\255ort/UW\255\377\331\205\231;\217\246\203NbHY\365&i\203\213\327\200\364\025\332\273\307\256\\\337\027K~\274#\033\272\336\350,\353\360\257\014\336\273tp\357`\207\312n\206I;npo\216#q{\334\177W.O\\\016\204\025\t\033\364\272\211\270\351\253\323\307\342\235\377\277\224\337\227p\271\013\351\336.\203\247\357\227\307Uqx\270\3760I4p\021\202A\033\363\177\343]-(\316n\365&_\033\261\357\033\230\357\027\035\227\201\272\273w\330\370\352\337t\222\337H^xu\272^\273\341$I,=\344s;\022\006\030x\340\033Xn\206_\275\324\212!\375\277\202\367H\275\326h@wI\336\370))K\213\216c\017t\246\303d\272\274\201\237\223\245\336\360<c\276\303\327\302\275\340\310\273\003|~\307<*\010\034]+\327\300\033R\335_\000\216\201]\273\206\267\3254@j\271=\367k\370\370\311\262(\210>\315\342q3\"\356S?\361Q\273(\253\210zn\254\252\202\003\251\243\217K\340\303\016>-.\275\350/{7\337j\243\177B\255\307\307\372yV\"\213\345\353u\264\2547\336\242\017\366\352R\0369W\307\217\204\253\370\363|\177\0014\202\276\374\252\357TgK\273\352\221\256\246\355\342\375\337uH\"F\034\316\035\027q\355\332\244\357q\313\253\314\212\351\033+p\341\350\3234\323\272.fw\004\250T\t\376\213\346\246\351\177\377\\\356ftE\213\264\351\271|r<?\313#\032d\2228\264\252*\321,e+;\212\335\342\341\022\226\374\226\243\221)x\351\256R\324\037+t\n\004\226\027v\371\235!\351\337_\017r\235\037R\213\303\312zQ\374wqg\2227\342L\007Wz_t\226N\340o)\313\370\240\335\272\240\252\202\007\256$\224#\311\000j!\370\354A8\tw\013\326\250\374\367\200i\367\276G\212\021\315\377UP\303\177TCC\271\020S14\207\337\377P[\232c\302\025\261\273\216\370\220\346\376d{C\245>5\352\330f9\211\360\335\266\334\240`\261\3612\272rq\227\213`\276\243\307\317\371\374\334\263\314\037\'\361=\350Ob\237s\347[\372\317=\303\243\350C\'\260f\373+\037\316\"\263\370\213\310\271\0131\365\310b^d\017$\202\344%\242\345\3103\325pu<\217\200\317\210\246\274\201Y\221\'$\336\307\204\254\355\177\232\003\263\304\037=\230\217f\241,\332\2709]Z\027\352D|=\rS*\361Oz\272\334$\316m\315DIS\235\363#\247\356\222m\200l\345\271g\313\250\037D\377K\343\271\250%*\267U\266\241Ts~h\3205p&\025\354m\206\353\347\276s+R\257\274\333\315;:U\236>\346\357<\355;E&h\277\327\001s\354wJ{\r\257\276\227cy\307\0008[e\356\337z\237\3765\3741\303\307y\200\026/-\031\320\002\004>\335H)\233-\203pn\335;(\204gR\205&dv\276Y\3563\362x`\375\310w\336\217\307R\010}\250\016@\300:\331i\223\364\246M\\\360\322\024\332\354\335>\374\'r4\340./6\034\330\243\205\243<+\231m\2217\266+\234\3507lF;\030Mu!\332\2043\232\273\324\001\226\300\362\310\262#\313P\022\t\354\235\275\023\374\033\366\250\234\264Y\245\262\377F\342nA\377\377\360\306:\273?\315\302\227\375I\307\352\331m\363|\270\325\021-\027\022\226\307\367>n\216z,\377\275\344\375\300o\2265g0\222R\224\214>\250\023\313\001\257W-\337\233g\341\321j\254mFX\020y\226\267\203h\336\364\\\226\004q\315\'\275\006\332\255\270m\362\360@5\244\021pn\250g\205\002\260i\231\005\363(\003\017\277pu\352Rj`\032Kwk\300\334I\314\262\243\223\225\003\213=\373\217\366\317o\017\246.?\365\232\th\227l\301mY\327\251\002\357\036\005\226@\310\002\0241G \234p\371\357/\220\234\275\263\326)\010\2155#\272\007-w{\240\357\207D^\022sy\226\270<\251\034\014\353\377p\262}z\353\317\016\r\312M1\337\301\343\242k\277\361\375\200Ym\325\265M\004\322\036\342\206\273\354|\035&:\207\n\353)\373\253h\353\221:\264z\305\331w\243\236 \317?~\376\331\307\275\344\253\333\207g \323R\231W\006\321-\237bf}\206B\333b\002\256\333\017\r|\005\366\2336\213\354zX\267\2631\234[\253\277S\014S\266\247\216Q\3463\005m\273\350\353c\310\367=&SO\'\247U[\271\017~\245PI\233\031\304\351!\210]i\023\262\363Etf\231\270\363\362L\244\225XM\211\233\370\374\355\225\203\256\277\337\302\373\357=\307\317\360=\317\334X\313\341+\032k\222\377s\271\021K\315\261+\366\372T=.\363\253-\325\016\274\2232\254\017O\333[\374\\MR\277\021\343\021\337\340\371\026|k\326\206q\031\323\331\237|\200\237\325g\244S=A\260\243s\337\013\027\302h2\360\343p\346\341\246P}\234j]\205Q\257\335\355NXi\365d\255\036_\017\360\277\337[\216\33023\265\3165\263\234\335y\337\n\332V\366T\340\177\006\317\270E\326\263\377%\014\323\265\223\202\366\373\316\004\355\223\026:\177\rr;\224\235\252T\273\036\271*:1\371\375\303\207bC?\301rj\242N\003\325e\240\253ec\205Q\351\343\320*\276\032\031\332\325\025A\252\355\352\251\202\2752\365\016\367VL\235\333/\226\376\244\254m\2144\'\274;\315\'.#*\232>=4\316\277\351\234\273\243\'\256\375yT~x\252\252o]\320\273\363\277{b\314\271\347\331x\243\255\013\337s\207O\'\'\232\261N\326\254\300~\374 \364]\217^\3215\0217\323\2103)(\235\361\356+D\263%Sh@\023,;O\252\236\373\247{\252%j\031\305j\317\217p\303\000\372\365\236\037e<\340\3419\274\2401)\032\2502\316\312\353e\211\014\314\212\034{\225\321[\275v\270/\226\300\326\254R\254\3325\272\260\375u\311\\x\236V\335\346\274\271T\363\365?\242\241\246\253\022\210\222@\240\217]\356\254e\336\\Y\227\235\257\222\244\310\321\260\364\252\342z\240x\372\230|UPyC\253\333\010\240Y\356*\230\342/\370\0105\207\350\324\3502\344B\335\2071e\341\344Dr\336\245\030H7.%\335`\325\206\344\247\252\227\276\303\255s\316\276\332+\240\252\335\331k^\322\331\357\'\037\010\007\"==\020z\377\211^\275Lr\340\236\223\276\275\232\007\250\337\215x\235X\211\337e\267\022\325\310V\263|\036\374\004\303\217\262\241\302\317qNJ\262\361\276\337\3262\361\2047\320\354\360\373\017\260\360\226\344\017\037\274\300<\245\353\035\3528\016\217qK\\\252pG<K!\221_\306\315\376`\241i\215\234\020`\021\034\255_\353\027\242\375\325.\026\350\201\240\341\376|\374\346\367\251\224\004\277\0054\366\036\337\327\277\n\232ej\020b\261V\343\030\367\010B\252\262\234?\032\355\037e\316\277}`hJ\3301\257\305\340y\351\265n*\261\315W\256\325@5@r\300\2614d\021\0003\367O\356\263Z\246\251\321\316\345\247tS\266\241\323\271x\265\322J\276\034\272\212=\303\215\376\337|d$rv\275\277r\203\374<\022-\266\344}\267d\000\353\371\240\251:7\366\026/\314\355\241\317R\007\032}\340\251{\365\377\371\345\034\247\'\255\312\347\305\340<\007\275\211\251\203\333\t\364\004D\364\300\367\374%8v69\234\203\342\355=\303%P\274\234\003\376a\307~mm\021\325\320\233_c\223\342e\020\245FE\213\321\276\010v\243-\351<\351\323\246\342>\367\203\201\253\337u\225T\264S\026pD\323K\337\021U\n\361\270\371\311:L\332\216!+\221\323\373\303Q\3145\3305u(\315\367\363\r\306\000\020_\333!\344Sg\231\351h\275\371\300\330RX\276,3\355\254\374\321T\330\327\2537,Ut\251\265\260\274\351\231y\273\271\251\022F\335wh\370\227R\036&\356\313\227\307P\376W8-{\357\306u\342H\321U\274\363!{\326\322\246\216\014\002\240\006\352T\231\202w\0174nTs/\362y:\211\276u\272\307\371\037u3z\216^ZC\333\353;\366\226\272\271)\025Se4\273\"\246\013\360\34512U\'\240\275\377}\270}\377z\324\365{\002\314\003\2654\315z\260\253wa\335X{\037\233q>\257\354\321\026\235\013\355\373u\277_\335\314\244$\341\275\375\324\354=\311_\354o\023\374\037\237\365H\210B\337\255{W\346\362\377\326>\342\245\304\263\316[.\363d2\371w\335\324\363L\201\"e1\035\266\353j\263y\217\237\377\215\264)\257\275\177\3516/\366\267M-\270_\206\333u\264\363\'wk\327\223\027\311\271\255\356\013\266\341\364\273\265\255\037\036\n\\\206\327\336*\217^\231\307:\035\370\024\326\234/>e.\341.\372M\203n\275T;*M\310\242\234|>jV+\035*1\372\323f\035\033\306=p\020\277b8s\346\213W\005\210\257\256\362\177\346\231\256>%\214\255\257\177Q\323\007\232\355-\205Y\336\371\267\306\317\266\350%\205\240\357\311\265\376\256\325\303\270a\360z/i\323\373g\235\321\"\274\215\3225\304\304\021\335P\333\362\206\205\210\314\330a\365X\324\337g\237\310o\307\355%\335\330\276\247\224\344\217\351\321\177\275\300\271\027\215\373V\234\033\006)\303*\262\336h<\374})\235\0303\336\365Q\315\t\337*n%\371\277\036\337\357{\217\337\023\374\304u\232\017;\231l\265\276k\244\356\346s\310Mr\020c\006?\343\353\313\341jS\355b*|\276-8\370\355\366u\336\304\210\251\315\373x\200K\370\231\267\314\316\373\213\177LM\353\306\025\354\315\3348\\=Y\253\207\333\345\311\356\006\313~\025/\324\303\005s\343\224\244\336\267\0378q\334|\246\262\305\235V\227~\331l&\264\032\367\353\222\233\252\357\017\343WsL\335\346@o\363\244\2558p\366\021\014\177\'\301\324\331;\277\253\306\327A0\234\300\346A\333\277\034ClK\272\305\266\345\336/j\202\252\256\253~\272\251\325?\261\364H\262\224\t\r\355\245\330\346\3708\246\313\276\377\340\307\371&t\252|\177i\346\003\234\373\344\245\375\\\373\353\3771\363\010\211E\272\253)\337\303\200)\327|d\371\007\312\217\371\200\357\0172\323ss\0340e?\346\254gJ\247r\312\363J`\306\'r\235\311\223\275<\362\247\253\231\270\251\244\337H,\\w\334_\223\314\341\326.\273\347xU?\311\371<\311\r\223e]\361+\230\360\357\014\030\321\312*\177w\023\352\377#\377\\\321\332\310\373\223\306xc\346\002k(\257\320s\272\366\035Nd\237#\251\251\352\366W\207eL\375\t\203\030\237_Y1\364uh\357\351\261\335\367\024\000M\203\354\362\231NdfR\372\323\251\206\346f\255\232\363#\360\306\355\347\361/z\244\274=Wxr\203\377\027\334\373\216\327\300\256\271\233\3368{\351\260\324\364\345:\255\312p\035\327\314\357\306\341\326\375n\360\214\266\236\267t\270\335\3077\366e\rU\037\'@l\361R\261\315\234\277p\020k\017\332A\223\346\014g\231\371\026\014\321\257\235\307k\345\346oIh8\274\3307\250\006\251\275q\332\016\250\256\265\177\334_\227uR\215\207\260\325\377\377\374x\252\340\334|\336\200\331W^6]\306?\313\355Hh\374j\3407d\023\0064\037\325U\002\346\270\300\320\356\361})\273\227r;x\231\251\201*}\006\233\317\227\257j\371\312s\010p\267u\260\247\264\037.\353=^\304\3476~V8E\374\273\330\374Z5\346l\177(l\374\246\272\r\007>\257\361-\0074..\n\353\230\177q\372\334\3377\303nfx\"\307(\346>\342\003X\306\271\013\2153A\214\342\346{\333\252\226\213P\366T\036{\003\201\276&8\345\325\032\343\361V\326\275\177b\367C\320M\260\005:k\255`?%]RdH\363\256\346v\3420\3547\231\335\035\321\260cRh\210\327\037\213\3767\303\303\360\363\274\230\232|l\273\207\335\362\273}\355{xh0\365\346j\275ld\332\014\027$}\022\365\272j\001\031\177\325!^\210F*\351\024\325\3350P\325\005\330m\377^m\356\257\256\225m\016\245/\372\232l$\255\320\366$\257t\210\335D\031\277YfB\220\303&\346\005\310P\366\022&\223u[-\260\221\022w4x\266\2050\327~\r\211n\224\275\336\332{F.\024\027fA\331\002<P\3021WbM\366swGwG\342^D\275\324B\2576\016\244A\026\030V\333oo{\032\204\251\034\367\366\3532\314F\350\242\024\030y\006\224\241\333L\231\375\\\256\363\037X\261y#\224\253\345I\013\270\020Uow:\263\000\'\336@\255\200\377\275\347$\324\023\000\210\322v\256\200\024\247R\037W[\013rH\343\373\222\211\232\027\264\3672jd/^hFY\303!B\025n\337\364\273\335\240{\302^\207\327\273Kk\337\321v\274]\316\257[\312\2765n\201\232E0\230\002\334[\200\267, \365V\022\337\273\312\326\364\032H\236\017\r\023\312Y\311\322\244j\225N\277n\230\315\002\327v\243\212\365HT\t(W\365\014tp\370\212\031\211\347\2575fv\266\224.\325\313\327\231\331\203\\R\020\005n\314^\337\354\323BRC\231\021\212\363 \325@^\201\342\365y;\3205-\303\034\230{\212\220O\"}%w\265\366\277\032\035\226\236\340\372\005\232T\203z\267A\350Y\233\366\334\013\377\317\177\206\000\026\035\327.\375\314\346e\370,M8\375)\362\364\026M%\266k\272kX[o[\252\212]\322\017\3752\267\017%U\341\265\271\274Sz\253\366^\322\377\315\205\234\213\241\334@I\373Q\333\tM\215FrK\334\330\024\327\005\0357\356\037\372\223q\030\223\335\367\254\350\371\363\272\360#q\366\367\277Ol\261\354;\203\230(%\206\346\272\367\252\335\275)\261\375\224j\033\234\237\037\366\306O\000>f\362K\3414\375S\216\022\205\177\360O\273\'\355zn\227\277L\322\253ao\275H\316\245|z#\237\236\357\201s~\026\303\330w\377\330;\247\355\203\367\002\3749\0313T\r\316E\336\267\273\337\327\273,\273\006\340\312f\234\357\350\337\335\365n\246\223\327\273C\346\301\325\356\333\356\347\246fp\342\245\331k\260\313\246\325=\310\272\357\363\357\210\336\377\346O\306\t\"\336\304f\252\241\266(\024=\240f]\337(\025y\231\320g5\364V\016\034\301g\034\001y\020\224\207\222\227\275\354\316\233[\026\374\225E\362;\307\334\345\004\254;\237\261o\260\347\204\004\036L\247\036Z\352Ay\340\014\305\320\t\3058\255\300\013\034\331\315\226z\343\204\237\254\216[\352~\213\030K\016m\321\t\360:\220\036\216x\325\3358]Q\237\323\206T\360\361\301k\203*se\225\237\225j\207\237v\024.\244\377p\200w\307f\315{\311HOn\276n\357.\250\273\341\"\351=\3740\245\326\007\206\354\303\243EC\372\323\346\336\206\004CB\357\327\231\244.9\205\010\016\214\251\307\251\252\031`\026\350wUm\224\252\203\210\232.V\326\273\243\334\023\325\373\207\230\355\356\260\343\330\210\241\300\326\037f\240\331\006u\000\275EU\005I%&\270\216\027\250j-\324JB\213]\"\026\234lj\000\231\300U\372\232\367~\265\354oR\013\323X\346\317\024tJ\335\352\324\375<\271\003n\234\022x\362\323R\367\364\361i\351rx\345\270\267\271\256\220\3232~\266\376\207\271\324\235\005\355\302\315-{e\365\302\366\205\322\361\010\255\000\033\344\273\230\327\037@B!<\203\266\330\202\336\"\r\377\372\326S\'\355m\304\003\246o\367\265\001pV\201P\250\202\221=\372\352\250H}\020\023\032\276d\005\345\256/w\316\361\224!\302p\362\326r[\315*\361@\027e\203\313sF\245W\275\\\251{\331U\264\373\362\364\314H\360l\353\333\021\345\017e\242\372U\270\264\275m\036\036\312A\260Q\206\367\343l\033\300\325r\246\254\304\244\0325\315\310a\240P\004\017\225g\325\",\213\225u\000\034\265m\027\311b=o\332k2F\267\272\232\277\265?\244L\363\317<\344bM\274\371@h\003\244e\252\013\364\r\365\010\221\345\363\363\365\036\2516`\036\264}\261:DAN\274\231\301\324CG\315\2004\r\340\343\n$\024+\371\270\363D\365\242a(\204\002\326\261\326\337\244\231\271\n\367\221\323\025@\211\324O\375\337\356V\351\340\222\'\311\360O\302\352%\330-\373\264\205x\034~\343\223\331\325\352\325\207\224\026\300\263\2224\004\354\316\031\347\201\340\210\263\362\301\244\366\352\344\247Xj\337\373\245\355\356Tg1\352\350G\017\014\265\263\037P]\277\350\342\303#U\350\264\260\006\373\334\030\345\2634\237\335\257y\231\262p~\251\246\262>\375\016\345&L\364_\364k\333\374)\253\255d|\200\353u\276R\365\266\037\377U^\252\331]\031\010\204#\034xw\346\344\216\226\214\311\252<\007\302\336\233\305\357z\336>\036\376\306\221\030\273\224)B,+\r\300;\320\276\227\367\260o\361\225E\333\016$\342\377\226L\2355o\314\031-\t\341\347#\355[(g\027\017\330\317^\302j\2702} \306\025\025.9\277\377\360\377\244\343Z\200\245\351m\324\350r\362\241\374\322;\377\361\206H-\370{g\000\014qgv\006_O\004@\023\247F\211\'\277\336\033*\361\367\334?\277\376\226\344\253\017.\013u\374\010\020\245\347\241\305q5[s\307Z\266+\025\212\357\213\343\237\304.\343\021\010\216\027\271\223<\343\231\353\363\217^\335,\367\2243\023\365ky\311KuJU\036Jry\33265\362\370\275\313XV\371\005{\232\317#\312\365\313\357\373\304\375\313\341\020\305sY\352\257\225\354\034\"M7\2169\347\'\231\224F\253\2212\202\275p\330\256k\345\312\245\3746W\347<]\023\355z\327\254\355n\346\354y*C\363\277\262\353\357\377\237\217\343\252>(\271\364\361\3538\352\373\007\274\367\0238\246<\347.a\237\t\345\255W\303\256\326\253\356<\356\361\345\313\355\366\2074\327\313_>\013\246\021\310\013\325\337]\246\217qH\256\005\375\331hJ\227+\026\255\320\022\030\365\315g\272\370\304y\360\266\023Q\306\203\255\265\255p\362\327M\t\247QF\277\017\343\323\311U\324.?\326p\226\275`\341t\265\242\315\320\371\376\220\237\3615Ym\275\217\2203\340\374 \030\005\304\2348\301\225\265{v\375zX\313\0109\227\313\373%\033\027\357g@/\345r\000C\225=\334\367\240\373\363\313U7\013\033\206g\322_\237\'\365\0328\376-\273\320qUW\377\202F\230\334\016&\360\2066\256\3425\006\220W\240\306\276\341\377\0049O$\366\254\377\001z\273\024\362p1\270\007\322\227\000?\247\310\235\350\347^\275\272\207rh\350r>\377\337\300@\0059\345\204\367\307\232W#oye\224\340\237sK\253\300\334.\007\3568\317~\377\257\254\370\236_gI\214\265Li\215\376h\214n\267\235\241\321/}\340\234\014o\371g\274V\253\350\323\367\016\227\316\357^_\021\276\005\300q\247\344+\326\353Q\316\254\306$\333\263\373\207\270\030\336\375\325Y\246\365\006\206\225\202\275\333rI\215\023\201\2526\277\005|.\026\300\n\363\317\341\375map\023_\243\306_ef\362\005\366\3024E\255\271\033\3715\001\302\367\230\021\rq\365;\364\346\236\244\236-\2074\376\342(\244\211\343N\002\300?#c\227\037Q\374\256uz\252\362^\224\330l\014\231Z\330\211\016\177C(\005\247\"Hr\370\010\230[\235s\0370l\343\204\350\364\315\013\254l\302\206h\027\026\302\267\352\335k\375\277\332\337\311\357Kt\225\332\244\255j)Ge\332\035f2]\354\3476\3338\267\360a\261+\264L\017\231D\365\353\320U\237\020\354\332\214g\013DK\354\261[j\200\374\227\251\360q\277^\267\217\366\255/\257\246\271H\032\316\325+\371\\\2148\302S\302,rd\014\251\224\311.\325[\352\315\273\3019\313B\264\027=Z_*\340\231\252NwY\007\2633wk[\371g\206\263R\326\372\331\002\235:\275\312\262>\274\334\345\376\013\252\263\320\345\321u?\232.\336\014\3640\0037\277_\355\247C^>G\204\232\330\346Wq\234$\213MP\032q\007\221\366\207\223\245\325\220\202G\353%(\260\355\254\353\322o\324\025o\327\023\371\203gmfLi\364 \321\371\366|\244\340\223\257\354+y\237\363\022\333e\237\014\267,\234\271v\264/\256\306\217\261\033\275\365\004\275\3240\036\253CU\243\215\332\032\355{q\"S\032}\020\345s}\365\237\214Cc\007<p_\301\256?C@/\373U\312\255B\2577\336x\251N\312\245\242\013\221\247\001|\027\262\320X}\347\034&>\034\254\265W \376\276\362\273\3532t\236k\306\017\345\237\346\220\316H\177\236k4v^=/q\017\377\230\304.\2703\036k\227\313L\226\266h\025N\253h&\211e\243ny\352\345\001\324\272n#\274\357\360S\343\231\323U\347e\331xe\027\257~]B\3775\036\241i\266\265\236\017\030\300\227\3266\267\3645m\351\226w\255\266\207C\226Q\331O\277\203\240^\272gY\tof\002\031yk93\240\232\335IU\'w\277\202\253\016/\316\267\335\333\257\371\367\321\273\374\314\320\371O\201g\247\256\343\212o7\371~\313\366\232\036/\316\215\372Q\214|\023{\231\250\005\024\342\233\366\036\2521\373\325ow\346\252\247}\363\243g\277\336\367\236Lluu\305\366\030+vo\277,\204X\343\255\336\357\345\010CC)\343\325P.\235\3671\233\373\r\227p7b\340o\237\336\367\017\342Xx\337\213\357\227\003j\033P\363\010L\353\031\236\016\301bc\350\r\227pnE?\237\304}\345\026\3466]\301\272\247\342\367\275\360\204l\233&\316&P\213\327q\364\362\345\034\265\270\376\344\034\215\375\343\247\275\342\'a\200l;\336\377\275\330\323q\340\273\336\350\005\2407\355\272\2548\265t@>\014;MvR\253m(jc\036\303\266\365\005\2247\376\236Bp\343\002\222&\007\207\275\337;\nu\260<\336\030\346\317Y\276\007Gm\255cM\027\256\2035lS\332\334\217\tu\326\204\201\375[m\276A\315|>/\260\360\355\365\314`\217z\345\337\256\335\275\265\r\335\367\316 \006s\265\277\330y\"\330v/SX\177\213\036\243\271\372\337\352^\rM\005\204\254\346\200\305\352\017\213\353=U\262{\320\257\347\237|ME\350\344\355A\337\032\267\210)J\273\323\216=RQ\327\335\315[\304\351T\367Yl\242\245G?\252}\314#\377f\356\362\325\3575y\236C\361\362o\235^\363> \0077\300P\217\0014\375if\351\300\373\357f8\025a\226V\2519DM\274\037\371\377=\306\205>\006\341*\262\366^\237\307\303\005e\221\204fec\255Q\365\243\216\243\371\212P\235\257Y\347\334o\361i\236\265\237\033^\360\255\327\302\031s\3631\307[\255\245){D\325a\274l\0359\214\271\304E\302\377\320\346\227\301\371\317\036\257\3457NF\275\255`\0162d\356\221l=\232$\343\366]\005\356\224\024\210\262\354\237\336gN\231;\206\353B\367\253\262s\367\376\177C\007/\232\310K\347\343\335\\\336\023/\270s\205i\353\212_j\224\032\372o\377n\344\363i\323{t\323{\305\365\326\256\233\361x=\272\341X>\212\033\320 /Y\310\000\330T\244\276F\2502\226WD\307\331|\263\266\225\365\365\340\370YT\315\n\336\362\202/F\354]\343\314E\341\020\331T\375\322\337:X+\376\206\367\261\224\256\023\242\277.\343\354\275u\264\227\204\220\326c\n\353\212|$\272\305\363\007\363\025\303\300q\353\330)\032\207\360\212\211\234Dm\226k\275\352\361\220YX\313\232\367M\333\323P\277\244\252u\377\246\376\337u\256K\301\276\272\234\263\366\024\271\324\370\030D\025\376\264.\376\333c\202\205\235~X\370-\307\351\342\246\267\345\024\251\256\301\177\014\262\246\223C\213\324\225\000\177\321\313-\361Kc\004\362\256\005\263\377\032\206\031\004\335_\251\322\370\373\353\032\337e/kZ\3070\335\026Oj\234\236\3653z\036\274\361\375\r]\202\321|G^o\277Ev\202\\\336\004^\350=UKi\226\3513\020\207^2>\215\374\002<\217\220\'\236\326\"\211\353\375\240\270\253p\353\314\205\374\337\177\031\264\227\241\354O\344|E\3509\024\264|\312\023H/\277\243\323\032I;\233\237\351\231\254`N\331\205\306\204_\215\313\222&z\333Z\246\347\377\250\222rf\207\350\336\246\246i-\257\235\302\"J(\315\257u\027\275_\217*\362\317A\262\031\367\257\352\336\037\264\351`\314\246\357M\206\275\250\274\337\237L<H\201\272\3345\025z\252Em\337\320\240\002+\r\325\207\022\375kdg\365\262\375\272\326\016\370\233\315\325\033\226\254:\332\302\025m_\256\334\301r\240\277\273\217\336\364\254d\323\362L[\336\356B>w\n\237\231\266\003\326\303\016\037A\232a\3558\236\333az\334\027\36061^J\252\256\233:\017\ti\307\351\314:\235b\355\377n\007\356\275\356o\204\353\340\352}\247\301\272\247Lu\2547%\226\255\274cx\177\277\257\344\376\355\343%\370c\1777\301\202\373\356\307p\234\300\350\277\372\311\233\256\027\025\334\2276z.\272:CNS\360{.F\346\376\276\tq\232\331\214;\357\326\274\371\326\333\223\326C\227\370\325m\033\217eBe\337c\374\250u\356\356\360\366\244\367}\223\364\350\221~\033Z\300\343\236\313\362\270h?\374\035-\372\335\371[\352\237\301vo\334\265\272\367\316\3174\265\312)_\3657U\002r\037\024\211Y\347\261\"\240\334\375o\254N\026\036\243\226\031\t\345u\342\220\035\333\325\263\360\331\226\037\313+\336\273UU\372\243Or\'\305.mQ\363\030\227\245*\203\233\301]Rd\321\272\217\227G\265\247\0234\275C\000c[)=\rnSv\354L\246&nO\232\351\323\tjb\345\303\010\006=\235w\334\355\345FA\204\237\372\035\027\264tH\220H\007\373>\344\320|\353\207\377\217\360g\237K\325\363\0314\212`F2\204NHZ^o\205\036O&\227 u\357f}\363!\365\247Nd\345 \233p\273Z\032\037\230\311\246D%KN\260*\263\033\3512\257/\204)\330vB\322O>\372\243K\365\022d\252\232\232\356%m\363i\241\013\324\260\254\241\215\021\345\271\n\357r\021M\207\031\320I\332\312\244a\302\353\252AP\244I7\251=\272*x;\322\355\311\223\260Um\227\346\244E\004\007\322z\002$\246\024\026\302H[\264W\251\231dZR(\273t\222\330U^\367\256T\211lE\010G\245\322HR\222\277\rt0\356\267$\301\'\207\304>\272\333\357I\343:Q;\353}\253\226P\240\022!D\036\227\253\325\266\357\324%\305Vam\006\206\344_E\'n\2445}OD4HZ\327n}\371\006,\310\\\207D\206B\230H\210\223\'MJ\223\372\201\342\022\024\204`O\nx\244\2405\351W\212\032\335\311\275\272\022\017Ns#\005\257v\350}PU\350\256\330\3256\372\025\331\377_A\353w\267m\001t\325\335\336\275\220\317z\225\364VEm\351\363/\324o\225,j\253c\253\312\357\340q\304g\233`\245\214\3232#\212\023\016~\322W\203\324\221\027x\372H\237\375%^\202\306J\315*V\247\345\223\344\233\367\207\227w\322-Dy\333\242\036\023\034\373\3542\227\252\246i\367?\334g\376\351\367\372\372\257!\273\371\325\256\325\260\210\211&\343f\305\274\r\377\003\343^\366\237\345\031;\276\377r4\027\302C\r\207\217\217\236\333\262\210\203\3359\021?+\032!L\313\211sV\346\010\357ze\310\273\360`\205\232\257\330g)\245\367\025V\221\022\306\336\315\325j\240\026\257\257\\\225\251\372C\357\\\004\376\256\242\265<-y\225cK\337\202\253N\225+\233q\253\215^-\324\314aZ\224_.\1779\361\214:Y?\n\356\314\013\237\337\272\373B/\r%\270j\365)\026\367\272,\225BC\262\321\200:gF\253\233Q\304t>\361!3\024\250\r\2006;3r\023\025\016S\252^\335\356W\232\366\216&%\336\n\036\037}\316`=\005U\343?t\025\026\234\"N\t&L\251\021\213\177_\202T\354\341\375\337\241\355T\001\336\304a\017r>\217\351\033$Y&\355\231\264\272E\230\342\247$\323\210\376\255\223\315\243\243VG\351\216~\321\320\372\007\262\030\312ZII\013\272\236\376\217\004d\243]\021\177\267\211e\355:-\366V`\253\366\034\033c~\204\3730\323\276\375\027\204A\206S\350\213{\263\301\372kM\207\237\377\342]\r\333\267\322\334\243\026\334\263\365L:5P\324&\371\260J\265Z\371\314\353\232\000\264\350;\264F7B#1b\3550\227L>)\2103s\003\010}^\036AJ^\376\355\344J\303#\335\000y\353\234\265%M\0316\323\177w\307\253!S\371\247L\251\235\034\2752\200\r\304\231\227\tn\2234m9\301U\r\357u\307\036\244\242\355\353d!\255\202\340k\370\215\351d}\307\343m\tu\307\372\257xm\237\304M\277#w\235\276x\224AV\367H\347w\342\"\327\231dG\311\307\005\323\233O\332\324\227\261\023\235\327\354\016M\323\'\357Z[\'.Z\325\230s\tX\314\267&\020\236\013\346\214\341\317e\325\017\212\317#\241w\356\345r\353B\214?_\231|T\373+8n\033^\275Y\231>\334\351\365\232\026 \270\342\267\005\267\357\034\330\362\3031\t\321\232\277|\232\324\227.ZF/H\343E\337\216I\'\022\352\333\255\374\326\3010\375\273#A\035\254_u\316x\365\177(q\2735La\3112j^v\346}~X\247u\276\265\216\207\204\357\362^\241q>\'p*\r\205\014\033Rix\301\333\203\304;\235\213\201U\226\252\222\354?%\377\342\2679\037\201\246^x\333f\333\355N\353\317\311\336\360\036\320\373\366\347\306J\252\3637\375\337\301\267e\000Vs\363g\007\241\250\324\177@\335\232>\334\374B\342vG\343\300L\336\177T\327\253n\2347\004\264}\025w\315Pe\354\274\007\270\255^\337\003\350\307\003\270\256&\253\331\267w\225<sJ\220\254\367\357<s\014\341\327f\370\343<\376\240\366\003\271~\306w\330\016=\330bo\244\357~0\007\223\006\370\035\342\340\362\264M\267\304d\325\364V\347\233\372\342\343\007\3358\361\346\234\311\302\373k\3421\270\032\203\224U|\'\237`;\201\314\352\013U]\331\240\306\216uj&\240\332<\307L\364\370\276t\347\r\245Y\021!\217\317\303X\000S\347\356_\300\275u\337p\036\370\200\000\271\027\031\241U\262\261nZ\272\021\325\347\325\277F\021\375\025 /\016W5n\250\374\361\300{\301\315|\224R\277\252\255\325\004\246\306,\235\242x\337d\377*\361=U\306\225\\\251J\327\316$6\026wKpw\265\021\022\226\353\265~\227\304J\351\232!\275V\026\353\3149\324\210\233\323\241\272\371\026\211\230\277C\355t\027\261\2341w%\006\306\277\205E\013.\324\275\177\202Y\350\224\206l\223\203e\013R\370\324\231o5\252!\024\"\"|^\303\332rn\242|Q\316\360\317\261^\321\252cd(\237\340\220\247\213M\355*d*\353;\031\272S\226\251\234\337O\241b\3774\243\304<\370\344\231V\266-\2165\221\005\370\256\333\022oei:Iy\211\022\013\246_,\302\267\021\232\231+\322t\222\216\034\266\206\240\367\274j\253\277\224,\314\345\332\255\227\317b\264\227G>\365\037\233O?^n\245E{aU{\006j\263\337\363\237\203\232\211\356\311\025X:g\343\266\033\345\366\326\331\035\274@\000]\275\274\271K38\274\337\264\025M{\274\245\373=/\324Y\037\177\202e*\266\033Q\3062TT7\204S\031O\023\357\256f\267\004\323\002\234t;\030e-\306\346\375f\276\276\270\206\374.\227\315j\3173\251\233\014\\\223\251\245gU\007T\315\331\3537\376A\377\350\237}\376\230xH\246\257\016\205\364\327%\354$\237\311\325\234\307)\317\221\374\2046&LN\016D\27492dv\026\332\243\367\231&e5O\002}?\t\317\215Am\232\364Z4t\034\2575\331\2463\225>\006\227aV\352\254&\275V\237\256\nM\277\375\343\021\034\323\246\265\255w\224\377\013\324\376H)k\377N\366\333\3344\333\255\205U\275\333\317B\277\3316h\222]\234\263~\275g\301PJ\330\252\261Bh\332\200\3249^a\373\336\334\206;\304Pu\022\232\330\205\177\022\037\037\310>\356W3\343J\202e-\236\345\207{J\027\220Q\t8\"\004\017\037K\010&\255k\306:B\350\204!U\355)\237\275\032\033y\367#\201\r3\373\206\336\355\032\001\364\231\273\301\251<\274lp\r&{\342d\361\231d\006\343\0131\247\030e\316\311\366\250h\365\335\317\232{\201\232R\264\330>\236\315\000\267C\364\375\317[\036b\346\236\207\256\002,\370\006\301\241\030\023\357\237\251\021;\223\307\356\374\316X\263\366\271\251\231\267\354\323\210\305<lY\224\301Y\355y\323\222%U\205 \311<lb\2570\001T\025^\0006+t\033\353\234k\327\213\275\200\027\236B\317;\245\330\201~{\201\2519\223\200\252\021\203Zz\360\204\3005#z\267\277\327cKA\236\203\262>\"\'\n\343\304HINX\254\276\305\361\030\022\247`F\000\316^2\346\233\277\311oan$\006\277Z\016\263\342\256\357\326\025\004\266`ocV\275\234\033\277\340\344&o\352\224\271\365\361\377\035P\333\252\243\036\226\341\276\220V\3144gT\360\034\020j\017\216\370^gL\276I-;\343\\:\332\302\220\371\317\210\255E&^\370\215S62_S\317c\000R\331\235\003\327V\264\216\201\272\326\216\203\345\317zH\214j\\\2513\017\236\370\210\267\376\262\037\237\375\017zY\217\004\202\335\035k9\344\373T;\033\376\004\217J3\351S\177\275uUR\316\001\2579\225\231\222)\312\206\367\313\305\232Z\251zQ\366e\327j>x#\216\034\300]b\320K\177\367\322]:\004\253\217\322\301\350=\215\267\2005\024C\023\027V\007\324\271-A\337\023\234:4{+z\236\321_\367\363\315M\265_\224\253\325-\221\034\263\226h\353\316A\361\255\336\365\276\365T~\177\020\370\003\367\000\310\373\313\020\202`\335J~\315rA\231J\224*\275\247\340[\371\260\237\274\265\2351\246\177{\333\003\360\344\345\227\307\2748i\314K\344\363\352\261\036\370\271(o/\225u\326yY\374\313\242\274\337\000\014\337D\3177S\365\311\231m\"\326\213\004\373j\262\342`<\357 \200\007\244$Z\341\027\217\233TfQ\211\355Q\244\000E\360\342d\327K\001f\016\177\n 5\350\343E\257\363\032pU\362:\267,n\325\260\330\203\316S :\313\\mWG[\214\367\030+\355\215\234\311\034\004\224\260\272\220<V\177\035\177\n\324\245?\255\372\253\2655\324C\352Z\266y#\370#\363\357\271@s\332\246\366\367Yx\365\332&\306x2\372RDU\263r\322\2554\336\356\305#)r\275\355\207I\316p\317y\037\315\310e+\265x\017\335\257W\213\210$6\023\245\311\017\211\340\005\236\275a\005\177\001\307\376!\345U[\262\"\021]\315\357\207\354\037\027\263\311\231\373\307\347\323\331\274\252_\336\006\215j\321\217\216\2358\212\345\206\020=S7\317\351\010\315\367\363*jH^\316\337]\316?6 s\244\361I\276\351\226\"\031\257\3569\033\270^\277\017\341\232\017\263\315\371\340\003\357\270\334\025}l\370\371\335\304\306X\274\366\337*\330\003\365\236\374~9\275U\347\365\240\226\222*\257\322?\252\255\365#\363\352\273/\271\017\267\005{\"%\3105\203\375\321\313\205\r\210h-\355\317B;v\251n\267\305\222\252\257]\345SL\307\324\333\237\302\372\233\222\234\206\365\335\233\320W\244\361\340ytI\251R\253\\\322\233\004\206\200\005F\337\244\016\201\246m\366\255:u\334G\256\326\366\222\335j\275mY\255\356/9\251d\177`\354\203gc/un4\006D\355l\033\263^\364`M\037)k\346\241$y\234\241|\216\344\236|\254\034\337a\375b\216\312\010\'M\311\224\034\002\367\252?\237\315B\366M\340\342N\335\312#\375.\340\217\2676?\347\361\211\352\270.Y\233\253\010\363\206\261\363|\200P\301\340\361\253xV\375\2764\317\326\362\256\322\003\253\302^\'\232\334\001\265\337\366D\354\242+\016*\210\213P\252\252\332?[\365\272I\347/)p\262\327[\333\373\365o\0077:]\274\211\247\023\210\303\367.\322n\353&\026g\207\205Q\247Sn\225T\245\352\355W\002\340\"xL^\356\224\317:\240\032\335-\252$\351\036W\361}\022\225\301W\345\3147\225\275\256\375d\376\037\350=\"g<\377\306\025_\265nky\313+\rz\367{\223\356\265z\241r3\353\306\272<\214\347\250\003\374\371\276>}t\3222\371\376\211\352\246\355%\\l\322w\246q?_\272D\377\315\276\1776\3564\031\271\326\266\336\035\325\344><\211%!t\353\364\021\302\232\207\276{\031:}\303\257\252A\257~\372\340\345\365\361\341\310\263\210U\313\327\207\207\004\207GV\317\367|g{\367\213*\341\327\013`\366\311;\365\227\r\2557o&]\300y\313W\000@\345\322Ayw\034YS\241\013\273gg\273\247\r\376\240;v\367\250\357\307a\\\205\345V\r\206\362\023i*\035w-\272p\321\336@q\3331r\t\030\254\014s\003NPU\275\356\256p\266\377rV\352\240-\305\215\214\315\007\355zm\3603\240\356\037\251\264\310\257\355\273\335\007=\203\306\274][\221\325j\307\246\326\376`\n\222\340\002R^\240\361\020M\265\377\000SQ\314\r\255(\005\277\377k\373\373\204p.8)\261\310\315Z\353\334|\344\033\222\350\337\311zo{\030\031.E\016M+}k\177<\225\317\376\006\367\373\314\374\320\367P{2\323\270\376\350w\323\374\226\217\005\360\030\320\355Y7\353\334\344s\244\005\217\336\367;\231i\367\203\334C\304\023\307\2473\254\267\217\014|\205\317\317\343\032I\033\237Y\343k\317\357\006\254\252-\356\3321\351\235\013\245\353dle?\334\013\246\241y\353\366\377\235\2757\246n\2124\320K\300\000\367\373wp\312wk\277n\376\334.o\347^[\026\330\311Lp0\227\246\352~\000\017\200q\343\352b*)y\252J\t$\033\276\260\275\351\231\210\332=K\177.9\246j\314RO\314ex<-\262\361 \332Zk\377\334s\355+\007\025\324*\252\337\233z\371\376c\375n\214T[\t~\\\354\021^hq?Ci\177\202\212\031\367m\346\347\326Y\262\214\014?mfj\245\"/X}q\032\257\242.\305\365\025\366\313\235p\333\237_\315LS\331\272\317T\247_\020\344\227\004\360\227\374\372oQo\014(D\2373\255\261\"\333p\273z\211_\032\2529\022\266m\363\373S\367.\270\347,\320r5\241\362\'5>\346df\341zN \357\301\271\311Z\210Dk-\251m\355.\254\223+\037\024\242n\375\335s+\376y\2352y\'M\227J\005zi\207R\264\035\320\277\317\346\232\020\023\347\241NN8\342\310\257e544\001.\271\273q\306]b\3359\237\206\306\257R4pIRR=[\231\323$\025\017\003\0316*\376\n\375r\366\342\025k\370om\377\227~\333\224I\232B\350\214R\236\252H\013m@]\352L\036\376\334\255!\017\352\354\234\210\026=j\222\217u\000-5\273\033m\215\020\250\336\2575\350\001v\327\352\t`\316\226\350\002\t\036t\271\307\302\353\375\367\0166\031n\031\250,m\366\343\260\2344|\247\035\035~\340\0347o[\306\036Oa\203t\223\274\203\270~\277\034\337o\354\265\242\352\361\277\324j\027,\014\337j\357%\362\261\231\000\023\023\315Ir\223\2004\323I[\255\317\276\376\377\376\250wMS)\276\247w2\326q\'\250RL\262\274\377`}\360\316\n{\230\265\003\311\227:\3733\000<s-a\355~\245\205\377\354\r\260h\027\215\251L\272iy\365\263\321\252r\315\350k\274\325\377\212\243\374\335-\243\354\2520_s4\021\270\"\311#\345\317\272\275\272\000\272\024\253\312\262-q\325\345%)\'\222\273\267,\256\361YQzt\357sX\200*\234(\265\2353\034\314l\'\364\333\275\271cO\350t<\036\230@\002\277^3\317m5\013[\234y\327\264\005\005\344_#\335C\200\006\231\332rm\301\215\365\226\274\032\310\261s\277q\367\037\373]8@\0202\331\360\370\342\\\024a\'Y\177\262\327\265\272vt\313o\025q\341\204\037\333\332WQ\202\221\022\013\177\367\355kfo\271\327O9\"ck@\n\217\237ff\332t\346\nGz\344\024\221\323\206\375\311\357\263\314\274\035\211^\213\271\340\303\376P\356\214\344\341\240 x}q\025\203h_Y\363\353\372\357\353Z\027\274\222U\341\306\233\3709h\232\371\276$\203\346\3310\374yC\255z\205\256\313?\027\'\030`\244,<\211\376\361\371R\2108\256\371\335\214\203\205\014\022\r\371\323\177-\226\271\252\021k\267\273[\233p\337\206aM\313\342\263\271t\326P\225,\t\016\373|,\326\332\021\245IV\224\325M\006\013U\005%\322_\033b\323\236\36696\276V\254\366\035\312p\235G|ya\357\332\317\340\337u\342\270\235B\3707g\026|\320u\252\357\216(}\307\305\3224\277\261\257\335\242T\277\330\362\010~/P\276\2576\347{\224P{\376\030:t\275\367xa\320\014\264-\361\370p\367~\312\222\245\303U/\271\333i\361;\370[\016*o\376?\357\261\250\234\261nv\367\211\240e\003ar\365E\255Md\013\303\377\327T\263@\264\253pS}g\325\'c\220\336T\255\3574&\212!\343-^7\300\335\240o\265)\275\373a\005=\256\377\026e\032o\337\233O}P\237\201k\275\242\34691&\214\347:\221\367;Tx?\253o\243\212\017\244qwx%^\266\2071\332\225\366\277\373}\232\345R\327\3344\007\007\376\231\377\257f\374\030\334\'\366\340 \347VL\025\014\313<Ki\251\227\343\275Y\375\315W\273_\311\353Yo7\347c\235ff\370\\\023\216~%\2326[\257\367X:[\251\375-\000\340K\254\023y\032\347\324\244\321\201\034\376\035\255\326\307\271vK\202\226\035_\335\366\3165\375\273\224\353\231\322\310\276\235s\376\351x\336\375\303\2377@\360\370TL\332\223\275\3428m\302fo\236G\016t\016\246\257J\362\355I\236m\256\333O\023UT\013\311\235\321\276p\356\327\225\357\314\3217\312\260~\243i\211\302\\\353\027&\215t\315?\235\2312}-\303\027\266\325V\356\376r\223J\rd\371\037#\243\347o\344+\3611\025\376\376\001>\t\277\273\257\362\246\304\360\277\363?5\336\245(o\376\241\007y2;|\202\372V\351\224\252\353\006\2712\031\320\277\247\245\233\356~\016\\\233\255uE\364\257\250\307~@\347\253>\373\375\342\223\374\037\231T\271\257\342\351\216\216\236\023\334CRiO\301\246\246E\206\252\255M\333\324\256\032=4\325\033cS\325\312;\032?#M\334\237>c\030zZ\307/\003\363\234\370\215r\006\3330{#\266e\304\366Y\313\\g\323\007vW\360V\371\021\202\373\254\364\344W\231W\3526Y4\345\037\317<\376\214Y\352\276G\317\320\360\233<\275\226\r\274\221\025\031Lg\204\244\363\272\214Y\014\374\334\325Du\213kq\234\231A\3213\232\0256\302\321\371\034\301\336]\254\264\253\376o\375\275\022\321\335\370Ut\245|\310\256\016\343O\317W\231\277\3608cW?\314\356-\023\035\343\343S&?Q\037\033\312\377\221\2132d\310\250\304%i\215\n]\363^\220\275\273t\325\312\321\3043K\320\231\305\372\331\"\200\017\346\212\374\347\003Blj\023I\234\363\324\236\243\311\036\232*\210#&r%}fR\225\260\365\352\217\337\317?\323<\337\315\367\324\231\246\336\372\217g\nv2H\373\264|@\340\263>\325j\3473\247K\006\r\361\366>\3069s5T\315gg\032\362r>r\036H_\343j\\\303\334o}\016\304\017\276^o\363ME\250\346\'\247\372\342o\244Ku\223\342\376|\036\005\373\313;\202ZWZ\221>U\032g\2330\273x\231\017\265Fv\373\371\013D\377=\367\314\334c\241\313\262\371z\307\033\376\0000\0314\324D4\267\315\215A\227\364+\333\331g\230[\336\247>x\232&>9\347\210\225\352D2)g\301\316G(-\037$\312^\332^\342\r3\033n\355+-\016\207\026ke\023{\t\356\371\214\344\362\365\216\234;\244\211\232<j\276~w\326&v\034i\336\351\252\364\360z\245\323u\020\022\251\220\261\261\224\345\313?\377\270\022.nz\334.\r\371\341*e\0315\324\024\223H\264\252\330\r%\332\351/\241\027\"\252\243\202\257u\200_XM\370~`\232\335\017\233t\0235\"\327 \260R#P\233\361n\211\005S\344\337\333|1\201\306\306g\313\331\343Nt\355\330\352\266\025!\300\224\347F\311E\375My3\273\365\177\334ge\331\377\240\266\227\270>\276.>\033\014\027u\325\362yk\233c\261N\212V\377\244\204\265\353z\353\177M\276\3206\200{T\372\341\246\351[.\240\243\177aX{\251\334\327\333\310\210So\032\r\372v8\375\325%\352\344\231d\260\022OK\340,Q{$\007\252\377\262mJ\365 \007\256Ur\341\336j\273\027\335\234\235\245r\373\261\376\366#\212\346\260\273\316\340\013\303/\252\342\357<\266\277\373\325\307\230%\224\270\231\376*\256\035\325\3437g\265g\352\275\326\343^\260\217#\310\356k?\373\361_y\376\265\272\245\033k\224-g\221\303\0175\363U\227\376NG\216e\335\330b\271\036\272\370N^\n\316q\020\243\276\313Xb\226I\332\200&\240G\220GY\344\271\235c-\322<}\240\020\315\357\2068\r\225o\001W\367\235\304\370\236)\017\215\206l\005V\360\206\317\030\234\225|\271l\032\r@\252\315#\227\254\364\367\025\212=\346\265^)\311\363\307\023\341\323\301\341\337\307k\207qOb\262\307$W\351\r\371\313\226+P\274e\255\3065\370\342\262\307\'`\3335r=\313\3237?\330\357\3331$\342x\240#\307\023?\021\351\327\277\036Z\261\340F\324-T\275n\232\375\036\373\351\252\246\341\2270Y\356\353\246\241\303\274\325e\360\000=@\260\277\374\217\317\371r\345\315j\267{)o\r.\362j\334L\375V\004M\207\3537\370\t!\336\345\356\232\334\002u\360\234~\2118\333\313={t\361\261\304\334\177~\013A\355J\343\250s\\-\\\207\240\315\371\264y\256\334\375@\004k9z\357%\004#\014\032\203\366\303\267\177jR_\256J\243\325\341\331\343\377\270\252\313\034\323o{\024h\013\356\313O\335H\227\257\366Z\362\361\372\346\267\356\356j\'\270\234>\373<\034|w\347\256\3271\232-\315e]-z\007\376<,d?U\332\247\360\303\363\341\021\003\323\355\365\t^o\024\277\262\271\271\033~1\357\336\360\362\003p\346*\201\313/\225J\342\'\t\t\214\241\317<\025\337\314\221\227\334jy\231m\\O\345`^Q\345\361u/\027\242cH\177\376\037\257\354\332ra\356\217\337\367\242\261o`o\315\246u\374\037z\255\245\247\347\027\177k[\230\362>9E0\246n\237\236\353\266*\247\223\341.\313\277\337rj\217\257\333\347j\247\214bb\347e\347h{\374\237\\7\374\237x<\256\334\317*12\252E\254\340\360\'m\343]\241\203\257\033\007\211a\313\024\357\337{\275{\335#@U\372\360\360~\261\231(]\347\215\317\334;\304\376\374\340Q\336\007y\356\013\024\034\020\355\\\033\325\177\352\271\013\330\243az\203\353\251\365\364\211\277\177\256*\373\216\364\330R\262\306X\341\2366\244\334\226\010\253{1$\273\361\361\022Qc!\337y\374\"=\224\241\272|gB^\234\235\351\261\257Xf\344\345\241\341\231\372j\215\265p6\'\356K\324\033\017\035\327h\374\270\244}\307\356\217\020\377\267\026\310\374\330y\\W\343\376\031\275\367\274\367*\317\230q\242&x\247{\3033\310\365V\363\306\302u\333L\310\375\347/\371\373\375;N\375\365\314\225\327\346\3356\357\002\213\356\374\313\352MCG\324\362\231_\275\331{7\301\275\343\n)\275\232#\237I9\355y\324;\017\277,9K\276\363B\316\364\223\306\337\3030\375\2540\362\226\241\336gI\335]\254\350\017\275A\333i\361\267\036\273\327\331R\321U+\213\264@\214t\253\345\367\017\317\3768\373\317\374\205\201\322\220\323z\r\333\335 \217\347\2576\354\323q\352\306L\366\010\235X9Y\360*=Z\326\256|\'\200\323\324\177\227\227\005\233\364\245\257XU\352\335\346\021\322\220/w\274\215JS)\273\334\005\324\233\324\004\001w\300\260N\264\203RL\322\200z\025w\325HV\235$\235\221\343\2355\003\317\375\346\207\032;J\245\201\360\036G\252\245q{X\227z\035\032\227\250y)\327Lf1\252\002@\037\310Q\001\247\354\320<\330\313\000\337\3561\326\264\331u\231\234\207\223\262\373\242\321\363\265\3155Z\353*~\363\021\005e^?4mp\243D\341\230\026\016\000:^\202\253\200{\250\245<\211\235w\264\034\255\205\275\310\211\000\366\370O^\356}\253\217\276\307\342\230\251\322\334\345\272\007\207}f\235\224\2368^\rC\220\252M\257\n\335An\274\245zd\024\274\303\364Y\245Q\221 \345\356\313[PO\344B\361\310\361v\223\265\335\365Z\200\321!)R\211E\352!@\350\367\244%\223\321A\275\333D%7\"&e\235\336\241i\321\204\312\355\356\357\257PE\273\325n\037BC\376h\237E\233\251BQ$\263?r\372B>/\"r\273\246\336\227\241|\221\t\353s\214|\246\237\255?\341\317\206\014\210\222\034oo\245\247\350\2134\336\235O#\217i\372$\221\026\312\336\t\022\331aO\201\316\274W#\272c\026\177H\022\017w\271\271\364\376\300DD\026>\222JJL\306BD\336L\235jD\222\363)\"\226\222}\224\005S\215\004F`\252\346C\365\333\273z9\022\223\262\003\212\340\"t\276\200\0234[oM`\027\202\350\357a\353\360\377h\rM\374R\375rv\177\370/6\347\016\232\377\332\3614\340`\243(\342\327M\253\253s\3515\334\225R@!\321_\222\r\263\207\311\324\203\352\375\243^Nnu\336\332@%\360l\272\236o)>[\277k[\201N\346\334(&\327RXD\250\307z\037\326\001\341>\371\030\003\256\026_\363\235\237\201\323\345\377fM\377\014\377\310\361f;\301\325\337oD\242\006q\302\302s\003~\t_\375\273\247K\373Z\351\021\331L\205\334\035:[\035\345v\235f\271\370o\302vbM<\3078\322O\340s\005\360\340r\337D\177>\356\222\332u\254\271\364\345\344\365\246\306\352\"\324\337nDRZ\271\233\366S\366\233\2701W\003w\n\317\264\325{\214}#p\234\350\201\372\321\021\301\314\313\326\233\276\344\254\373\216F\220\016\352\255\373\264\224\036\274`\211\203\257\274\216x\277\335\362\025\252\325\023\310\374\351{\001\035K\213\201;+\325f\365o\220k\267f\371\026\374Y;Uoc\331kG\221\255\243\371\246y\324\337\235\261\204\234\362w\251\364g\262\037 \276\204_O\207\362\316\366\355\020\234\3667\355RU\000o\215\207\220\277\245\372\023&=\363?\353\313\276\211^f\310\376\223#\244_\003\236{\217\332;!L\320BmY\364\315\365\267;\256\032\350\225\275i2\3705\346xx\254\313\275\177\202\377t::\024\316K\026\251\362\354\215L\2039\244\224\\\335\324~\271\363\307\350s\265\250\017\247\337*\347\227Q\235\034\317\356\374\\\236\223p\332s~F\202,\237PN\326\322\241\257Qf\377*\235\306\237\247\3645L\036\303K\364}-V\007\344#\321\'X/0,\337\027~EP\235\311\006\244\253\315\306#T\332\360T\033\253*\372_;\375j\366L\352q\245\3674\003)\037\037\257\361\3425Y\177]\345\237\037\202S\370+$\014\247\327\013\275\275n\240\010A\037\234vuC\272\365\'|\017]\357rd\377\023N\003\2676b\275\323\257\2653\'C\360\331\370-\260q^\013k\256\001pI\023>\366\265\243\315\222\357\307\215\237{\2340\372\345\257\233vse\300ss\255\273\252F\364\273$SoIF\0256\204]@vc\316\236t\260\356\247\326/2\264\257\234\313\227\302\341g\276u\367\262*l\267\031n\202\306\3771pg*b\033T\375/\337\357\177\277\366\336\030ez\340\36055V\330\257M\207\354\272\037]\313\356QJ4\3338\354\363\374\177_\rT\330jd\303\346\265\355\266|]S\026g\303a\261.yZ\227\230\315\206r\362\013\177\206\236\366\020*\032\335So\255\017J\021\377\275\220yR\013\301\007\323\325U\t\017\323\350\321^\365\370\315\344O\351\222\240\251\267\000\333\351!T\222\021z\360r\267\265\010\264\325\021\' \021\213\261f?\207-\325_\334\272CR\236\252\250\001 \016\240\330\337\204\227|\222\nm\036.\217\213\241\373K\202O\241D\013\324\247\213\256\226T\241\010/\365\244\327Z\211\222V\225\'\220*\224P\355\220\373\267\364\020}Wf>\253mn\314\273\351M\270\232\210\027l\323\220\302)W{\333\366\205\010\213^\266\352\023@\000\002\224)\326\014=\327\337M\320\317S\363G\362\331|\241+~\202\334\235B\372\315\"\350\375v\366\355\371H*\362\201\332\274\272\351K\030\272\225[\273m\216\216\367a\036\230\356h6\357L\232\3320\225\337\332\010`RS\255z\022*IK\271\037\245\204\225)\322\275\023\005W\260.\305\321\001\316\252\206\367(j\251\013\320$\207\3449\222\025\245:\366\210\216\221\022n\356\002]\312\205\371=\313:\355\330=v\272\233\370b\373SB\321\335$\212\250\005\007\251I\356\311\234\3164\353\364=HN\247\271\370|\315\324y\361\224\300I.\220\341o\366\275&\303\327\227D\215\345:=\232\315\364\"\036\356\345%\3306#~Y:\024\315\267\341\254 {\375\3470\336ozR\227~\320\222\342$\365\331\251\250\006\201v\342\006\231)\003kI\307\036\014p5\347\200\364\211\213\256\251\252\367P\200p\370\013ae2\232\235\321\355\270\204\204 \365{p\026\371R\034 )\261Dj\232a\277\377\032\036\301\313\024q\354\247[\222\237[#\320^\327]\241\257\t\r\373M\013VX\305*\357\267\213i\206\374r\333\237\271\362yUv[o\033\366\275\277q\370\000\345\234\000\'r\244f\232\305\256%\255\320n\326\267J\316\037\322\220\351\271<\367\257x\200\002\375\224\327<r\3548T>\003\226\016\225X`\332\257\205\252\303\3405\363-\353zJp\337\322\347\257w\314\327\227(r\212X|_~\004\233\\6\367\277\355\314\315n\277\233c\177\274\"\027\271\223=r\335\262F\0328\001\177\372\375n8N\033\301}\010\0356\265\357\336\267\005\355\320\245\207!\342\227\254;\362\367\236\321\373\252\231^x\246\303\330\354;\273\273\037\005~\033/\360\267\013\247\033e\032\301\246\246\016\343\356\224\267\000|\265\357\031o8\343\267\352\010T\255_\323\332\266\217\206\216W\016\263{L\233[\303\344\372fn\266\316v1\351\273H\001\td3\252\303M\335\037\242(\230n\022\261\307\237o\227\017\256\013\235y5X{&\277\263}/>\016}\303\2771\'u\311\342BLn\365Y_\"\347q\265\363\340\330\023\370\260\2614|E\207\371\332\002k\3677\r\343W\347\274\200\350\234+9\217\202}\231\0213\277\347\376\231\241\347Vc\214\217\226n|(0\264C\3310\234H\203E\244\333\225+\313\332t\351\026\233\272?\362\013\337\203U\222\255*\364\347\311\200P:9_\177W\272\250N\345+\023\350Nn\2077\242\315\355M\2257\312\257\317h6\0265U\266\251\255\365\274kL\317\276(\203z\"\316\337\272\227\253{\233\353\303k\263\372\376\2232\224\276\220\205$\353_\333\275U\004\222\024&\262\"T\tT\231\347\003%\357\241!.\335$\223\010\275U\034\343\370\325*\252\335\000\240\212n,\313\377\373U>w\3640\301\255\250\210\023 \2213\002\'\250?DB\270]\356\310\210\223\366Zi(\205 |\304\202A\275cV\345\254\302\357\322(\001x\0266\301} y\006\335\337\254\3727\211#u-\221\rP\366\252\362\022A\014\224\035\013\321\007\3645)\364IS\256h\270H\203\275\327\340\026\340\210\303B\220\366c\241B\372\210\221}@J\250*\tF\n\224\222LK\r\373\337\'\0220cAW\225\"\241\315}f\004\241\276*\374\307[\216\365|\356\307\rqX*:\354\"J\216o\214/W*.\247\225\032|\371{\037\212\337#\020\327u\336L*\\\300\3045\017\355\033\212_\034\361\370\376_\223\354}OO\226#\330\267vH\327\345\307f\252\240H\005\347\2155\030\247u\030j\333,\262\014\352\370\342\376\366\234\2274f8\302\263\212@\310\217|}\214gGAU\245Y\217\207\036\360u\221o\342\027\246\262\226\263\035\30750\2506\230\2164x\371\373\307\305\305\313\005O\242cZ\263\214\316C\262|\344\001Ts\271\370\243\337\201\036F\327\360\340\356\213n\367]\242\345\310\301\217`m\222BChX\013\300c \324\020i\343\371n\250q\352\310\252\350\215.\351\n\3120\242\243\200\205\363\267,\370c\021\241\n\223Q\303\233]\227\034\351~0c\274[w\177\366G\326c\233\307\233\275V\255\256\364+v\332\357\244\337\362N\307\225\316\210\345JQQ\362\227\362\272W^\000\225\310\301\202\362C{G\356\306\272\256#\237\3450^\276\306\014U\250T\216\334p\251\366\254a\010P+\373D\327\3061\317/\204\363\231\346>\202\255G\034\234~\016\006\375\211\362\373\336Z\225\242\245\357*4\231\363r\335m\003\213\314\312\352\240\275M\260\224\344;K\3064\036\360+\222\212\350\262\0177\315\253\243\037&W\273f<\316\307\2172aT\017\036|\351\362\356\030\372\002\037cw\227-\025C\246T\273\307\337c\230\277hT\326\241\344\354i\307\260W?\204t\021\256\277\325\034l\312\036\237b\314\216t\263\327\230e\347x\335\337\346\277\345<\"\037\261\251\007\017\320\024M\240\346\223\232MY\335\t\353\336\32037\270p\362<\271m\274\215\357\223\350o\205U\360\350\226\332\3637\025\251\000$\337~J\244\214\277\277\200\274\275\237)\207\031\231\360\006mbL\351]\233\370\306\027#\202v\016\304\270\361\376V\351\346~\235\236\263k\365T\327\375\252\375\003|\310\207\214z\361\246\377\313\016ZC\333\"\372\335\036\362\347\356\377\201O\205z\207\n\307\037\177\336i^9\340\223\306\336\366\360g\030\254F\232\n\334\206\276\363\002q?\271\243\314\\\016\002\355\322W\216\265\202$\326)\375O\226\216\234j\305\037\264\275\370\324\363\005\365\231\212L\242\036\2748z\232iu\274\256U\361\315\311`\002*e\253U\377\250>\305e\214Q\351\371\307L{\226\025x\243M\\\344\031h\032|J\017\277\232z\220\253\013\355\300\r\376Bq\372\317]\255\021\277[\316\374\275\343e\207\313\207\017\262\206\231\304\226+V\327\025\243\244\335\376\341:o\221\365\336A\313m\265\201\243wW\352Z\250\321\226\036\213\307sD\244\307\356Q\357\337\310\323\201\373\177@\030\254\235\250\311\373\315\276\324z\357O\312\240m}c`\375p\370\371\367 \336\3730\217\213\306\353\377\367z\357X\306B\341\307k!\313\347\013\274F7\372\214\357\320w^1T\0257\366\351-`\202\013\363t\000J\250t\034\\\010w\316\307\267F\000\313\361\274\2528\034ti\271\221\\\025\177\254\351\257\366r\375\271k\367\253\366k\244\374\353\013?\tV\324\376\245\230\304v\332\212\261\375H\377D\030\353\365\360\255\333\205K\335\334\220\303\275\303\272T\346\316\257\222zB^4\330\376t\026S\037\274X\347\310\261\364\343\233\357\177\221*Z?\031\023)\345\367w\036\035y\347\3147r\310\246$\025s\022&\021\027\2419{\377^\023\327\341\016\205G\217[\017\227-X*\263\177\230C\274\177$H\262\327\270\237\337\336\377\\%\352\001\341\346\360\307\305\274\261\010\224\354\016\373\315\264?]\177\3532\357\275a\305h\324N\236\366\030n\253~$\307\'\352\353\237)\310\036\240\224\361\203U;(\313\017\234q+$\264\277J\373\301\342\316\336a\357a\333\243H\322\'\244\252-\210\'1\3539\233\002s\245\352\225\315\\0\354\376y \231\224\020m&\377.\027\277\275\203z9i\023k\226\033J\267Uz-\0069\333\301\003\272r\232\010\032\2229\215\364\n\236\242\303\030YYn1a\247A\244\327\'FRR\001G\233\377Ww~\017){\335\342\255\213I\216\335\027\314\223\205\tV\362*\2358\3677\362\252\262\3172\235p\331O,P!\'\201\304\227F\323\3335IL\232rV\022\375\305\347 oeK\367Yk\215:t\3300..\230\321\016>\373\276\371p\366#\342\237\246\307\002\304\322[\363]$\275\342\005\231~e\301`r\300\027\366\376h#=\375;\325\336\323\336\366Xk\017U\271\020un\343\201t?\337\367\3653\\\336\203\022\243\327LI\214\363a\342\321\257\377\303\002\336\nr\336\327\311\t\2459UT\225\340\032}\311\331\375m\232u\375\035\030=\354\032\250E`\210[^\263\263\317\210f\352R\316\3333\026\'p\254\312\253mv\252B\322B%\235\364O\327\245\370/X\371-\201\026B!L\337N\200\221`%U]&\241\212\266\2255\0307w\017\r\027}5 \002W\231\340N\354\337\r\005\023\262\366\216\215g\232\256\"\251\t_\273&w\036\364\364\220?\377\256\312u\036C\006\025\031S\371\3132\314\206\'\263\036\316\265\247\212\202\253\245y\201vG\364>\006\324]\"\351i/\320\312B\003\262\013?\253\333\327\275\305\223S\356\3425\220K\320\t\025\005R\236\274\305__F\007U\364\233\233\366\275\332\241\0067\223\275\220B\331#]\353\246\036\3657\337U/\220\2226\377\227WE\017\241\362\327\230p\004A\003y\311\006\365T\335\334\354\346&\354\265\223\224\020\217\252f@o\356E7f\017\352:\014\370\211\301\353\001r\177\353i\337K\204\343\270g\363L20n\3400f\rm\0206\025\264\tmVuRSn\345\3346\210\275\271pV\313l,\250\241\350p@\001\342\375U\250@=}\000\346k\335\357\352\243B\205\323\317\255\316\373\335Y\371\3430Y\243\311\335\216a\255\360\246p\252d\316X\240<\274\363\270_\017\313\363\257\334\344S2\313%\313\334C\317\257U\363+\277\177<\370\016\316LB \372\362\367~\006\213\377\033\360R\202\267fH\002\204\326\222\n^\241&\273\270\007\223\240*\270\232\345\274\345\375]n\374\341Y\260\231f\301\021$\032\371lPV\366\251`\210\331\216\331~\337\365\004\244\245\355\262\223\177\007{`\316;\244b\252\351[g\373\303\346\302\273\257\217\207\263\206\303\016\334\203\217\002\375\277\377\213\331\021\275\346\2205\2342\306\345\206\345\2117\313\217xwle\032\220\301Mw\271\277\242X{\213\255h\337\332m\324\314\201\r\313\264\327\200\351 \235\247\211\330<\302\236\356\236m\307\220|\343\336\324\375\362\267\313\203\262`\264\006\375\275\335\023\027n4\241\036\327\352|\27677&\3002}p\271U\207\370{\243\357i\3042=\323\206>\236\35101\216\312<5w\204\304\007:\3546\001\317\351\3761\255\363\341\266\204\337\207\374\032\027\357\331\216a-\022\377\3304\3249\367%~\315\177\025F\007\352\210n\353\363B_\006\360+\253\374\336\224\001P.\311\024\336\364\336\357\273\260\247N\r\367\343\037\2511%\254+\336\252\252\205\032\242\302i\2357T\202\263\375\221vU\366\035m\370\014\366\362\027\325o\315\005{\360gN(\251u\313\326\341\241\266\313\322\203/\204\237\340\336kv\351\031\255\357\245\263>\347\362\335@\311\346\213\253\267\3761\320\302I\273\372\277j\t\316d\227IK\266\210\341m:\275\014\277\023\273![\327\346jgM\267\312\004\272\316\243\277\340\231\311\223\037\244[mm/\366g\033\273\364QM\351\255\2637\333\353K\177y\266b\213\313nQ\035\377\270\275\355\266\213\263T\017\350Y\246.\321dnw0\\\222\253\327\277L\370;\240\327\372\022L\2657\357\331\037\037#Ye\256\376\342\001\343\320w\235\213\327\357\231\"\364I\265\212Z\365\203a\3528\220\3413\177\366\241m\212\376\316\252J\016\207\332\354\223}\267\331J\221\234V\342\347t\315\271\034\2212u\007\275\010\353in\363\217\"L\272\337\365y$\025+\320\336\347\377\266\237Z\367V\356\341\3366n\373\311.\301\267V\035}\346\255\267\035BB\025U)\346\274Ee\253\326V\230Y\344\347\316#\366s\014\231\336?\n\357\214|\274tqRz\345Xqp\353(_\0357\031\262\236iF\006\367p\332^\255\266\036\357\233jM\377_\033B\373\354\346\361?\361+\215\227\376{\366\036\232\023\377x\242{\201\006n\233\370-\240\207\277[U\2657\276\266\023\303\231\017q\232K\315\004\023Rt\300\326\2401\274\254\347]\351@\375\272\205C\003k\254\025\275\333\000\316\033\336\3031\237z\021iJ\251\243\206\223\311\'[\207\311o\234\335Q\336\204\032\216bv}\273V,\013\372\247\261[\303\211c\2444\215\347*\277q\314n\2308\334p\373u\353\220\207%\027a\363m~\3207\352\323uw\224\333_\3274~\337_\374\331F\225\327\024\334\024V\3271\211g\376\032\231\242I\372Up\374>:?\037\242N\322\227*\215\255\314\225\334\356_f\377\207\345\026\337(\327\271\317#\306\"|Dus\272\376\007-[GV\321O9t\374W\373v|}\\\226\356\273\177F\207\\;\357\260\227SP\006\370\356@\211\240\3718\216\3558\342X\']\247\270z\234\262\2260+\2108p\n\324T\306\350\031\357\375\207\376\233Y\377\016c\301\273\307\237\377\207\352yN\303\361\267\n\207v\321\370\333V\356\376\257\222:{\261\007\203\377\364\307F\245\242\020\327\252\020\315\232|\3071\366\346=\264\027\271\242w_1\320)\310\225|\325=\306n\303\305q\320\263q\314(`\212lP<[\372\303\360\037UP\356\n\022\366\375K\300\303WEK\020\303l(\236iw\246\367\237\010BM\260}\230\246\212\333`\335\303aU\340a\365\236}\366Q\333\337Y\377\255\322\220]\255\016N\353\256\341\206\247\217\350\273\336\221\227\333\276\315\353ua\317\344\356O\340\206\332]\213\346\371\034\027\274\231\321J\374\025\033SY\227o\203\377pD\013O\177\3671\263a\217\027|\332r>\245a\262\352O\227]\2623\336\351\372)\'\025\3221\244\337N\001\325-:X\276\002L;b\027!\331&\214&_\326)\231\034\315\031\267\025\354\2326f\231\266\376\3073a\336\223\373\377\377\352\242\256\356\344\373\366D]\"i\372\267UR\027F\336`yW\202\242\'?\354\326\360/\203D\263\357U\r/<\204\305\207\273\321\'m\014\216\266j\n\222\000\202\227\005\356\230\267w\n\273$gO\257o\245\225\037\360A\265\341\207\325\002t*\332\266\240\3555w\325z\250\022\202\01453#1\020\245\270\252\220\250\207\255\325FS\327R\"D\213\277WR\257\203\204\321h\270_\365U\r\213\013\354\374\245\276\277\327\364\370\326\213\353\023\027n\373h\337\351\304\327\335 \266\320lj\356C5x\237\244\023\002\355\342\031\356\247\210HCv+I\021\277x\224\235\351Xw\340N\335\300\221=\274\355YK\253;bU\347\027\006\204o]\335\n\000\2634>\356%L\021IHau\233\362Uw\272/\336\252\365&\222\367\244\340\367\305\276Uz\315=7)\376\276W\275\332\272]\351`\322k\303ORn:\330\324\022w\275\256\303\326\343&:T\314\375d\206\323\223\027\222\300\264\177Kh;\343Ta4\237!\227\372\330\244\357\rb\2278s o\241\261\260\016\267\355\277/\246y\334E\177:k\324\264\206\\\333\262w\277u\316\342\233S\303\254H\217f\223(>/\345{3[\334\010\"\037H\373]]$%\027=\216\206r\347M\211\274\313\234uW\3459\210\231\031\277\336S\027\257\370\326L\303\300D\373\24397\216\257\315\177f\306\357\013\234\242\305\330\264\375\265\223\177\243\316\306Y\274\353\204W\275\016O\267\331\315\210\227(\270\353\233\'\252S~\222\342;\334\306\3273\217b_G\2072\263\304\202\2225\301\n!Q0m\315\267\362\255kSuc$g\305p5C\317\317\244\021\000K\006\373Q\177\245\376\330\215\206H\036\310_N\351if3\255\225\0353\242\263\264\370\206\222j\230\033\265c\217\253e\335\276]\257\304m\3239\211\260n\314\255\341\023\2358,\254\342\325\336\233\267\361}`\367}\247\325\rA\270,\013J\177\223FQC<\022\355W\257Pv\365\364]\223\315\206R\021,\235\315\264\325n\277\347m%IV\357T\002]\314\213\'\301\267\n8\326Y;\300\313CD\277}\tV\231\227{\251\247\324\351y\363\311\371bT\331d\313\177\265\347\356s.\335\376\217h\262\1777\223&?~\273\203|\017\357$\336\375\272\343d:\036O\022ab\023\342\247n\377J\231\333\037\355=\357\242vq\255\023\177\353h\305\317\t}\010\320W\323wr\3348\311\220\315\264\355\030\r\333\355\352Z\246\311V\204\316\200\270]\275E<\007\337\251\3578#\367\364\367N\230j#\034\\\023\271F\317D\375\343\377\377\252\256\3709\004\001\357\302,!\222\316\301k\321\240;\230\262\3034\334/\213\003\007p\rC\332{\326oTI\333\2209>\341HP\245\004\027\340\251\277\220\213|j\036\275\370\367\267\221\232\376`\373\337\335rS\314\353\357U\352\263\2334\357p\367\241O\366\242p\022\265j\t\274-A\277\370Yz\021\220\300w\316\226\361\277\022\342\2639D:l:\320\201\340\005\351\201\246m\177\037Q\344m\347\200\317\312\307\r\262U\373\226s]\356\032\207z\032\357\213\014\017\307\270\254\351V{\236}\341g\360~\274_\274S\364N\332\206\013\023\215]\353\346\207\241\334\235W\014s\005\342)\276\263\2549r\271\377{,<\341\341\021\017r\023\037\263\020\201]\354\016\302\334\203\336\267\330-A\352\257\013\362\322\313v\232\241e\355k\031?\371q?L\257\270\315|5L\365b\265c~$c\337\264\244\202\225n\366\357%Mm\361\251\310\232\021\222\025\342\246\260\234\231\177\322\217}\372\223\"\020\007\367x\001-r|W\272\"zJ\267\355\324\005\223)a\034\364$\233\355P\320\033\016JW\272C<\363\350\023\264$7\202\242\2662V\217\376\365_\333\274\033\276\364\021M97\264\345\037\366JrxM\210@\230Q\374\270\036\314\204\373)\247M\373\324\240\006_\310\263\366\376\000{{\023\377P\207^??\274>M}\204\362=\373\372w\3379\336[\257\217Lw:>\372\316\000\032\031>w>\024\235$\273\364E\037\351\365V\242a\017\274;\rD\2324\330\210\360\2227\351\'\305\245\006\333T\006\305Y\246\020\205\272\247\304Cv\027\3065\321\230Z\013\337\357\220\000\345U\275}\256WP\005*\267^\253\333o\342\256\366\006\210\253\276\367\252X_\313\344\225\250\014\311\371\010(\021\027k\263\334\205\344J\365V\367P\225\330WE\322\253\333\021\t#[}\357}t\220 \010\020{\334\207UX\313\332!T\211U{\322\220\313\332=\271<_\022L\365\212y#\0049\373r$=$+\220\334\221\252\205\344J\376>V\301{~\213;\225I\351\247\202\032\250)ci\'\363\316\273\357(EY\211\3479\r[\037\r\325\255~\317\023\333\244Q\257\3307%\370\367\337_T\311ta\n\033}\267R\236\240\n\226\343\237\354EV\273\270\372\017]J\255\366\267W\364\320BE\007\273$5z\250+aU<z\025\034\000\301U\357\rD\372-aR9\317\005\247O\211\370w\026sz\007\257Y\276\002\001U[\274De\000E\036\366#\266\226\352\275s~\304P?\250Dd\311\331\"\177\254\325\'\365\275\240\247\241\334 \327\367\261=\307T\217\364D\211D{?\377\254\334\250\024\274\210\365FHr\204(\203W\3763!\021#\031\312\207P\272He\364\314\257O\033\024\204\367\222\001\"\310C|\301\201\324<\nh\231\027\237\237E\241\373`e\232\234\263\003\367\313b\342\020\242\022@9\377\254\235\362U\350F\361g\231\031\310\rl*))M\367E\372\216\347a\001\251}\354k\332\020\227\331!X\256\347s)\250Y\327H\010\013\314\221@\027\272\3000U\276P\376\236o\375\2506\034\263\032\377\226M=\032\375\301\246\261\345\350s<\031gt\373\020K\2305\202\332\035H\342\027G\0314\267 \367\376\355]\2143\017xYw\335\362w\366\241\035\366\274Xv\360\177\337\227NQ\217\262|\215\034\235\364\331\344_\353\006\257\203\375\240H\022\021yl\244\335\307\3463\226\350\224o=\375\307\306\351\301\243\300\331\211\317\346\350%f\323\351\340\331\217q\271Us\324\237J\367\362\245\310\367Q\333\020\211\302\300/\205\311\311\365~h\263|\034&\251\333<j|\301\210k\340\336\346\371\373\223\270_\ra\307\223\334d_M\226\375\371\3454\265\233\257\207\024Ss\271\235:\341g$I\277\201\270i\343\346\3777\032\357`\372\203m\3341\362y\246i\235\177S[\205\037\311\272_\013\204\234A\233\335\2055=8v\227\253\270P/~p\315~\300i\367\201\367\004\312f\231s\373Bz\3445IUz\001\036@\277)\000\035\265\333O\372=\000\233\354?e\263V\030\027\305\360\375v\024\346i\257\321\001\246 \252\250oA\272K\363\223\342\377|U\273\225\272\3761aX~c\324Y&\n\263gSL\337\245L\000![$/R\243\276\014\3379rVA@\005\375v^\370\214\371:-\006\025&\313\023\305\230\235~\020\212\374I \373\353\335\325Mw\257\034\ti\310_\302t\325zg\010/\342h\362\r\037;\032\203\225M\251\273}$\" X\362.\376\326\243\030\364@\3507\366^F:e\247\230\3439\\\255V\024\336\241\331x\236\365L\313\252\364$=\353\335\203<\310\0075\336\303\312\201\361\311\016Yu\250\367\252]\377\354\336\003\325\370\t5\352\005\271\312\323T\235p\276z\r\314(p\002\373\351\303\202\n\272\2430\367\276\367\370\267[m\253\0147\302\004\377\265\353\347\035W\335o\360\316Si&\341\271A^\247VA#\233\332T\027\350\240\255\226\277\030\250\205J\344\305\211\326\332\3279\013\2457op\322U[\241\206\366\307\255\236\211km31Kq\006U\034\336\356\344\256\341\331\214\026&\212\034\000p\362]\373{\271\030K\016e8\227\331\276\320r\3732\370X\027\037\264\324\002|\343\r>\300Au\247G\257;WG-ti\307\217\217\255O\227<\305S1\321\031\251S(\032\316F\300\335,\263[\255\224\276?\025\356\335\200fo\266&\'Z+\320\316\251M\311\026\333\276\001\017c\341\316\332\037\007\216\344DD[\245\272\356\022&\3722\027U_dj.!o\213\t\010\265R\365\341Gm@\002\215Lc\364\273\202\307\361\"\223\224\02579\213\375}\363\036\345\214Qs\271\216;\232\310I\377\212\255\233\365F9\266 \0037\314{Z\367yKu\324\345\231\034\034\302\252h\371\227\007\200e\0059rI\247\317\337\243\235\374\3059*\300!\231\244\023\246\3638Y\353\337zz\326\020mm\307\206\014\272]\010/Y:\01673] ;\024\254u\3667W\0163\303\334\271)\366$\276\036\022\263\300i\333\363\307\334\325?\236B.\236\023\356\014\366\327G\007\023=\305#\311\363\006\020_v\371\247\313\342\321\227 ^\253-w/\204\346\341\253\373|\356\306uR\366\204\275j\307>\250R\276\307\224\271`v\016\350\342\033\220\002\270q\367G\r30G\t\373\237\224\320._\332\231\307\256\302\315\375\177\2262\306X8#vwO\223\362~\352\334\205s|I\\\3057\315\377\236h\372\21537{\300\346\371\314\037\342\276\340\034r\261\327\377\007\377\006\037\325\370\214CSyI\026\366\352O\251\202\375Al5\315\276\027\t\271\334J(\214\310\344\325\177_\004\233\254?O{i\264\252R\202S\332\336\314\215\177]\267\244~S\2654\265\257\252{\335\302.>>\246l\316\227=\357z\327\372\232\346\242\277\345RmN\214-\36177\237%\3024>sm\030v\317*\266\205\220\001Iz\320\021\356\374+\202\375\273M\226\255r?\344s\272u\337\341\345\312\315\010\341\232+O\361J\245\316\277\034\323V\363\250|\031\274:\267\307\2075\264\002s\313\313*\243\252\375\016\010\231~\235\r]]\333\217\3518\027y5\276\266\304\210\214\344\004|^/3z\267{u\267V\373\000\344p\305\007\365\037\031\310\"\010\353\3767\014Xm$\326\313^\264\231L\236\373!\024\241\0052P\rl\032 \216\213\t\254\322o\367^\265\315\316\276\021T\236\376Z\361;\202r\n\375\343\232\364\361\227\240`\232\267z\367\227\177\020\301u\347\355\022i\022\240\216q\351\253;\376\367\364\372\316\253\313 f\203amM\243W\201\024\360\241x7\337q\337\214M\337\026\222\177T\016\201\273_\345\323\027\261\322\345\331d=\315\031sT\276\226o\346O9 \237]\367\232\325\003\244 \345\356\310o\262\270\013V-\303j\214\241\224\363\375\200\235x\247\313\327|\371\300\254\252l\370\033\247\0200\270\310D53\214\023\351c\017h7\200[fmZ\302\265\314\334\255\373\177\354\207uV)\274\267\322\344\"]\366\032\351\231\307`[\262\236\037z\245\247Cb+\237\301\306\037\214\225B\235\232\277\t\004S;\326y\347\377\256\366_;\034\r3\377\270]\n\365\266,\321e%\001\267\231\356\242\267\000\356c\230\275\n\227\252\277\210\205\033\253\326\035\372V\356\355\272R\377\272v\020\263X_\301s\261pQ\227\256\252S]\370.$J\360[\365t\334\336Ky>\277\213?\016_g)\3428\351\355\2539\2234\324\336Y\3033w\257h\333\347\273N\226t^V\351.\223M\324B2\177/\354\271\275\277\303u\257\205\257\366\274E\237\rs\027[\346\270g\300\340\tr\177\356\354\273\346^\270Il\346\373\204\231\276g\246\275\313]g\373_\266\324\375\003\230\216\244\251\032\252K3%\327\227z\223\276\301\241\356\036\2528t}\271\216\010\230\313\276\353_\270dHz\247p\257A \315\257\343\372\336\270L\336\335\'T+\333\272\013J\357m-\3736\036oz\274\007@\021b\371\306\033\254\337*\213\t|_ol\332\277\305\361A\206\n\336\215\357c\244\271J)\000*\351t\307\273\332\252%7\"\"B\030a\217\357)\343{\312\nM\324\323$\326\034\226\337/\211 \017-Isl\364\355m\346\357\211\233\234\324},\263\314t\006\020\344\274Z<^\367\336\024\367\216\256\213\363x\273\377\273\322K4RPG|x\370\026\236\246\037.?{qM\374](\213\267\264}\356\000\032\016\343\227\372&\301{\350\222\371\370\356\357\016\225N\027\373j\304I\313@]D\023ZR:\301\260\343\355\336\373\365\3772\233k\241\351H%\264\247\033a{&a\243\207\252\327\203<\000^\264\2768U\323\037\246\306S\353\332~]\006?zK\004\t\252P!\350\303JAD\231\326\006Q\365\254d\037~\226\355\177\360]\215\305Q\300e\363\341\021\224\345\211\303\277\031$\214\244I\236t\020\\\277\223\240d\311\220\2077\276\214\342\357\202\225Ro&\"\277\324\020\332\341\r\032\262\343/\242\253_\250\216\tO\265<E\005M\272C9O\2537\372\376\207\273\"\312\026\245\312\276\265\241\334\221\375O\"\310\310\342\236\202\212D\226\260l\005\321\346\241\314\316\'U\242]\t\344\021\313\262\343(\010\332\310Q\3522\267K\370[=\016\222\325b\334Z\347\311\365\251umYV\357G\246U\361\307j_\234\277\315_\206\311\342\371\372\243/\350_2e\376\02261\301B\327\234\364\225y?9\036\032+#\371(\0355U\353\333\201\037\377\373!\007$z\360_\2673\231\234I%\334\025\356D\032F\337\345\221\361\205\364\024\357\241\240\n\265\207oU\277Q\242A\353?\242y\244\253\377\352^\262V^y\003\361\366 \270\204\252\372Z\3673\335%\255h\301\205\277RR\374\264\252`8G4\242\250\352\236\032\3557\177\377\200\003\214\260\"G\226\272\360\362m\177\376;\257U\353v\351:\343dF\231\245lm\374\364\375\010P\003C\336\022\254t\307.[\244N\335J]Z\271u\333\335,\321\312\243T#%m\265\245m\235\002@\265\204\310\367L\360\261opc\347\365\022 h\276\304\376 =\302\211\227\376\204\036x\266E\345\342\334y\275\275\335_\350\2719\177(\267\205\275\024\244E\275\322\333\360\345\000\320\214\235\355\334^\020\361DN9t\307\270|\032\346\266\244\237\321Ey\354\310\256G\304\246L8UIUS%QU\223C2\205\264g;\271T\016G\317\324\316\025\344,\315\033\352|\301\340\351GW\335\353\334\361\222\221\363\342\203\376\375}m\246\032\202\357l\030\264?<\211&\252\273z\252\257/\203\363\376/\342\370\375\257\257\257Mq\t\352\252\310\026E}/\325{u|\3172\257\0059m\302\344s\243-5\263\353?L12~\273\354r\333\271\010\317d\024\n\340\375\336\243\010\211A\275\003\231\2643\352\371\t\233C\337\254\201\301w)\311_\363p$$A\177\'\277\247\372\233\223\355bv\265\235H\353\214\317\303 \336\373/\"\340\253-t\365C\245\364s\374\367\347\357\365\356\004\346C\363\313\266y\006k\320\\G\317\013z\353\336\336\376G\310\200\357\240l\323\352\210\210\223x\315I\236\245CC`8??\031\252l\225\354L\230\303\222\232\r<\2675Q\312\004\260\204h=\375\017\270\275\032\020\341\256\344;\376\n\016\366\014=}\347\2564\n\217\230C\006<(\356\361\312z\271\017`C\335~\330\027\257k\375\330\253\212o\202\301\343\235\2141\315\223\177S\\\246\301\337\033.\342\017\001\357\'Yn\371k\371M\0361\323d\335g\001c\245\370\r\255\036HS\371\266\313iZ\251\225\234h\226>?\026\273\336\352\332\014O\216D\000\243\315\363)\315\363\013\3637\025\354V\260=_{\365\206?\200\321={\211\342\261F>_6\267\271b\235\350<=\301\210\264qW\030\000e\253\223\227\032\270\253\211\332\214Tc\0142\337\274\373\211p\376-\354\247\272o\2077\307\255c\240\307\370\370>\021e\230\321\312\367A\216\033\315\314\354\005X\254T\263C\363\325\341\366jI90\212v\303\272\003v\\Hi\027N\222\004\rB\262\245F\360\324*\2755\315`\276%\315\340\235\0132Ue\343C\200]-b,\r\305{?C\225V8\233\237\n\273I[\335z&\237\020\244\227v\232\213\217\233\376\3771\341\275\233{P\265\340\336y8\025uw\324\036F\022\022)7UA\342\352Q\010\257\255\235\354\352\363yk`n5\033dRw\216\212\232\360eS\262\3273\010E\277\363A\206\257n\223\330\356e\335\214V\336\344\313k\3479\363\300(\336U\342\2317w\301^hs\'\020\177\245\234\027H\302\370L\276\0250\373\355\275hR=\326\224\213\236$\205\226\313\357\365\256\363\254Z\276\033\366G\216\343t\353X\007\322\277O|\020\256\277\275\353U\233\255\322@]\246\336\333\322\227|\247}\276\023}4?\326h\327\275z\352\235\005\366\273\242\\`\341\300\340\330)7\211(GWw\376q\205\277\332\331s\246\035vy\275r5\022\365A\260\274\323zc\204Qi\266f{\2027\177\240\357\230\346\375\255\225\277\323\307M\363\034\322c\276\362\352r\344\321\'\003&.\3232\301Jm\326\346f5\307\302\277\370K+\240\322oA^\037`\240S[\234{\270,\213\262\376]\006\017<\025r[kf\356\377\334\335\252\020\257w\215\274jER\364\3454\374\376\253\023\032\277lAu<#(\027\325\324.Z\366\313\337o\267\213\2712M>\347\177\273\302\267\2132~\330y7\203\214\0312\235ff\301\270\203.\336L\247\027\017}\275\240\343\021\027\364t\234\266\305\231:/\351[7\317\311\377\270\374\23571\242\260\270\027\231\275\376-\262\224\303\nu\322\235E\262\205\350$\266\312&\333m%m\216\031\016[\207>{\013v7\032\212U\317\316\3437\302\251\021JG\326]\377?\377\227\366R\3354\245%\002W\232c\317;\267\314\260\352\367K\213\217\247\265\355O\344@;\340\276=.\356[|V*\033\363Fw\'\372\371\3072\206\325\375\230q\t\001=\362M\235\301I_\241&\014\3341\314\360\356\333a\202\377\301-\2352]\3700\365X\374\314\356\307N\"\275\261\370\376Uu\217\207zn\250T\t\201\233\314\307\016?\311\267\275\326\366\336\t\255\335f\367\233\376}:\232\243K\272\225\005yM\023\025\233\272\261\361\025\310\332\274]f\246;\337\235^\225\030\276\'\251\210\275\337\037\037\304\257\177\023\356\215\261\316\351\260\320+\2477\313\307\314j\215M\334\330\276S\212c\037\217\246\342m>D\234\372\376?1l\277\337\323s\271\270\270v\355\306mCdHl\323\233\343\320D<n\307,l\314\221!\207mQ\365\236bc\t\207w~Ut\251\310\274\316\234\177\277{\366V\344\316R\357Yl\261\321 \203G\342\251eu.,\204\203\363\253\336h\373\202\375\374\250\371\207sk\365!\021d\325\363j\352\376\n\341\227\340\336\r2PA5\257woU\210\376\2525\214\344\305\232\236G\367X\033w\231\322M\217\236\206$\200:\376(\215\266\357\020\276\257\274\323\267\211\372\214\344\376FkSL\3577\255\2443{\231nS\353&\253V\022\375\377\243\352M\362\205\001\375/\251\337|\234G/q\034\324\370\374ybps\372\371\267\315\271\2661P[\332\362\323w\3760\215\332\250.u\375\377\377\300\340\374\333C\304d\370\273\272/l\332b*lb,\325{\342\035\342\346\371\263?\037\210\214N\344\374y\021}u\363\370zqd\310\257#T\301G\276\035:\257\273\177\354;\36216\361\330d|\317\317}\375\013\355\313\22708:\247(\345Fy\270\340q\031\207\005L\261\226\035\335_2\356\303;\r\227b\030\357l,l\271\333\310\354\363P\363f\375\371?=\336\240\022\274\360\363\244w\347K\325\324\0266\364\276}\260\337\333/}\374A\3670Q$\340O\025q\263G3\222\257\206W\221\243MVE|\021\322\200i\314\342\026\363|\361\314\\G\314\3442|0\373I\033E~\244\237$\325\304?\376\205\350WA.\252\221,#nb\335\tm\007\'\007#}I}#\376\363\0316\317\315lK\322eV\345\315\233\032\255\013v\2771\223%_\364\205{2\251\264;_\252\222\230>-\255\377\3218\371\337s}\275V\340\257\236\343-\244\310\254\'\342\177\233\270.>\272\034\275\215\261\236\036\302\321\226\231rT\0016\010)\356uf]\364_\327\233\271\345I_\303\\\031V\017\320\034\251\330\014\360\213>o\233\344\363a\3242\340\305\270\272\317\3665I\360\264<&\332\235\317&\227\335\001s\375hK\245\3352\271\305\306\373\356\351\213\\\350[<\322\253\354\357\337?<\307\215\355Q\333\207\346U\371e7\255MzL\342\023\200\303b\311\252\204\237b\312\262\345b\246\031K\266nn\353\007\263\233\261\333oj\316\271\355m\350B\326m\256\021\361\ni\3735\244\244\006\334h\366u\031s\027Xt*\317>\033\\\203\247Bg\r\327z\263\332\024\206\240\302J\203\361\344:>\352S\377Z\243\006\370C\3348\374\225\356<\235\255m\200\216}z\377\317\323m\347\252\026\010\354mY\255\321\325D\314\332P\037\307\374\362\341p\341\001\325\310)\341\035\360\000+O\027\013\270*\326\344D\206\013?7Yk9\003\366\003\030\352\331!\331W\2677?\375gN2iO\377[\233\233\312l\316|.\021\276\234,\247\177\346\335\377\207\215t\236C|\356\307v\310\213)\207fc\231\375%!s\t\271\230}\205\357G\356\\\226{\305W|S<Uc\352J\2279\306{\327K`\021V\360\003\271\271\036\\9\212\343sG:\347Z\254\256}q\334\234-\354\210N\343W\315\252\356\230}\3109i\367\254\r\371\223\305\256\354\325\261\261\315\370\262\016\263\313\227\322\177z\260\303\366\374\257U\345>#\2747\377\371W\363\277\033^\275FX\305\177oO\036\3358b\375\256[;\322\277B\376\203\334W\035-\270\342Z2\2305x;n\253r\333\235~7\271W;\201\232\0130k`\376\251\3202\377\010\360\177D$\372U\230\360;J\331Xs1#\216\336\252\220\206\206\203\364\'\027m\372\256\366J\360w\335/\337\357\017x\234I\'f/!\307P\212EY\355\021&\240\020\223N\277H=\335\347\"-\261^\271\002\367\377\322\361\233<\330z\321\023\020\362\365^$\300\267\370\242\265\362\350$\337\262/\364&-\266\277\377-\377\247\351\236\234\007\230\343\376\311\233^\347\262\265\333\372\356i\356\362$\")\266Z\335|\374\273,\315\r\370r\207\3673JU\246\301\233\367Z\344\351\014\311/~\006\257\260\001\371n\303\3308\2758\275\347\000N\267\241\253\225\316:x\336O\373\324@\274\343\362\031>\"\226t\322S0\020"
      }
    }
  }
}
node {
  name: "Assign_20"
  op: "Assign"
  input: "conv5/index"
  input: "Assign_20/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_21/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 246
          }
          dim {
            size: 3
          }
        }
        tensor_content: "z\253\273\271y\346\256\272\350Z\310:\362\347\342\276`\277\332\276w\033\217\2763%\250>\002z\252>\335\225\213>aW\227<\336\312\314\276\301\221\201\276\323h\274>\333??>\022\353\016\276\3049\314\276\236\276\253\275\301\002\327=\016\217\177\276\216,\306\275\251\342\220\276\343H\004\276\217~\003>\030\330\220>\274\3402>\026\235)\275\212\375\221\276./<\2766\331\241\276\335\214\207\273\016\021\213>+@s=\305\336\032>\326\363\227=\337\241\207>\257\313\n>y+\352\2762\010K\276\326\316\025\276\273t_>\324\353\r\276\3416 \2756\370\354=+\226?>\307\337\020\276F\200\017\275g\2770\276Z\2721\276\304\3164\276F7\016\276\230\350\'>G6Z\276\326\"\260=\323\246D=\030\255)>@\277W>\004c\276>:5{\276\316k\242\276\347\367t\276gE\346\274k\231\210=\256\274\203\276\000\330`\276u{\334\275\313\025|\275\016\0012=\344$6\276\022\336\331=Q\024\200=\216\260\204=z\211?>\261\356\262\275R\273=\276le\271\276p\203j>.\277I>\310\374\215<C\230\324\274\356\010>>S9u\274\274\307\005>mt}\276\3758%\276\277&\204\276?\177\\=u\300\005\276(\236[>\211|\024=\2279\244\275-_\270=\301\357\205\275E\237\n\276y\365\270\276\203\210\251\276:\276\343\275\025\033\277\275C\327\221;_<\020>\251\231\220\276\"\341\213=\235\035I>NvR>\251\nI>}\224Y>O\362\327\275\327\255\270\274\370\301\023\276\300 \226\275\253\3379\276\277\347\201\274,\316y\2765F\316\2768\332\300\2764\360\341\275w\236\274\276X3\r\276\306\035\024>\275)\333\273\210\320\214=\356\'s\276`\001x\276\3124\301\276\r\336m<\177\n\255\275\027|\226\276\017\271\230\276\301k\\\276\366\345\003=>K\240\275[\r\'>L\025\001>\312F\361\2758\203\250\276\246\363\242\276\0244\307=j\021\014>\335qT=\004\243\234\276\356\"L\276\330\0175\276\347D\"\2761[o\276p\035\005\276\372P\251<L^y\276=\343\225\276\362N\206\276+\007\222\275\205\013\227=\356\332\250;f\'\257=\310\020\341\275Z\353\014>\322\025\200=\t\241H\276x\025\000\276\261\353j\275L\350\273<\321\014=\274\367wA>m\322\200>\352I\223=\2074\224\275\224\'<>RoV=\344D\377\275\262\347\201\274\3341\004\276\331;#\275\211\000\215\276:9\260\276I:\204\276\343\347\230\276\233_\032\276\210~<\276\n>\200\276X\201o\276E\032\301\276:\345\332\275\200,\363=$&\225>\335\217\222>\360\300T>\252T\031\276\321^7\276\336~\264\276*\302\014\276T\222L\275\305\254\327\275\010:\240=p\036|\274(0\242>\365\245c>\202\020%>`\350?\275\223r*=\230\366\201>\245*\213>\203\202J<\r=#=\177J\323=w[x=c\0019\275\006\272\207>\372\370\250>\017\2321>Q6\226\275S\346\214\276\274\325]\276\200\027L\276\246\353\330\2755\2225\276]i\331\272\"\322\243=\250\377\270=@l\237\276\024\237\023<\336\264\025\275\332x\273\276\255\262\265\276\372Hk\276\332\323\330\274\372\007\234\275L\300\253=8\2518\276$\224\363:\026 v\275}\023\\\276Io0<\3636\212>D\204&>}]\320=\3304\017>\204\261\014\275\267m\271\275\203C\252\275e\340;\275h\307}\276)\225\375=\003kQ>a\321\204>\007\203\013\276W\336\202>\360\312@\275YL\'\276\311\3533\275\374\237\204\276\'j\274\275\334\301\303\275\ni\276=.\273\"\276\335m\244>s\001\231=\321.!\275\313/;\276\014/W\276\247+\005=rq\342::\202\332\2744tD\276\035\025G>\241;\267=d\221\254<\305{\361=e\361#\276RCx\276\024zo\276\211i$>d\214k>\324\201F=\246\016H\276WV\334\275\360\'\210\276\t\370\214\276\332|\276\275\334\001\024>vL|>$X\335\274\266Um>\212\035)>\300P\256\275\366T\314\276\337Go\276n\301f\275\273\rT\276\327\0061\274i\306)>\330\243\301=\004$:>\225\177\230>\206\271\354\274\014\004b>\344\371\351\275\035)\203>\255\326r=[\2761\2764\300\002\276X\'\r\276|\007\322\275\243\325@>\"Hb>dn\346=\235\234\027>\272\240\026\275\202\000\371\274X\033#>GN\335\275\323\260[=*2\210=w@/>c\325>>\251\252\376\275\2426\252=\353WH>\241(1=\270\0104\274am\347=\272\332\223\275\245\324\001\276\374]\216\276s?[>^.\236><6\227>J\032\205\276\362mK\276Li\206\276\262\312\217\276\307s\246\276f$\252\276\030F\204\276\361K.\275\256i\376\275\350j~>Om:\275\271\027\n\275^\224\323;M\375F>\331]\231=\366\346\257<\312%\006\274\006\204\276\275\250\022\303<\246\336\312=\322C\021\274\376&\266=\214\177\312\274\264\307k\2765f\260\275\026\241\021\274\207\301N\275\250\252\255\275j\250\366\275\362\227\026>\255\255\233\276\373\351\277=\3014\271<\261\367\321=-\317$>\025`Y\275\361\234\217>\256\335\037>\225\017\252=\267\263\266=\276\225\322=i\'\207\276\365\323\000>l\3657\276l\357I\273\303p\347\275I\363\256=q\377\271=\000\344\364\275[o\235\276;$\215\275\\H[\276\022\336W\276e\237^\275\262\314\226\274\347\376c>K|+>)\333\361\274\322\010\323=\300\255A>\032-I=\2531\361\275\003\340I\276Gl\006\276\276|\016\276\276?z=\221\3176\274\221\247\354=\276\332\233>\215C\275\275\375\200\320\275\002 >\2764^.>\371\037\202\274\274\037)\276=\"\033>\220B\337=\373\034\351\275\241D\221=309=\346e<=[\2617\276\202\332\347;\t\260>\276\240Zy\276\rK\024\276fd\210<\252\346\302\276\2361\207\276{}^\276\226\272\244\276\ry\256\275\353r\031>\227\311.>\025L\263\275 \000\315\275\303\243n\276\013\t\200\276\364\2469\276?8\017>\355N\013>#~c>F\225\201\274aos\276\007s\'=\370j\220\275p\274Z<\377<T=\202Y\232\276\240\255\361\275\237\242\021\276\007\035\376=\000|n>\347\010Z>c\276C\276n\310\376\273\255h\241=\346\266\032\275\337R\237\275\355\307\272\276\274K\020\276\374\266C\274\003\343d>\003v\202=\254\253\213\275\310\030K=\347\360\275\276\264\266#\276\022\347_\276M(1\276^\377\206\276B\260\233\276U\371\266=\275\t\027=\332<\004\276N\304\266\276\020Y\004\276cY7=\241\263\365\276\246gJ\276\324\237\201\275\tq1\275\377}\276\275\371\234\367:\227\242\215\275\344\233n>\025\374\220=x9\224\276\243\354\237\275h\333\r\274u\331\031\276A\034\232\275<\222\347=Z\031\253\274\231\206\221\274\231c6>\373\376\310=\334\221\270\275qg\226\276\'\263\177>\223\363\211>\217:j>\312y\245\276\320\036\253\276s\220\030\275}qV\275\217\335P\276[\355\201\276\016a\301=\323\232y=\032\365\206>\006\366l=r\234\217\276\374\364i\276Y\242P\276\010/\265=\307\2750>\361\024\206=\037\304*\275M\206\370\274\236Xx\276\002:9\276\273\235\002\276~F4>\241\316\007<n\316\022>\226\036\260:1\001@\276\220\006\263\276\316H,\276:\252\236\276x\332X\276\'%\242\275\221\265\017>\000\016~\275\337\206\272\276\225b:\275r<\274\273\320r\360\273\222\026\037\276 -#={\027\022\276\265\226\220\275\025+a\275\256T\004>y\035\020\276I\225%\276\357\2368>\224\240\035>=r\213=\252b\276\276\307\341\331\276\254R\242\2764K\204=\203\334\366=\004E\375=w\200U\276O\200\226=\t\020\032\275\363\210g\276W]\002\275\211\316\365;\360hB>*\361\001\276\263\340\201\276\013\212\037\2760e\033\276\315Hm\2749:l\276\363\276\204\276;3\225=\337\212\376=3\n3>\371\307\370=\007\t\343<\216\243\205=\0314;\276\351\2045\276V\250G\275\235\035\377\275\203\250\035\275k\2342\276%\303\260\275!\307\260<\331\'c\2762\312\035\275>Vp>\025\274P> \\\253>%([\276\305\357\005\276\2628\303=[\264\035\275\213\301\370=R\342\016=\332:\366\275\332\0346\276\251\243-\276$\340M\276\205\'\233\276\373\226\010\276G\260\005\276\277\253^\276`\201b\275\020\216\242\276p@m\276^5+\275\214\253\203<54Z\276@\253]\276\021\r\362\2759.\013=\210\202\202\276\3554\r\276R/\313\275\021\363\245\276~\341\354\274f\235g=Y\230;\275E\223\"=_5#\276n\360\223\276-\213Z\2763\3346\276(\027O\276m\273\022=>\372\361\275\257{\304\275\274?m\275\350\307\262\276\242\023R\276\021\304&;\251\016\206\276\347\001\274\276x\3763>4\231\031>\"L\r\275}2\017>\306\n\256\275EGY\276\260\277R\275\302\234\006=\321-\024\276\223\3026\276\342\247\302\276\205\007\261\276\220\277\020=\205UL\274\tJ\234\276\331\341\372=bhS\276\207*\226\275\036\326\335=(\230;=\352\226\005>\311\374\352=\3719\211\275H`\326=0dS>\210O\020=A\244\223=\232\261~>\214\034\313=9\316b\275\324\037\257\276\315\332\205\276\255\271\002\276\007H\236\276\312_\220\276\006\267d\276\033\252\223\276\3110/\276j\352\270=6\004P=!\177\356\275\353\335\262\2769\272\322=\302\300\275\273,\333?>\014\033\225\273\251\003\263\275\242\223\033\276Z\326\036\2760\005\255<\343\233\270<]r\025>\266\3162<\222\204\273\275\206\177\212\276\300\001\203\2763`\240\276x\347D\276\224\251H\276\331\246\244\276\001\205\217\273+B}\276c\266\037\276C\034i>E\226\007>>\342\007>s\006\206\274X\271\320\275C\265l\276Yr\240\276E\261h\275\201\326\243\275\033\276\204>X@f>R\r\257=\265\330\014>\312\266\236=\010u\225=\312\347\363\275\0208\t=\006l\320\275\263\034_>F\360\350<\273Q\003\274h\023\017>eZb=\253\327U> \014\022>\277\001\361<\227]\365;\230\230\377\274\024\030\334\273t\242\333=\312\244\320=\346\336\264\275\344\273\214\275\010W\251\275\027yb\276U\350d=3S\014\276\262\260y\276\303\025I\276\374e\212\276\311~,\276\2244[\275wI>\276-\341\273\275<\021\327;\375\202\221>;\211\217=s`\252=$\013\244=8!I\276\343\033A=\006\214\226=y\235\221\276\014\224\025\276\334\001x>.DA\275\312\250v="
      }
    }
  }
}
node {
  name: "Assign_21"
  op: "Assign"
  input: "conv5/centers"
  input: "Assign_21/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_22/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_22"
  op: "Assign"
  input: "conv5/shape"
  input: "Assign_22/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_23/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        tensor_content: "%.\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\003\000\000\000\001\000\000\000\002\000\000\000\004\000\000\000\003\000\000\000\004\000\000\000\001\000\000\000\005\000\000\000\001\000\000\000\310\000\000\000\007\000\000\000\007\000\000\000\002\000\000\000\035\000\000\000\002\000\000\000\243\000\000\000\005\000\000\000D\000\000\000\004\000\000\000\t\000\000\000\006\000\000\000\001\000\000\000\003\000\000\000\030\000\000\000\321\000\000\000\002\000\000\000\242\000\000\000\001\000\000\000\036\000\000\000$\001\000\000\213\000\000\000\003\000\000\000\004\000\000\000.\000\000\000\001\000\000\000\010\000\000\000\010\000\000\000\020\000\000\000\005\000\000\000i\001\000\000\022\000\000\000l\000\000\000\006\000\000\000\031\000\000\000C\000\000\000\t\000\000\000\010\003\000\000\003\000\000\000\005\000\000\000\233\000\000\000\t\000\000\000\003\000\000\000Z\000\000\000\001\000\000\000\003\000\000\000\002\000\000\000\010\000\000\000x\000\000\000\003\000\000\000\017\000\000\000\003\000\000\0001\003\000\000\001\000\000\000\022\000\000\000x\000\000\000\227\005\000\000\001\000\000\000\007\000\000\000\013\002\000\000?\000\000\000\001\000\000\000[\000\000\000\313\t\000\000\001\000\000\000\001\000\000\000\002\000\000\000\017\000\000\000\003\000\000\000\002\000\000\000\020\000\000\000l\000\000\000B\000\000\000\005\000\000\000\002\000\000\000$\000\000\000\016\000\000\000\002\000\000\000\005\000\000\000\003\000\000\000\033\000\000\000\005\000\000\000\001\000\000\000\007\000\000\000\031\003\000\000\025\000\000\000G\000\000\000\005\000\000\0007\000\000\000\034\000\000\000\330\001\000\000!\000\000\000\001\000\000\000%\000\000\000\004\000\000\000\010\000\000\000\005\000\000\000\036\000\000\000\232\010\000\000\205\004\000\000\031\000\000\000}\n\000\000\020\000\000\000\001\000\000\000\037\000\000\000\004\000\000\000\001\000\000\000\003\000\000\000r\000\000\000\005\000\000\000P\000\000\000\005\000\000\000T\000\000\000S\000\000\000V\000\000\000\004\000\000\000\247\001\000\000\'\000\000\000\027\000\000\000\242\013\000\000\005\000\000\000/\000\000\000\005\000\000\000\001\000\000\000\026\000\000\0007\000\000\000\033\000\000\000\003\000\000\000r\t\000\000\014\000\000\000\032\000\000\000M\000\000\000\003\000\000\000\013\000\000\000\242\002\000\000\001\000\000\000\032\000\000\000\235\000\000\000\003\000\000\000\001\000\000\000\226\t\000\000\002\000\000\000\n\000\000\000d\000\000\000(\000\000\000\006\000\000\000\005\000\000\000\003\000\000\000/\000\000\000\003\000\000\000\004\000\000\000\006\000\000\000\346\010\000\000u\000\000\000\003\000\000\000\005\000\000\000\023\000\000\000\002\000\000\000\002\000\000\000*\000\000\000[\003\000\000\025\000\000\000W\000\000\000\001\000\000\000l\001\000\000\005\000\000\000\'\000\000\000\001\000\000\000\264\000\000\000\002\000\000\000y\000\000\000\020\000\000\000\\\000\000\000\341\000\000\000\007\000\000\000\002\000\000\000 \000\000\000\315\000\000\000.\001\000\000\t\000\000\000;\000\000\000\007\000\000\000\022\000\000\000\002\000\000\000\002\000\000\000\204\007\000\000\005\000\000\000q\000\000\000-\001\000\000\003\000\000\000\002\000\000\000\037\000\000\000\020\000\000\000X\000\000\000\001\000\000\000\002\000\000\000\002\000\000\000\222\000\000\000\013\000\000\000\013\000\000\000\013\000\000\000\007\000\000\000\022\000\000\000\004\000\000\000\001\000\000\000\005\000\000\000\307\001\000\000\230\000\000\000\177\000\000\000\t\000\000\000\n\000\000\000\017\000\000\000\014\000\000\000:\000\000\000\002\000\000\000\007\000\000\000\014\001\000\000.\000\000\000\017\000\000\000\t\000\000\000\376\000\000\000\205\002\000\000o\000\000\000\t\000\000\0005\000\000\000%\000\000\000\246\000\000\000\003\000\000\000\003\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_23"
  op: "Assign"
  input: "conv5/freq"
  input: "Assign_23/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_24/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        tensor_content: "ub\023>\205e%\275/\036P>\001\035\023\276y\217\373\275\370\2571\276\335|\367\274\372\340/\274\314\026\t\273x\023\247</\366\324\275\350u\031>$\"I>{\356Y\276\222`\026\276\273\311C<\237c\274\2758\344f\275\337.2\276DDD\276*\345\036\276A2(>\245\305B\275Ci\203=\200\003\341\275\247\024\254<\335\252>\275n\337\313\275\016!)>\014>1=\354\360>>J\014\267=(\177\023<\014\033\034>.\350\316=X\360\212\275\273M\347\275\026\002\001\276\376\022\374\274m\347\177\275\tw\220\275\204\272~\273l\307\200=1\257\312:H;?=\t.%>\354\3214>e1\020\275\316\267O>\275\234\213\276\270\2674>\370\336B\276\033\257\344=6L9<h\316U\276\200\362\226\275\267\245\355\275:_8=\232O\362\275\257,j\275\004\316@=#I&>BF\265\275g\375\302=\306+h=@\254\'\276\367\006\252=Izs>\243e\372\275\274\346\036\275\025\311B\276X\036\360=\357q\254\274\256\227=>\"\230\035\276)/\344\275\337\222\226=\252\214\036>=\311,\276\344\342\342=\337\026\246=\362w\024\276\323of=@\225&\275\336\026\t>\207\022\005\276\261yE\276\2121>\276\263\203c=\257\000\200\275r\240\014>W^\350\275X\034\207=\n\261O;\256\201\002\274\227\234X\275\366Hf=\221^\257\275\234\026j\276\230\265\374\275\255[v\275\314\217\225\275\234\234\264\275i\006\320=\237\013E>\355\221c\276$\242I\276\232J*\276\340B\316=\326\226$<\367P\325=\300/\215\276\350\255\235\2756\213\025\2757M\311=\267)\215=,tB>\352\006(\276]v\237=\272&Y>o\351\340\275\226n\r\276\213|\351=\3013\317=\027\333\002=\020\364$>z\323&<\223@\345\275"
      }
    }
  }
}
node {
  name: "Assign_24"
  op: "Assign"
  input: "conv5/biases"
  input: "Assign_24/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv5/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_25/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT8
        tensor_shape {
          dim {
            size: 34107
          }
        }
        tensor_content: "\363_Z\207@\2645\265\276\014{\225*a\257\255\034/\305\256\276\255\311\320\347&\346\262\343r\330\223Z\266V\325kV\377\307\260\027\306,E6\376?mo\361d\274N\263z\354\271\202Y\204\000 m\355\014\013%\r\0210\233\316\206\247\365\364LZ\217\231\0317\263far:/}\270\361\336\237XJ43\306\375\357_\357Y\010\375\371\276\357\314]\017A\346h\345\224\255\360\366g\275\343M\257\211\214a \0141\350\314\244\213\345\256\325([]F\375\215\303\030\232\241\305\313\230\210\213\354\000\217Go\0308s\275\340\333$\374\340q\276\'\030\320/\377*\205~\357\373\356a\274\375\023j\277\242\210k\030>\330\212\350\236\312FM\003\217|\033\014{\235\037\330T\227\276\021\265\236\346\364\260In\327~\332\362\224_\264\243\025\211\253\232\240\335\265\327\017\"\244\373\263/\247Z\254v\300\244\243\213\026\201\347\347\366\037\311p\374\241O\037\372\303\033\244\342\314C\021\336\251\377\312:;\255\213\231\336\000c\013\347@\244#\240\313\031\215]\375Ev\263<\355\206 xo\017k1\346w\264O\315\361\275Y\344\017\360cY\232\354\007\362;%\213\371\215\302\263,\023\210.\320\377\225ee<\256\021\222\330\331\362\335G\241$\223$\252\367Tml\014\201\'v\360\203\301\316\232\312t\262\252Y\227R\254\3369\226\251MI\373\372\371\235\237j\014l\250\035&\334\330\001=M\326\255\357\020\365\231\326v\341s\347t;n\373\342\312\221\236\302\345\363\361\307\236i\215~\2769\274i\2578\323\357\337\260]\355,5g\337\322\363\343`N\311\322^\252m\224k\336l\002dI^z\\v?\364J\353\223\255;x\235\270)\347}\223c\333\332\000:gk\363,]kz\277\\w\305q\302$[\375\304\222\274.\314L\272\256ZyQ\025M\024SNr\225\226\300\036\233\001\217e\360P\314\225|\220\216kW\037\313\371U\3342\335\327\311\336\370M\334y\367z\003\241\255$;7$\nR\372.\342\005Q\271\243\245\266Qjf\336\350\237qUtt\377\037\033Z\304\325(\t\006\335\211\205\027\363\353\350M\006\315*\341\345\177k\342\261\262\370\031\n8\313\363?Z\355\031\202\364a$A\227\357W\276\370\317\342sv\350\007\336\200\341\356|\374\276\356\347\341.su\034\317b\r\342\222\037\316\247}T\332\324\310\314\317b\277^;\357e*\232\n\345\246\247\275\332\353\256\017\275\006H\246\035k\3427\304Fs\265\357\305$\014\240q\247\265y\276\372\277\003\267z\357\334r\240\007>\017\366\177\377\346\007\2523\001t\313\352\304\236\231\023\222D\373\256<f\3743\000\332\242e\3253\251\376\370l\257\211\377G\255\345\375\374\374\035M\356\363\213<\325\365\313<4\263\356\355\261s5\377z\034,\313\244\014\314z\230\320\305\177^\347Y\251~\324~\305\261\267\314\025\270K]\36526\274\367W\201k\2630\346d+\375b\013\262\344+\377rf\265\023\362\326\260-\327\264\306\321\373\226\305V\244\360\005\037To\216\312\361\370\001:\352\331XE\252\216/\367\331\313\276\037\3342\217\027\340\032\000\0079\307\314@w\336\003\371\316\331\"\354?\002\272?\214a\350\347\227\323\003\241\354N\247\310.\312\013?\2540\360\236{\333\004\245I\372^u\323\272\232\250Z\326r\222\216\276\3776\206\252\317\027\276\253\366\000.\273\344\215\240\216\352)OMM\375\240\035T\335\366\363c\265+^\257{S>s\332\336\235\005\':[\3712\327\375C\204\375\257\256\227d\r\351\333 l_\332\001_//\014\364\312\027,\305\036\331I\250.\215\'\014\365\365\316v67\256m\255`\244d\302\312E\275q\244\354\337\236\341++\373\266\211\234\304K\227\361\257_}\351\023=\212v}\371\001\217m\332\340\263\364sf`2\216\267\264%@\024\234\363\320d\251R7 po`9\313\341\034\317\220\347\026T\203[O\244z\034\214\267\321\212\250\241\257\363^p\265\321,\350l\266\233\314\314\377uk2\324\354\037e\261\204k\273C\3014\357)g\350\334\270(\357\277\"\220\346W\022\326\033\345|\303\237\375\367\302\310y\330Y7\362:\352\333\020:\263\n`{TN\236\271\001\220\370\024\373\334\344\002A\215\272O+;\356\\\376\371E\312\\5\321\3058\247)\277\322y\271\240\003\321&:\221\351\237\033F\254\311D\3214K\3765\330/o\325\303D\340\373\207c;\210\216\336\342\377\373>\232\323\230&\337y\373\233\215\362\227\317x\232\367\'\315\301\313O\270I\004QM\356\350\237\345q\255[b\302K\007v\002\317\322\243<\263\242J\243\324\026\223A\0357\313\332\341&!\301u\262\231\235\350\211\220\333\376fu\372\373\005\342\314\224\005\344P\\DU\216\357\221\261\201\331\336\362\351\214\271}<\275uc\230\362p\330\t\323$\323\356G\003\223\352u\316\306\260\342\322\'s\344>\243&\266`\314\177\276E\242\270jO\253<i\201\225~\361\233-\017\034\037\277.@f\347\277\246\207X|\365\211a\367\310\275\306\212>\374O\363@y?\271\\\205|\271\346\023\017\023\016\342\215q5\335m\367\227\240~\003\332\324\273`\023\224\316\215o\353\t@\372\330\353\267.\342\254a8\004\354j\247\265i\244\261\373\266\177\360\373\216\313\307\n~}*@I`\205\217\017\302\374{\177s\201\356[8\300\376\373\351H\234\367\207z\"A\313B\037{\244\226\311\375:\373\304\311\261y\315\311\313v\333!\335Y\265\305\177=\255>\252\273\204~S\321\177=\"\235\216\371A\216\3338a\227xc\001\345\230\261\035m\355\332\035H\314F?l\"\267\316~\365\245#O\374\2325a \365\374\235\246S`\004\017\226\332\273|o\276\324\365\355\231\330/i\223!r_r\245<\304\275.\332\235\367x\005\371\227\221W\263\346\236Pa\367\325\364Z\375&\336\332-\351\270D\314v\210\306\365\310\234\241\240&\206\210n}\2422-;b\354\376\376\357\226\374\013H4T\311&\350\0312YIg\274W\220\233\3478\375#\'\331\356\303\270k\004\232;\315\253\274\247\327G*\2148n0 \357G\037\237A\315\206k\244\271]\210\332_k\326g\\\234\374c\344\031\030=\316\250\002\226\355\274\335\321\215\236\217R3\322a\374~\031\354cg\261^\250\324\261\321\237\370\302\214\305\371\241\241\277\014\3145|4\355M\233#Y\313\352\342\037\303=\3406f\211>~\340f`\357\301\261~\214\217o\245\2767\357\326WM\235\355TJ\336\231\320\321q\321\337\025\371B\252Zi]\255L\263#\303\336\301k\317GD\254\372H>\'\370\020\010\315E\332\236\001Q\343E\350&\256\323\376wOW2\325\300\326v\177\326\323\271\356\256\376\253\r\206\302\302\253n\265~\216r~\270\013\246Vv\242\010j<\371!\243\026e\225\252>\016O\354\333\256\333Y^:\261y2d\241\037\317;\333\277\316\330\251\032o\225\025\337~\356\204u*o\252\304\262\277\203O\343\253\3277\303\360e\375\"\233e\352^\3029\224\003\274\303\303<\013t\371\201\002l\314\264\362\341r\375\235\365=\350\377\014nc\\\223\344\003]SY{\212GR\211\267\rl\270q:\002\330\363W[.n\323\034w8\241\037~>;v\017\264`D\277\232{\271\346b\006\230\353\302\264O2I\'\373%\033\374\277\177\274\324\324\344Dw\222\327\251\033i\016)b\201\"\360[\024\035fl\275\206\357;\020\223\346h\350\0237\006\236|\232\376\233\363M\261D\343*\350\350\027dr\373~m\000k\236\013\375F\230\017\220\201\326\312\353\255\307i\256\221\223\'\254e\363p10\354ku\264\357\235q\031\n\357\330\366\262\367}U\275\261\236n/\311v\266\3257\267\270\270\3271>\2779\307k\200\020or\360\357\230\21126!\251\022\004=\371\273\335\317\225\344\266\253 \254Rj\023\326`\314\003M<:\250\241\223D\\l\344\306*\273\336\264\005\366\376\276\377E\363\216\325|?\335J\377^k9\365\234\261\224\245\005\341\177\226\336[\023\037\013\366d*\303p.Y\307J\245\257S+_\177\216\214E\013\355\344\310O9\303\030q`\265~\243\271\235\r|\217\277\2031\241\030\276j\363\256\036O\342\347\327\352y\377\246)^Zt\337*x\217\322\361b(X\320a\236\346\242D\254L\315n\213Lq\277\342\035\356\357Y\251!\224$\357\243\2543{\362\250\252(@[\250E\267\276\325\262\252\315;\002\027\321}\213\376V\204v\251\255\311\352\262\022\347X\307\237\'\373>D\305~\2671\272z\242\254U\257\264\025Fuh\351\312\377W\330\311\271\222i&\\\250.\200\356\226%_\362\366\277\311\220\377\366\372=l\262\345\302v\364\220\014\305d\336\t\370c[\306\016,E\033\365\343\222\230p>\374)\226\355q\325\372\r\262t\016\331\021\364\241\006\351\253\347\335\372{R\324\367\375\217}\276\373\247\n[.\306c[\2540\033\223b\301\311\315\211jj.\311\'\037\352\375\253\377\235\033F\377:N\273\375\362\347\243.GD<}a\016\372\000D\351\257\031\373\034\377Uo\247\037\177\205\313\331\211Y\327=\343\355um\342\274\002o\033_#\312\305\226eej>\242$;\353\242\000\177k\345%\301\r \014\343\261\367\260@\202\361\257\313\217\227\007xw/\227\235\321\372\271u\177t?\367\2342\027\221o\372\265\3537\273\\\347\310<\346\262I\035\276\300\225]X\204z\000\t\343\344\270#\261\242\325\202x-\223\375\373\347\352\022)*\343\272{\276\r\20022\331X\321=\364Fcg\261\263z\345\370\332\257\311\314\231\277\326\023\371o\007[\201\260\331\213\037w\215\315\261\276fb;\261N\325}Z\213\312\003\306C\335\rn\341\341\025\203\357\362\207\322\356\245\tb\224\030\216L\014\224\227&|\376\251\230\3647\002M\256\251\242\325\332\357\337\300\373\3667\377\036\371(\346y_\024\307x\301\217\007r\2742\333\327CC\305,\316\247<G\370\205x\254[\361\314\237]\254R\2759\260\343\\\214\014\177\323^.\216\334\264\035\375\td\347z\344\344\367\325`\023O\365q\350X\235\223\"&\212Y\002sy\352\000\306\346\001\353\221\322i\204\027nM,;\231)h;\301\262\331o{\036x|\310\224F\016\243^/b\222\003\276\344\323@\010#\271\326\3270\022\037_6=&\371\372\377=\372_Z\027\355\255\257\253\344\375\340J2\031{q\211\242}\025\364\376\333\227_\205\267\004\367\037\366\355\022\004\350\204\003\347f\204sw\316\027\233\033\322\205e\311\006;\3700\375\361P\374\345\003\033\307dV2K\331\277:p\211\242q\023nw$G%\350\362i\337}^I}\263\256\354M\247f\235\352\372\351\333\016\270?B\026sP\234\306\367\033\211\334\034\344\366\032\317\247\nr\342j=\352\306\373%\245\310\032;\274\rf!i\346\271j\206\274@\\\317\362\203w\2469\022\nG\202Ng7g\277\373Z\220\004\231\227\214}\322\3029\\\355\204\232\370&\342vi\250]\337Uu\275\341N:r\250\217xpx\360[\210\004\363r\307O\334o+T\364\244\303\347FR\376]\2140*#G\267d\363\267\211$Qs\014o\330\351\266\252]\226\236\375\242\373\261\357bM`\271\313\211}\2754\304\337\262oq4\261\241\217\203\234\2559v\353\\\271\213\2333\207\213\313\230\277jX\371\225\31781\216\354\245%\0360\003\314\275\344\250c\371\237\271\314!\005\315\273\277y{\316n\250\330l5\021\357}\335\363]^V\365\223\177\225\250O\336p\243\2132g\260[\374\020\362\362\367\355\374t\353}\t.\314\255\373v;a\351\201#\352\'DkZ\342\n\361}\317\241\033|/l\266 \337\327\005\260\365\373m\222\363.|\214\004\243\'\305\002\216\215\227&y\371\345X\257|\016\032kz\344a\207\252wQ6\\\tqMr\271\"\246\025\306T\006\333\372\206%*uL\030$\377?;y\2111\311\315\362\265\025R\004\021\376p\270}\360\313\0335\345j\234\274\321*\336<w8_\342|\377\"\034\\\250\373\370\022\033\320\333\244t\274\005\330\375\346-\255\207\321&\0065\347\277Q9|\223VO\275n\t\021\331\3415:_`=\360ot\332dX\261f\2253\372\344\351\230\344\363v8\326\232^\244\3737\017\271\311\2051]1\265\367Z\251*b\027\177\374u\014\ne\3765\273\363\345\342\336,\033xv\374\241\210\336\221\220v6\354>\322p\223\357\215wDsn3\373\363\222\334\371\215h\021\252\324\016FV\213\234\306\2617\301g\334o\rij\014cR\256\"%\317\364C\351\203\274|9;\355\211\323xM\311\367\316\201\"G\253\326\272\364H&D\326\r\376\370\362\345~\277\213P\205\243\273\"\260\001\367\355\363\362\nv\357\325\364\355\346?\207\331$k\204\n\304\017\326\217\274\226&\371O\276^\r\200v\366\211\347\2677&\344\246\375V\202\344\216\364\'n:#\303\022\367\035m\321{5\025\330}\3453~N~]\373\2770\206\335\315\362n6^|\360qE\340CS\010k}\331U\313\264\223\263\014ym\343\035\017\247\227\366\351-\006\345\253\207\331Z\336\242\341\2738\'\230\276\273\023\273}\027iR\223\033\275C\317\333\210\210\220k\347\335\252c\206\374Ms\202\007\242^\313\216\267\241\254\260\351\373\004,4\300\240x.\247\303\312\306\266/P\273\322E\333\210\014K\016\336$\233c\262y>\361\223\274b\327\320\327\373\235\357e\332\235\244OZ\256\000d\377\032\333\244\231\351.\316\002t\223h\230\202I\275\257\0303\331|o\367\236\007\355\007\372\210#a\366\354y\332Xf+\361]\231sx\267N\320\226\363\265.\004\203n\377\236\225\335\021R%}YA\332\234\370\260\237\354 2\327k\346z\345\030)\346\rp+x\377\357\347,z\345S[\307|\250\304\243\201\230\371\371\321\217\257\235\346/7\177\005\010\315\237kZ\222\360}\363\323\207\345\335u\202~\356aM\265\265\263\177\323\302\213<\237\331\023\373\024\302[\327\217y5\371\2269o\313:\007\217Nd\220\355\341\322\366\221\252y\205\025\235\272. L\377.y\345\r\017\315\030\021b,\301rc~?\366\264\362\206\232=\204\364\304\305\350m\205Qy\005\216\317\256D\321>\220f[u\306\364U\337\232\001\256=C3\002\231N\374)l\360\363\236m\207F\217Y\336^\363\251T\267&Ms\216\252\236\233E\377J\021\353\334g\260\324[\341\350\t\330d\313\366\232\261\2245\312\247\017\200\336\002\324._\346\326_\344\364x\331\322AO\357\030\014\326\222eD\341_LU\231{\257\323}6+\304\374\374\277\331\336\227r\t\351]`\014\326\376?X\037\262NW\324\021\337\371\324\3026\363\362\351\216\371\314q{\276V>)\177^;\004\364O\362\376\325\322=R\261#\312\303U\361\036^\277Z\245\241\2636D\365\325~\235\030\207\023j\305\025\373Z\357\260\004(\017\370\363&\374\241am\216\337\013\032\231\373\377\242(\216\021^\376\246\001\201\204\377.<p\337\027\033\036a\321\365\004\217\245\215\t\210A\rCWJl\032\273\312\242~\017\262v\0302b\374\322\363\333\200d\361\177\205y\205\213\034\332d\363\376\30553\306\304\330\247\376\355\346\026\177\177N\377m\354m\255\336}w\277\031\231\316\273UL\201\026v\177p\246\027\313\311\345\331\373\323\301[=\034\314\326\311^9\356\010\234\235\216w\373\265b\367\331I\326\372N}s\002\271vk\030y\310\335\205\2102\313.]B_\3178\246\340U\000\277\375\206\006\252e\001\230\330a\216\021\236\264\017\261\363\242\201\214a\321\251\365\311\347\317\267\214\333\213\273\367\234\261\006S\244D\t\036u\244DV\241r\'G\273\031|}x^\301\\\255~\357/\257<\010\216}\237\326\335\303\212$\316\304\350\347d\1770l\303E\270\032\007R;?(\357)y\336]jO\367\355\371\245LorI\203\236\365\324\375\232A\010\273^Y\036\361\177\371}tDDD\223\036o\000}t\227\273\350.\010\371@}>\340=\343\257>lS\277\273\275\365\021\207Iu\021\347\240s\251\3444LR\277x\217\232{ \323P\021\357%\326\346\005\373\306\":: Z\"\")\275\201\017\273{T\310q\003\347\216\256\343\226\306\363\271\331\240\340\246\272I\033\216\316\317r\310\373\221$\272\031\275\025\252d5}\245&\024(\207\234\260\030\200\0303M{\240l\017\033\035/\250\215\236\373Z\346\032y\'\211w\305\232~\324^\\O\247wf\367\035\317\227q\272h\0043=\2707vj\017\030\266\003\331\276\261\247\371\217\302\246\003\331\377\375\354\373\330\021\352X\242I\364\371\356%%\210\245\230\3430~\325o\367\017\362\177\373R\364>\252\300\313Kt\346N\245\247\307\355\276\302L\206\306\274\340\013\342\257f\344h\t#\215%)2F\246\330\252_\377Lx\276|\372q\017\256BE\335\371\307b\203\374\2325\317A9\343\235+\366\373t\351\320\355;-\333\260\271\361\271b\235G\231\333\341\030\3734\207\223\030A\217`\002\003\310\016T\032\301_\243\367\223\374\337\355\030\242=\273w\227*y\200y\007h\005Wf\0063R\304E3\'R\0312c\271\353\251\267%\216s\334\373\274LyH\220\366$\366\330TC:\032\217\223\177\260\231\300\226\346\016\313\375\365\013\263\352\270\373\313|\201@\360\374\367\231\253\272\343\2333\004\325\363\273\333\355\202\305\237\023l5\301\321\357D\223\230\030a\033\375o\327\2315\277\303pN\226\347\002$\331\314\244\350\3360s\037Q\200&\323\\AUO\014\230\202\226\204k\300\352_\243\0358\372\325R\3463-yE-u\232\251\'JR\203\027v\301i\336\255v\031J\316\017\033\267\312\322(\307\317r\276\004\024\3073\t\337\362t}\350\\\357\231X\266F\313f\034\275)k\024\243c\252l;\222\231\275\276\224R\336\325\347&\256M\027\360\274)\032N\001:\344\304*t<\242sk\201:E\001\346\356r\245b\226\335\n-\255\271s\r\"\230-b\254\373\316{\324\305\330\244+\227\362y\311}E\233\374-\304s\247%)\316p\312\206\353T\355$Ll\376\246\373\316\366u\351\025C\340\325$\344\274A\021\016\351{\214\374\334\321\257\270\355\267uM\016\365/\206\022$>\035\314\353V\366r\'\024c\337\001\006\345\275\244\224o\013\376\375/\367m\333\t\251\340%\274\007\345%\233\265^\277\243]{\035\010\340\363\333\331\035#pg\261c&G\200\013\217\037\376\325\336\326k\021\250k>\317\361\244\232Ki\355\354\230\320\033\306\2349$\223G\'u\327\333\344\344\353t\253\215\303\366\001\257\346\333\322\201\330\267h\225\311\344O\253\221\236\377\262\024\264<\rx-\244\r\314e\361\332\245\326\275rU\372\220R\273\n\215\235\215k\2455+\020\313\256\262\356n\360M\277\207\'\314\021\323M56\344\364\326\240\207\025\2465\321\222i>\344BQ\357\336QFj#\270\331\302\272\255\315-\237\034s\341\335;\243\347\234YkX\367\3245O\024\252F\217\217.\355\373\336\272\263M\277\344O\000\237zR4V\350X\323[\316\374\353\266\343*@5\\\014{\004.\373\301\013\037\305\374X\"\247\243\257\253!\265\013\234\237NR\261\324>\251 <\002\2322\325JY\270\177\277&Tu\377\030W8\2574\004^@z\273\002V\235$\t/V>C\370\337\261?w\260$\356\247\274\347y\306\026\314\240\036K#\3160\022\207\360\244\243\252kP\324\247\360\374?\376;\370b\\\353Q~O\023;\241\255Cw\336\313\316\252\213\307wt9\326\361\"\247~\364\026\353\267\3241\360\314?\377Fr\256\034\013A]u\213e\262b\376\026H\375\360\337\254e\017\302\351\311K\341\370\177\204\303\252\225Q\373\272$\226\213\340!\035s\337t\354\221Lm_\2624\3221@H\031nF\212no\235\2032<\235\230\340\336;\350\243\355O\246\037\304\'\202\245b\221\356Yj\025\243\037\253\373\274\371k\\\242\243\215J\253\236`\363b\363o\271\361\343\212\206\265e8\375\251\303\032\032\3315\365\005\337\206\251V\336\313X\271\336(\254\310\335\023\357\023\346Rm\037+B\360S\370~\017\210\217\000bN\241k\244\236\356+?\010]\273\275\266\305\247\033\355e\030\325\2745\344\2527\237\347\270?wy{L\226$e\202\332\275\367e\265;W\236\'\244\262\214\352\253\301\356v\177\005T\254fg\341\006\364\374/+\273m\027\007\231<\242_\341B\2722oK\227\302\330\353\244\234\326\247\003!?\337|w7u\332\351\2117\265\31111\255\374z\037\003d$f\036\252\277?+3vnee\247\241\312\326>\3529\335\255\342A#\007\266_\016\261j\252\255\275\222\216\235\370b\227\246/\345G\316\237\367\347\301\352\325\263\335\036\316\256D\304|\210\232\252\350K{\307\204\314\237\271\222X\360\214I\252UO\016\261\207\254\264*9|\014-\323\370\262\251S\357]\226\2671\213\274\344\302\210\257u\231e\310\373\243\016H\342R\355~\367\306<2\376-Y\270n\007w\036x\2451\335\024UT\264*9h\276\037\203\227E$f%\363\266\007~\222\320\345\363=\370\r\236\252\304\251\3424\221\222\337\274\2505M\'\211\024R\377]\201suP\303\230uv\207\314\257\346\244\251\236yf\037\304\203>\226\251fDd\373\364\221\213\304u\305\030s\017E1\252Y\227\305^U7\207\314\313\245C6=\266\372:q$\366\355\001?\236_<*\032\2245\252\226\366\311\177,\224`H\245\035\027\3031|\223b\')\207\360\351\271\3534Z/;\210\271\237\373\306^&\252\225S\231\362U5M\025k\270\320\306\357\004O\236\325\017\254:\223\233\335\033\242\345\313z\313w\322I\376\010\303\000\001>\321\373\272\007P@\216\250?\301\361\262&\250\310\001\201\001?{\212\231\276\265\0139\373\373L\202\'\324#\376\363\264\007\276\013\277\277\337\223_\347\246l_j\357~\311n<\330\370}\215\207h\013\305\357\204\377\003\"o\024D\353\200-\200U\2633\317{\302yx\376@\027\177\030\355\335\366\214Uu\\}\223\222I+L\371\253\363\221\300\201\007`\307\300>\033\334\001`@\304[\375\345\347~\257\027\242h\222\347\277\347\\\177\356\355\206\0278\\\372\315\352Q\206\253x\203p\336\310\254\347\277\377\265E\t\350\256\273>n\245\210[*\273b\317\344H\376o\375\352\272\1770\366\342=\350\331\275\316.\337\327\336q\257\037G\215@\321\353b\246]rs\3762\3247;\237g\320\321\277\273\275(F>C\356\330M\r\n\3576_5~\221\350\207\301\257\237\201%\311\351\252N9\376o|\222\277\214~\223o\2249\364\3412\375.\256\245\300 5\024\273\235\003\241C\251\002\035\227;\231D\r\251\033&\370\316\255W^\206\2678\3567\034\344J\243?\317\315\374\031\377o\216g\347\213\342\372\330q+\306*a\032\251\312\260\370*\2741\225\312\363E\362\373\217\034\334[\227\036\027r\357\362\3702\347\027\tV\344\234U\234\'8&9K\342\"\252W\361M\312\336\361]\317}\220\367\212\014\217sg\276\021\367vk\023\204(\350\332\225\030\251\334K\340s\267m(\375\367\370{R\277\300\320\265ce^\357$\227c\271p\177B\315\236\252\021.\371\305K\307\000\035vc\360\033\273\334w\244W\371\304\273\223\226s\177\373\3279\242h\314*\232\037\264\t[u\310|DW\024R\345U\3748\325+\016kU\225\335\345kx\246PGq\322:aJ\034\236\224y\367\274\351\235E6\352\r\264\251\037\t\314|\275:*\032\207c<\251\0355K\217:\345\245]J\276\2617\206CtI|7T\333n\030\032\353\254A-\223\223\352u\352\321;v0\027;\216\272v\253h\234\335\022P]\355qM\227\r\346W8rrH0\036\312\003T\326\313\265%\313\2779\353\223\024k|\353\213w\316G\363\376\'\355\236\270-a}K\252\361./nar`m\n\333\014.\032T\354\363\343\233Q?\236\234T>D\345\365H\322j\334\220\316\305\301\t\034\024\032~\373<\336\220\303\030\332\314]a\213T\363S\177@\377:\"\230\367od5N9\216{e\277\251\252\225\214\013]\347/}dv2\033h\353\323F\211V\307.\325\327\023\203\006\260\350#\253\263U_\374\273\217i\271\243id\246gjc\316\2720_\317g\236\026\0304\r\343kTi\n\225\231\372\2545\255B\010\366\264-\344\330O{h\201\023\026s\233\030-\276dG\206X\005x\311\316t>\227\251\202w8@/\221\226\266\303\365\375qh\031\325\211\331\265x\227[\234\3676\311\346\026\202\270\323\334\331\215\350\354NS\222\217wC\260\354Lm\200\356v}\335N\021\223\275\031y\240\306Z\032\032\324S\025\001JU~l\314\273\'#,\361^\262\225.\3670\252\253\241\342\246\025\272\3245\004\376\221g\013zU,\311\376\315\033\272f\251\213\007\027\360\276\n\3051\374\247\373\367N\357{\342\206\r\355b\0170E{^\024\274\312\345\230\356\310\251Sxwl{6&\325\367\322\025\340\367\315?\rR\016p\204Y\216\341\365\370QLo\367\225\312\203zcNR<\025\215\225b\210\342+3\341.C\216\346\342\210\314\221\276\321UO\203\0019Z\267Un\247b\234\324\301#2\252#C\271\226\207+S\225\006^r\276\343\365\177^\333[t\365j\261#Mu\253~\035b\225\235j\032\246\213\340\257<\017\335\361\234\322_8\375^\236\374\014\301P\340\\\320^D\256\366\260\314\212\\\367\237<\005\374\251\356\363(\324\326\213\271+g\254o7S\273\037\342l\246\277\332wss\035S\336\037\205\340\242\363\023\035\020\201\344o+\364{\214$\t\333\000\0034\344\201\030\'\275\354%\312\022\345\342\007+q\220\371BR\324\031.1\340\353\235\233\374g\351\326\236\3557\357\355\263\223C\330%U\376w\211\214q\373Tq\364/)\274\375w9_\367[\307\305\214\363\t\202\226\313\323\214\271\313\215\264Z\366\214\266{\317\234\334i\004{\341\345\343+\374)\3779\314\312\026\257\357n>>\037q\\#-\264\374\230\t\302&&\023\341\371\232Gr\\(\341\211\221>\352x*\232\2430=\320\233=\177l\202\335{\037x*\351\337K\r\235\230Q\225\266\377\347_\027A\3032$\351\317& 9&\3042\031\375\0379{\231V\273\331\246\356\277\250\'\214\027\3272O\030\317\\\211\255J{\242\224\271W\353\366^\035\213\355\027\300\003\367\306*\325\\9\307ib:\261y\212\014\245\035\177\257\321\227\363\234\346\314\225I\3264W\335v\256\377\033=\330\031(w\376\375[\356\371\233,^\2375S\360\3064\211\211A\250\341\322\375o\"k}\024\317\271\216o\230\303\006;\343\357W\0378X b\310J\331%\371\272\222\367\342\344\327\034\354C\246\254\252\324\306\037\352\313\247\256m\220\235\342R\367\253SZ\351w\345\022\023\r\265\303\327\035\226\256\215\346\032\336u\247\326\373\245\317\236\330\372\234>\243<Bo\215r\361\242\224\221\254\353\252\276\345\364\277\277n\336\327\375\202\225\017\256\241\353\371\024\275Z\274o.GG\326\rd\310\033\022v\017\257\327\352\346\033\342\202\326BTw\037\312\375\306(i\303A\037\273_\314\265\257\252\305\232~7\363\355\032t\370r\372/\311\274\362S\327nH\026L\177\274.|\341T\371\252\372\377\353-\257\251\201M\340\326N\347\334\"\"*K\357\267\307S3\323Q\022\0062n\271\357\303\345\210[\357s\024\226\023j\341\177\264\262\240\3526\3077\300\304\211H\211\273\362\016\335\n\335*_gs\240\321\203W\354\345\023A\255\276<\315F*\034\227a&Gz\017\005j\233\273o\234Erow\375\"\373w\312\225\021\006!K\313/D\002\036\336\r\036JWv\244\367m\330\273\321\323\332G=;_\336.\344\000\023\026\237\357\344\256\372\262\357O\211\264\2619\356\213\257D\345\345\216\\\354\234\341\264t\372NI\004\246\317\357\232\243\336sm\022\233\306\016\225EC7\260Gn+?\223\366\036E\034\034\254#o/\3436\016kTF\343\2477|#\227 \025\274\251U}9\333\351\216\3566+k\336\032\213\367\223\177lX\2435\230f\306=\266\337x\323P\027\232\231u\327i\241\374\257\377\226\273V?x\222Z\253\362uXi \313\2332L\002\212_X\000\001G\256|t\357\356_C\230\306\314Yv\255\336T\376gc;U\364)b\365\362\014\222+\0313\272ToS+b\223\326\313\344\273\354\266\030\321\330V\304\007\262\364\300\347\026\"\034\273Uk\303ck?k<\232\230\370\263\301\316\361\2531z\352\262\253\317\265\250\252\347m5\317\263D\200\256w>90i\362\350\000|-N\256\301\r\2468\207\261\233\007\2622y\263/\362\252\303\333\274\325\324=\t\006\336Gu5\002\233\362d\246\245\3120\375O\017\301\340\354\316\330\346\273\034\262W\236^\\\315\363Z5b\3022\201iM\021\t\213V\376i0\222\326\325\r\036\365<\330\276\206\2364\363\373\334g\211\374^\342\2575&MS\020{c;\314B\231;\375\257\347\262\024\351\215u;\251\331\261\t\223\305\310Sz2\372W\236\017\317\251\210\344\\\236\211\251\354\300\235\\o\370+\201\302\037\270\210\255\312\343\371\272R\232k\377\367\364\331\310\235\307i!\367\n\375\356\341v\303\370\306\310Q\272\224<\246\255u\256cw\305W\252L\325\245\322F\300\263\375:I`\004\341\372$\023/\235Y\007^\325\237\007w$|\324\213}\211(\017\364\r\275\3472d&\3603%,\311\340\360\323\2132`\336\264\374\251\003\246\306p\016\363\262\3529\002o\000\363\265\273\374*\355\334}\234\031YQ\240\373\240\t\330\017k\370\027\0375x,\360 \236D\220\265.j\273\241;\024\341\200\202=\366{R\203o<+\351\365\324[\033\332\206\306\267\247\010\216t\226t\2333\264w\327\221\003c6\006\303\302DG\231j)\274*P\230\370&=\364w\030\376Y\033\020\363>s\260\023T1\334\347\270\233b\347cs\273\317\354s\020\t\374\"G\363;$\210\233\265\307y\227\360i}\372\002\326G\206W\315{FGi\216.\213\241\365#\274\270\nX\027pQ\"\373_Y\264\226\373\345g\262d\223\032/\013w\272\355:N2\010\312\340k\343\202/\004\"v?\004\311\005k\342\330\357w6\032\377\237#\221\021\037f\016\227\324\223@\260\236\360{\260\200\276\232j)\364\355\327~\201ho\212)\213\303(\316\0231\017p\016I\312-\026\227\342\033\342\237fv\362\371\347\317.?\353\351U\304\344\351$\346,\0312\003\237x\363\336w\344\014\276s\374\374-\343\200\177\271/\334\276g\233\255\250\372\037\232\255k\261\211\376\026\027\365\237p\020\363\333\306=\265\307c\033\036{\324#\2379E]\325<\261\321x\360\234\335\371o1a\023\220\313\323u\177\350\377\243\037\276\266\273O}\372\377Gv\253\362#1\031\243B$\266/\366\264\277\374|5k9P\330\017\334A\260O) \375\006s~\0354\331)/\362$\207\273\203\246f\\\351\272\354]t3\\\234`\361\333\3344\253l\017\360\205U\014w\nW\010\273\363O]\340\274\201:\356u\340YZ\240\\\310\260\305\026#\361\325\354\326P\231\031\335[\205\362\'\371j\233\347K\302\240\267\375Ld\377#6\255^U\307\375\263\215\322\225K\364\274\300\337\365\330t\350\240\304]6\233\357\236\203\033Y\204wXU\202\324Y\337\277i\254\365:\263.\261\032Zv2\371\361=P\372\252\350\323]\362f\002\263\301)S\023\312\021\222\257\375\007\247\242\344\363~yX\324\026;\203\262\235/jq\373j\345\351/\214\366\010q\023fyz\377pt\311@n\303\024\017\317\024Q\243\352\375H\007\320\"!\301\2279Q\366\013\373\353\377\224\377\274\254ME\227\242\2037\304z\253yR\355\004\230\326\202\003&\224\271\034}\003J\177\010\2451x\304k\334\002+\370c\274/2&d\'d^i4\026J\r>\375a\336\203\000\303-\303\212\223\267\254\362\322\360\254y_SD_\025\r\254\220\355\321\331\3100,\240\377}\222\017K-\256\271}g\331<\267~\325\257\3375\364\373;\301\243\343\264O#\336\302&Cfx/\206o\307\374n\342\263\377\312\377+)\\\212\347\377.\226\nV!\255\241\251\005\246\232@=_\032\307`]\312q\3361\3364\330\233i4\274\346\371\\>~\274\036\'\\\232b\277\234\336\222T\336_\253\374KH\257\367\252\373\323\364\3145\362\343b\310y\0019\026\026\277\313\304\325:^\306I\334KM.\036<\340\2565_\002\016\\\322\363\010\321\246\275\2237\373\265\211\226\330\272\207<9T]\207n\035\023\262O\263:\205\323\357yzL\367\367J-a\231\\E\265\275~\275\013\260cf}\"\246\344\273\354\277D\0308Dv\246\264\204\220\320yJ\216\304\027\341R\3507\275\324#\237\'\350\222}C\242A\310C_\236\252\023\353\3655\220\347\326`.P|\242\"i\277D\227Dr\255\000)\303|\030\353S\261V\315D[\032s\260w\020(\265Mm\347\306\253\251\256\2670\033\365\333{\233bGN\273=\217zM\021>\375\274\222\277\341\223-\314i\256\223\262Du\367r\307\020F\355p\037H#\213]\032\351\2379\000$\223\273dy\254\234\334r\353\343\267\362~d\321\004\t\227[?\256\305[o\274yN\330dN\346\376tu\314_q\312\217\217\204!\330V2]\365U\365g\236\330\317=uv\223$\366\207e\031\302\010\023?(\252\343C\314\0170\2219^\345hb\262\353\177\013\360{AF\005\234\317\357\006\306\371\210\337jT\251}\270\222\267\201\355\3464\375\024\317\344U\263-\260\3740\327n\255\036c\267\374\375\027{sw\330^c/\2341\242\240%\377\375>\264\036\223o\3031._\203\236\037\200\331\324\357\365\370|\251\302\342\241]\201LO\357\210\006\365=\310cA\223K1%\211\306\252H\363\'\2021\027\233Z\355\376\352\213\373\373UY\\\2536~\3708\037j^\230\371\310\'y\267\233\313\374\315\340v\267R\234\221\205\257\357[\225\006\210\251\350m\275K\353\237\265?*J\256k\367=z\250\342j\025\274\272\303oH\304\232(\271\221^\363*9\322?\274\353\356\3025<\371\233\335K\355e\232\237w;\314\006\276\3315\\\271[\3012\027\205\312\3648\220\364>1\233\017s\226R\335\251s<\352I\227Y\376O\270@4\370\'\'{g\376\271\025\301\356\361\3709\360\266\244\202\022o:\215R\226\177\305\017 \205\274#gi\351\337v\351\3451\223\344\357+\204r\345\356\325vA\t\260\230\3461\030\267\246%\267\001\237}\314\201\362\017\271\320\363wy\276j\310.\305m\355\313\335\246&\007\007R\264\223\231\326\000\021}\354\357l]\273j\274\213\236\263\3656;~]7.S&N\343\031\367\016\271\276\316\366\340ipm\305\301@\330\244\373c\347|\367~\362\363\231\316\356\333\364\351\271|\316\261\314\236\023\255\364+\353o\034\265\021|V{\211s\314EOc\250\323p\226[\245_\352\\\234\317\235\266\316%\366\305\035\354o\327`\373l\270\023\250\351a}\341\036@\021\323\314\2266\\\351p\351\016\373\367\325\010}\3479\276b\237\322\366\373.\363\337q\316\334\276\365g\214\357\307\363\313\272\226\342\356\360a\032*\356\"\233\010\034\254\374\230\032iJ\356\001k1\341\177\005\215\341\345\275\254\357\224\207\026\314\321 `\336\223\377\305\370\316\374\261\351\016\373\177\3678<,\2610w\305-+\227^Q\217\n\376\0011{\007 w}\335Z\267\311\346]\026\213I\274\365\272>\n\253\031\376\240!\366-\010VLp\346/\345\007s\265K\301\\_\306\365\320\220\274L\277|\250\326\014/\035JWu\316\251sk\363D`\312\3732\331>\021@&\255\213I\025\213I\032\033\203\322y\317\211\376\244\033z>e\001\031\252\366\313\0312f\0320\237\356\343g\374\227\305O\352\221k\232\3311\217)J\\S\370}\027\177,\276\315\322\306\351\251\260\220\336dJ\032\266p\323~:+\366\237\305\027\274/~\303\274\300\352\234\253\177\177\263\\\313m\034\002\270U\313\276\222\204?\313/\366I\244\305\300\t\211\303\014\342o\341\267\376\210\326\226\030\367U\234\254\177\214\303\223{\217\344`\276Bo\215\177a\265\367\363ymX\336\024\274\373\253\321\251L\223\336>\021\317o\230\251\314\253\377\356f5\270\343X\334\357\223\032\203\037w\266$\206%.\363\316\010\363\177\261H\332j\365\353.\267\002\224|\265o`\243\037\013\356\342p\211L\247\367\227Z\373wn\336\311\037l\246}#fUWNf\367=%&!\235\343T\237\2527`\003\263\267e\321\330\355\t\217ci\225E\360\274\"\321}\320\313\362\255\355=\206S0\025\302?\311*V\255\344\227\363\027\324\211Mow\271\366s\"\265\211\344\271\223\004\215U\363sv\023\205zs\337G\365\306\007=\336\301\224\227\030z\t\017\333\227\262\325\310\307?;\330\314{\336c\270#,\233U\234\275\223\367\275w\317\316\223\270o\022\0375\021\306z\3631\363&2\370\335\232\363\321/\326\021\303\264!\236\334oK\335\206:\332~r\373\371\016\303\223\t\2750\321W\277\321\322n_\310\241FK\007\272\224_\014T\364\341\212g\236N\214g\027q\322V\357\361g\366\365\245^\260pH\276f\352\346\303\371\320@\216,\275\274\236\273)\216\354R\375\273\356\334\'\236\354\357\203\300bt\377\001\337C\312L\003\267$\323rX\n\'\365\356\037P\275\313\345\377\251\251\244E\351\350}\200\001\260\342\271\276\016\246X\307\266\007\262\256\215\271?\357\020\251{\353\303\271\262\266)P,1\340\251\007aN\014\236\367,{bRMQ1\2461{\347\245N\263\310\354\340k\244\373\2161\265\267\324\272\035\256\227unL\306\'LB\336\375\313\270/\274U\316\315Y&:\364d\007\330\327l\020O\303\032\034\375u\362\213\317D\260\035\302\312\\\006Z\316\253T\222O\363K\316\021\273\377b\210h\3574\303n.\221\264,{\207,\211\366n\005\263\361\311au\303\023\036\017\306R+\030\270\t\346\033\253|\302\236\336,c\334\236\226\352g\333\007\000\376\367\020\'\243\364\260\036\270\367\211\214*Z\021\235N\030/\342\210~x\222\367\331zA\257\236s|W:\344\022Q}\234N\366\340;X\351\024\2029\334{\357\"r\342erk9\335\376\242\251$.r\255\236t\326\277s\3429\\\274\302\356\363\261\324\313\326J\032-\274\266\271X{\317\305\303\t\257\300^rGw0\346\023\230\025j\034\365\362\233\024\177\024\234\371\256\241;\256\216\251\236\'f.&#2\251bO/\000U\3763\321\275\362m\310\217\224\001RcA\334\235\024\363+V\234\357t\302\242\264\335\361U\346;71\'y\021\270\336\373zs;\323N\017\276v\307\346|\314&\361\243\235\245\243{\337oYk\205\345k\'\357}\211\372\357ww\3229\272\304\325\025\356u\210\307|\250\271\372\355\347\212#+\223&\227\334,\307>]\372]\241\367\367$\307j\277)\347\023\205\335,IwP&w\274\252\246}\305\252\325\367S\201\352eh\347I)ni\367\307\362\3229P\273-8\357\231\333\275?\2301\265\316v\200Wrc\255!\236\'\334|Jl\227>\3478\244M\177\205{I s\3263$cx\377\014\373\207\315|&\341\304\273\214\332\274\366\274\250\014Zs\236\035\331Kt\203{\311\374\\\373\334\205%\313\326D\367\301\371\342Z\251k\272v[\243\203e6lz5\357\027\3573y\222\314\021^\177\274q\336)\243qq\253\274\363\264\364\225\206\236\3533\256]5\377\204\237\272!\235JX\244\327\235\306<p\020\377\203\240h\245b\221\037\264\244}\3647\303=\251\231\377\262\007\335p\224\333\330\321b\304\32540\265\337\\O\243\265\325\226(\237\216\222\312\272\345(\017\221\363\353s\237\356\224n\347\266\366\252\240\364\245\367\347SkeI;n6\255\257\'wI\244og\367\212\261\323*\231\237\365\377\032\306\033\375\362\237}+9\177\205\3037\035;\276\344\310Hso1\224\231\177\'\265.5\273\365\30469\363\367\363\376\357e\307\277\014\313s\317+\r\355\\\262\2154\261\231\320\277\025j\276\371J\371\234\271\376F\256\331\372\037\035\314G\264\261Lq\320l\021\004\227\206\217\227\270\206\276\2758\337\224>.&|U\272\276R\006\014\244\016\211\275\351\323\032^\215\3470\021\215\316\321\322\264\335Y\241\377+h\253\254@\263\375\232\377\237\302\237\014%\240C\353\0351\213\365\033\211q\330\373\362\203g\377\215\317\340\227\302\\\222\001\212S\362\261\023\347\346_swq\251\356o\377\316o9\370z\016\371\362G\257\\\216\264\017>w\311\033\202\324-;48\232\370\213\306N\365\tk\260\316\347\343\022\343\273\200\305\365\215\214\276M\241\205u\263\275\022\035\247\220\310\361\215\3644{\234\347\203J\010.\315(%\337\211C\'\341\033\276\332+\n\346{\202\343Q0\345Q\031LZ/7l\314\214\206\223B\225]\335\271-X\207\330K\224\312\331\336%\334\200\001\260\223\t\333\344\326\177\037\302{\377G\007\316\363P\207\240\375\037<\376\004\324\344\271\224~\354\002\227\365B\373\010\"\263xn\261Jw\330\347/\351v\033c/\215\305\365\363\365\245\212M\334\236q\345\262R\3571\214\036&\366\303\346\270\314\310\354\031K\\\364\266\306\363\356L:i\005\324Dl\354l\244\366\272l4j\234\254\352[Y\331\310\257\001\341&\355u\273\037\306\032op\350\336\026#\340\003,y\307A\025\333Sgm\235\270m\345\220\220_d\277\277A\212D3\267\003\034\324\326\035\002\"\317\037 .x\362\337\237\357\327\317\023\177\236\022{\227\350\236\327\330\210i\331\365\027\344\235\260\036\321\rz[\252\014\304\366\272+h2Q\216t\245h^\344\217\006\245\360\350\250\344S?*\352\212\330\230\337\345j\3124\331\235\275\314\307\370J!\214}\261\350\222X\275\251R7\2110\022_y\244\367\364\376%%\216c\264\277\324\257{\276\313\367r\323lx\266/\367\030\244\360py\216\233\372\253R\264\323\222\376\367\271\214\275W\274\223\265\010\366\345\321\227:\327\236>\311v&\315\343\270\235\211\250w\273\2209\347s\256W3\262\013\357o\233\205\272|\n\313\266\014\307\355\333\034\316\351\032zIm\024\225\017\234\357lE\254\300v\354\371\324\253)\237\224e\257H\t\246\257\251\304\n\374\014\313\336\311\316\033\263^\027\346a=\337n\333\316v\355E\334\222\352T\342\'d\264\326fs\362\330\376\377L\361\233\257\030H/=\350\313\314l\003|\013\273_\034\275\366a;\211f\367\033\204\022\260\035\223c->YW\r\363\271\206\207\271\243\301\032\336\310 \302]\302\337\331s?{V)v\251\370b\\\256YW\2230\337\013\313\334\235\345\177+\230D\007;\225\355\016\033\326\334\226\002\305\350\023\005f\2773\277K\234\033\320[\035\316]\367;&&/g\331}f5\362;;\333\235\316+\275\305d\366\235\216\021\312T\315V1\351\005\rl\337\234x\367\256\211\307j}O\367]d\215\024Y\205<\332!\370(\037S\034m&\267\377\030\327Wi\242X0v39\355\203\354\362h\260\360i\362\201]\370;\t\222\271\3506d\267\314y(\307\305)\324\246o\366\315\225B\204\024\327\263D\354?|\212tXo%\007\361\016\272I\262V?\t\237\373]\253)\232)\354D\330G\'l>\352\363\'+J\374\206\264\276\314\226\251\2429\017&\034-\372\306w\310D\021\357Y\260EW\330\352\250\206\354I\336\246$\372\",\323\033)$\276\3366\361\304\'\264\024YL\326 \235\325s\327\227\210|X!\204\253+\366\206\234\2245w/\227\267\007\221F\360\001o\026\025\252\202\3742\006\272\317\230\327\"\302)e2\337[\002K\371?\317\223\375\3028\000\331\273\003\260N\2459\217\326\356c\t\350W|\025\376\242\036\371\336)b\312KKGbJ\311\027w\231\0339\337-O\232\364\215\313S\323\356;\367\372\253n?\320Rn{&\2257R\256\370\375\220\017`\002`.\226\004\304&\024rv\355\346\023cH\337?~@!A\r%\376\254\342\030\366\324\037\336\357\235\307L\276K\335\263\263\217{\306\237K\305]a\2159\356,9\357\265\206\301\027\\C\275\275\203\357]W\334\235\336\327\223F\037]\357SED:=lQ\340\244|\345\377\306[\273\346^]\220G\274\261!\254\200\007\244\251\201\217T\323\334\364\371\370\023\2534\351\316;\370b\356\357N\372bs\327\024\312WN\230\345\243\257\031w&\301\260\372!\025\252\223\204R\205~|\255@\023\027/h&\220\325\260\006&\364O;\312/\203)\300\330Mgo\301Q\031\023\203\322lW \377\027\223\206\337\227\230\'e\357\275\\~x@\301#\267\262=\355\354N\256>S\222\327\227\357\270Y\343HnK2\361\276s\224\255\301\027\311\372\322p2S\363\213\352}\307\337\352\261\212f\221\314]\335\260\305\355Z\366T\303\361\343\357\3354C<\356\373\264Y\215u\255\021\307\260\276\311\305j\332L\231>\303I\330\037L\221\362{\000\362\357\245\336\033\314\375\305Bw\341b\2254\231\244?p\336g\317\276\366v\177U\323H\236\036`1\261\321o\347U\222\377\307\335c\274\016\343{\334\316$\267k\247\237\2572}\327\333\030\321\'\010\303\273\353H\246\306\211\345\027\367\376\301%\353\3370\362\3511\227\316j\310\344s\325\001\350\333\264o+\244\273\372\313\340z;P\177\222h\232v\375\017\247*\225 \222Z\362+\336h\026\216w{\313\335\377\250\334h\345\211|R\036\357\255R\247\'1;\260\222>>?\240/\001\213n$\000\347s\325\221\362t\204D\312<\243\312<\371\320\262)+\010\210\250\365*]\026\305T\\\352\225-F\327\307\317\264d\321\222C2\370\206R\'\024\366\222o\275\353W\\\027m-\306\315&\330\224\343\033\003\032\367\205\307b\355\272\371\234\305 \0045\222in\236W\271\276\314;)\231-V\246[`\3035\317\317\304\244\310\221<\363-\371`\000\234\010\267\352\320\376\000\305\376\337\200p\032\337X\242V\356\226\023\022\006\203\230%[\033\003\211\257\233`\353\023\r\242(\365\365\\\301\273_\211\370\237\210\341tE\021\215\200\022X\262\001\367\214tW^\005\360u\342\320\343\324O\252\260\200\213?P\003\355n\007Nk\373\347\031\346d;\177~\377\006\323a\312i\203\257\317\254\355\323\3075|\031\344\243\177\246\357]\213>\336\303\016h\332\336l=\367(\026\2410\027J\222\206\377\370\003\3529\315G9r\010\332\354\007tW\355\244\273\272l\246\374\337\304\217\341\264\250\365\312\177\266\2478\256?\356\325\363\341\360\226\247\037\316\207\016\251jG|\356\334\326\337\234t4\350\204\352\350\367DQ\024\332L\002\340\257UF\003f\177Z9\247d\313\nn\336\177`f\217-\377\360\346\276!s\332j\234a\001ve\230\216\233\234\027\347\252\"z\223v*\271\325\314\301\3227}:\317\360\361\366%\277l\264(\014_\177\337\360\241\253_\235KS\26598\3143\"\230\322X]\327\346\237,xGN\025\341~\207\277%|\204z|\310\273\'\313\255\236a\310\010\230\277a\255\177\006p\206\r\022\274\013\253%\006\177Z[\341/&!\216),\202)=\253\371\232\372\233\207sr\0048\375\263\022idj\365\274(\2628=\344\235\262j\316E\352\304q\355\ru\346F\312\362cR\345y\255O#T\275U(\245\241\311\257\266\346Z\342\231\254\355\002*\333\306u? N\344\033\2312\256\020\212\332\304\367+\303_\352BG\236\313~\373\340\250\365$\001\323s\212D\375\024\000rR\230\360*\321\021\225\246t\024\032\215\377\317D\334\201\363\366\333X\364R\320\024\265\270?\234\376r\014\257\017\264<\350k\344\274\305\352,\227C\367i\247]G)\262\250\264\337\216\234\346?\243O\327\n\337\3122\327\351\321\235\277\270\217\032\242\r\356\357\016\363\301\317Bl\362\340\250(\037\3277ar\333Q\021(5E\321\331%\350\350\252\037\2378G7\236\363\206\235I\315\370\265\326\200Y\361]\200\003$\327|%u\313\317U\275\356\001\301\252X\217\342\2250q\271\365\270gU\363\211}\363\277#\031\310\313\316\277_\252\333\021X\004\376\323\010\357R\375\263\313\354\272oo\235\024`\222\310vr\372\236u\323t\t\316\314\320\345\251\262\3636\266\373\214h\361?\0106Z\376\325\024B\210\343\306\013%3\026cw\336r\342\270\353\034G\245\376q\\\22353\363&\265\307\246\365\352\037\371\205\211-\267\226B&\254{\377\320\357aM]{X\332_[\302\224\207_\356Nh\326\377/\344\2170N\200q}\324\264\366\333\2204\304\022\272\230\337\313g\235\030o6\304.\334+\366\3569\307\371\240\357z<\345q\252\377\262\221\315\237\177h\027b\316f@\276S\r\255J\225y\3055Dq\200}\377\325\375\271qX\275\356\230F\266\363\336P\3429\365\377\177\2461\277$v@\254[\272\317\007\303\331\343\332\373\274\"\367\317ye\255\227\334\367\246\331D\276H\372\341X\034\341h\2633y|C\231w<\275c\315V\003}\027\331\205g[\363\201\2630\304\350\214\233I\360\331*\216\330\276{\312\302\355\322\370\226\216\341\23613\306\213\372\274\235Mr\037p\257\332\363wE\231\310}\367\023\250~?y\2111\237\234X\310U)|\357\006B\265\3775\373\361Sd\276^:\241\367\253\256M\035\375W\377\033\273\235\357-\322\322\276n\343_uN\240w2\327\324\371\\j\304\375\017\317(\262\367\344\213\333q\377\274T\316\373c\317\t;o\256\233)\242\030f\354\337\212\242o\325VR\257n\345\203\216\001A\367c\327\267^\327\225\257\252AWx\251\274\375\n\354\307\025\027\343\354\3025\335\357\214\334\310\304c\247b\236\337\277}\347\274W\"\263\316\366\210\342\230\2266\224\226\030X\017\001\342l\354D\321\255m\002R\371\270_8\320%\217}\350|\014\230\323@\220\366\275\375p\206\002\0311I\300\357H\217i\315\21512\'\273\256\275\314w\221|\210\341\217\333\253z\206\262\235\366\004p@\357c#\350\232\006\207\024E\225\252\017\322\337\243(h\222\324\313\346O?y\"k\334\363\341\206\321\033\266\352\003\343\177\371\361\016\232\t\023\"::by^\351\017\336Ki;\302\334\225\231\357|\364\274\342\362\322w\356\034\033}j\225X\373\345\336p\274\331\305\005\035P\254\347O\374\230Z\203\333\002\210X\377\'i+\220\005\365\034\213\205\363\026\201\320\024\223q\264\\\262=\274^w\351\317\256\034\277=l\321W\211\000\354\226\234\340 \000\256\217x\357tH\232 h\023v\210\353\345\263\322@\302&\207\240^\234\214\247G\016\336\310\317=\311\241)6\223\317\005\272\270\376Oz:\2709\370\360##\354\373\007#)\242W\236$\277\201Kwb\255S\343\351\224q}6UUQ:,\013\341\314}\367S\235\315\036|$\231\215\243\256\224\271\265\300\377\233\017\316\227\370>\205\364\336\254H\261\315Z>\227\340t\243\215S\357\377\377\241\255_9qx\274S\246%w|\223\004\222_\026\325\377p\376\374B\3119\370*\232\273Z\213\224\315j\325\362\355\217\207\217\302\026Rpvn\300\377\365\360\361\245\246\370^\025+~\016\336\031=\247nn\250\251\013\340\354\210\261\325\347\360\313\336\217\211\341\023RX\231e\242\323Q\216\212R_\313\277U\376Y\262=\243i\210\317\265\347\224\372e\272\223\273\241\277\366\210\365S\341q\275\300l1\354c\360G\223\340HQ\361\243\003\243h\303\374f\373\237\224\245\246<\206\351\377O\223\016\335\211\214\252\321\257\030<\371<\245\312*\354v\375\221\027\373\364\347\327\347\333;\006\177\232\326/\013\317K\344E\275\336\376#\014\272\177\322\306YV\251\343/\031x\313\363=\316\271\371\375\376\326\316~V\374\362\372\017\317\312\035\000&\251\204\200\004\347E\201\247\242\344\234.\006CST\302|\320>\340\007\241\262\314\303W\004\315P\240{\251E\264\213\213\2419\340\251CSTns\021\322\301\320\257I\315t\346\201\327c\326\2567/\312\206>\036\277\376D\363\245\300\265l{uW\331\317\004\273>=j&L}\371\020\332\017xU7\256\241S\232\353\256\231\326\251\274\232i\020\301dy\204<\200\377\374z\324DF\364\017c)lp<\254l\326\201\367E.\201\316\376\014\025\264O\272\324M{\3708\226\257}\323[^\335\330\231\325\2525Y\250\214\037@#\031\023\354\021\376\215\355\226\242`A\320\310\237.Y\007\025\214\362\274FU\302\210\305\347\263eQ\323{\n\317\334\262\004)*\245L\3568_\377@ \245\356=\223U7\332\335\276:_j\312I\357\013[@9\252?\013\273\277\235.\306[\276\177\347\272d\311\220\302\326p\021\360\321\211Cd\344\370R\247V-/J\341w~\210\315\374OK\024\222]\361\203\210RKcUpm`O\303\364~\252\002\037F7\2244K\003\364\263\275|\3614\035Pf\336\357C\274 \325\225\332\353\262\271+\246ev\327\2467\341}eM\336\222\"\252\311\021\206\367\340\301\377\236?\313\273Uy\024\357wn\347-:\331\001/o\255\213\304\023\370\313P\374[\031r\225\\6\233l0\337\334\271:6\211\357\241\036x\027\277\250A_\337\3235\244\336\361a6\364=\215,\027sTya\363\273[\301\210\357\322*\212zu\326\312J\033O\335*\257\016\303w\237\347\205l|<\355\200\200\351\003\214\352\303kz\002\000\226\272\376\3725\261\371n0\252M\361\246\314dg\272\257\373\024\325h/\331\322\257\177p[\017}\030\352\341\242\321R%\255\327I#\"\204l.\3577\020\030\373,\212\361%\275w\371\226\270\2427\2676\001m\372-g$\316\376#su\354\343WB\347\362\325\010\347\376\242x\336\021\031\262\274\306\377h\305G\275\036\353\334\370\253\377\247\371k\366t\226\235l\234\227-\372\317\242\"MrRY\201\t\335YF\337p\377\227\225p\353`v[\366i\221Jk/\343\031\354\036\033\013\177\033;\276*_\255\355\251v#\262\303gP\347f\371B\377T\360)ZQ\311G\'\356\275\315l\212o\212\366+\235\035?\017?f~-\247\322\327\262[\243\243\305\177{|\365\377\016{\3322/\323t\377/\231Vk\364\277\204\316\261I\263\3025\304\345\001?\177{\350\230\2276\2029\221\326\277\017\024;\270\263\250\257>>#K\367(\247o\006\232\255Y\2754o\177\3317\373\365\215\215eW\345_j\374}\373\016I^\346P\274\330i\032\371M\276\307t\007v\253\260pe\005\036L\006zj\273\237/(\226\377\206\310\257WV\363C\275\256\224\251yn#i\235\035\203\213O\001\235\325\271\362S\205\217{\304\307{\347\007\312/\022\277\217G\261$\025b\361)m\272\210?)\3765\351/p3/\277\276J\255\365\277\226\2703WUK\256\301\022\315\326)P\206\271\302\271\352\341\246\217\214\352\334\203\221!\3368.\301\300\"\020a\275\3051\275\3017\307\227&\277,\264\325p\\\004\226\373\206#\030\361\367\316\337Bx\235\340\275\301u\275\226^\322\236i~\265Ij\017\247\017\307\362\360\240<\310=^|2\313w\216A\034<\247\241$\310\211\030`\375\341\004\225\262R\216l\265\002_\352\326\252\007#oGb%\334\365s\273\277&\215d*\367\243d\372\232\n\010\342\351\305\003f\227\367(\010\257;\347\261)]\361\2062\326LfKP]u\330\304\2077f>(\353s+O\350\312!@\t\242Lw,\255\275\236A_\254\373\014bH\3564-\232\247\177!\022I\336\325\367\315\357\1770c.\366L\303\033\034\356\200)\000\344\221\264v\344\377R\347D\360va;\216\353\220\347\323\325+\312$FL2e\356k\363\332\235As\201U\377|\305\355p=yT\3252\177#z\273\373\037\245>\216y\232_\001\215>6\320\225\367L\314\353g!\253\214\016\300\013\226\357d\276\353j\"\233\311v\371\365\376M\357Q\2230Q\206R\247\356\350d\373;\206\036\250He\010\273\273\227\313\245\372\311x\301\264\234\232\2652\270Ve\225$6_\273\344\277M\205\373Te\357\342\361\007\254\326\265\301\250\356\263\032\371\000\344H\310\341\243J\260\300\327<\321\362\323\030\241\321\377&\300\205/*v6\347\'\334l\205{O\352~\030z\304\363\330\223\355\273\337\037\272\234\340?\204T\252\3201u\346O\276r\311A\251V\245\031d_\303\236\302\317\255\342|5\356=0\346\332$\222,e\244\335\337E\312\310\353\274\272\rRbI\t\250g\260R\227\353\373\240_\237\376J\345Z\231k\371|\336\354We\341\025\257\034y\036l\304K1\002\032\376\237l\030\376O\335\337\377@\230)\037\256\375\243Y\245\363\314t>\270#\234efQ\246=\275\355\262\314\366\373\2401\302:\203\376\335T\315\252\344\270\315\356\265#i\240\317\246\002\304\353\307\376\017\300\272y\333i\262\202\371\002C\213\025\010\365r`\230\225<\004W\353\016\333\275\216\271\'\315\277\344\302v\255\216R\251Q\243\317\375e\374\276\315\030\342\377\377\331\252#\030\321,@Z\362\261\371+\371_\214\246#\371\024&\242\370C`>q\305\247\373\337\213\305O\351\363\227\034\262\267\031\311\271\000\372\271\022\273\274+\013\265\234\275)w\262EJ\"\217>\"\006\0056_\355\320PjS\261\201!\367\360\371\n\276\370SO\341h|\326\302\306\304\311:$\330G&\236\357\302\2467\177\212\005\350\3472\362\350xH\350\316\215f>\"\326\215\371\304\224\362\204\213\345X\307\313\345\003l\232\2729\242t\261\351\344\354\303(\rP>k\347\037V(\212\2074\334\217\217\327\347\365\245I\267\341\321\362\272\351\332Z\367\227w\206\3315\r\tH\370\225\362G\360\305,z\t_\306\253\360\203!\350\271z\032EcL\360m\261dX\256\026\302\245k\314\016\325E|_\267o\245\334\341jd\027,\202\004\313W\345\324\221\231\220\377\025b\"\025Q\r?\206\333\177\323~\360\277\347T\335\337\003;v\376+\036\367$\262*\336\r\333[\007\366s\314i\245\3758\262\212.\3671\013\375\257\260\364\357\221f\255\322W\014\'\304\3675v{\361\333\306\235\2147%?\211T\356\2306\037\032\335n\272\201\226P\370\247?\256UO7\017\001J\3606~c\035\221F\353\026\022\222\216\327\376ku\333\256\345\"K\346\247\266\360\004\311H\347k\265\234\237RVZ?\020[\376\315x^\031\326\246a\260\250\\\000o\237\336\253\225%\352\275\r\017\265\256\304e\360f\255\003Z\351%\217\346\347\347\302c\341\007\373\324\344\352\356\374#\037L\307[\372a\227!\275t\342;\361\311\031\023\345\033\357X\330\360C\223?\0032c\241I4\361\227\353\372\323\222&\237\364\250\3217?\010t&|\374\374\320>\034_U@\'a\213\356\001\256\036\325\033\372\260\376\300[\207\004LF+\246H\2355\210I\256\231(E\030\375\365[\240\325$\323c\3335O\277\346\275\232;\334R\226\201\235\231\212\233\373l\343\376,\211{\371,\236\332\345\250\242V1\363\314\257C\263Q]\373u\224\177\262i\020e\233\266\366\3372xRa\332zt\241\235\364C\346\305\301i\311~\353\251\216\216+EYY\227\256\307\376ow\324UH\343\036L\362W\032\rw\010(~\026F\313[P>\263\275\250GkV\343J\257\375\373p\275\241\275=\306L\301*\004\276N\003\261\035\347\315\326\310.L\'=\323\335y\364\333[\307\311S^\330\356E\201~\362=\357\230\241\325\373W\n\253,\311\301!d\344J\221=\227\314;}\031f\227\270K\332&\237\003\317\373\234w/^!\330\263\244\343\026YQ1\311\242*\275B\364\261\006\\u\303\344\351\344-\302\202As\017PP\357\234\300\035\335\360#\305<\366\351\370\023\022\333\017\311x\251\010\232\316\215ZF\264\276\300\313\224\223\212!\022\266\336\335\346;\276\375\237\301~\360\\\207\035\r\343n\312tC\244}\314\275]\361~\215_\227*\302X>\'\024\201\254\013\350\026\241\342\236\221j\302\331\364\206\237\037\026|KE^\341\017\267\201\305#\220\341\334\t\332.FV\337i\004xL\023<y>\326\205S*^y\327\343&\242\260\017r\2630\005\333@\357\020%\334\314x\301\t;22rMuz\251\254F\216|\214\317*\315Z\235\355\350\224\267\370=`\265\311.\325\004{Q\255u\335f\264\233\301O\023\313\033\000\331`\264\336L\236{6$c}n\373\320M\324\365\357\331\272\350\214\277j\222\373\205\360\033~\033\305\225\242i?h\177\2710\227\2667\005\247\310Q\014\217\254\222f^#\205\005W\274\377\374\376\362\3472\244sG1;\033\307\304Ul\373\357\034tZ,\313/G\'g\317\2015\337\202\264\373\366[\036\265\320X3\r\357X\251\007\205h%\\M5\373\305Rn!\255\024\336\025ucfq\204CF\277\231K\263\356\374FQ\334\235\341\272<G\311\317\273\311\331\036[3u\334\356\231~\253\026\254\220\000\362(\335\220\034~Rw\363\242\016O\006\235+yx\343\215\216\247H\212\337>\350\325\375~\371\215\357\270\215\234o\377\254\344]J\261\034\216\244\315\262w\363V[\311\n\334\267\340\324\347\216\211\257\\\334c\r#\222\373j\352\253\211\370\3013\377\352\270\234\267\216\032\362\252)H\263\227\177\274\256\305n\323\3171\013\226L\375\257qA\343~\207\324K\034\356\334\254\325\013&\036\346\315\033\363L:\262\260w\264\373`\345\021\363\253)\273\246\177\275v\035\221\002\372U\256\177\0379\313\330\257\236y[\337\231\244\356\345\211\'x\242\005}\\5\232\351*\335\205\347\330\344\270p\347\327(\351\221\"j\365\365\243\232l\372\300-f\351\355$\221;\265n\274\361Fr9\2759\3077\367\216\254l\"\371\300\202No\336(\216c\346\270\211\241\356\304}]\3742\310\002\224\321\254\2174\323\037:\223\333\034\351\375$d\253^-\021;=Q\020[\255[\232\252\004\207O\036\346\2673\2527[\274\t\273\372\263\217\016\213\231K\273\346\367\273\3675\357\037S\211\237\207\301\360/|WM9\"\021\224\037\301R_\362\272\346\247\231\274\352\251i\215/\341y\336\\\354\031ltR17\036\3252d\177\r\301\271\013\322~\321Y\203\367\334\352\252\252.\3736\224\2674\323\233!\263\261\222s\002Z\232\'\250U\205\357\203\245\2215w\321\204<\221?\246\354\237\363:\257\036|\036\030\320\243\0317\013\3516\240z\034\332\231\361F\376\257\321\376\256\206\013\372\240\361\270\256c\0276\253-Kj\357\030\360\340\232t\001\226\352\344\375\333\224\344\336\212\371O\035\370\231\374Y\375\351\235\357\331?\372%\031\377\220\275\234\253l_\244\2422\310\3548\274\035\351\037\021\274\222\034U9$\336\036\014\017zB\300p\024\260\000\375\262\3255NxK\261\323\021B\356P\252\276\304\013\035nk\343\370\250y\035\365/e\250\325#\222\n\371\344\'\347*:m\035\035\252bb)\247IOX\203\210\217//N\267s\242\030\316\347|[a\340\327`\036\361\230\325\326\353\365\274\234\3679\227\311\355\244\275\341\330\244\237\305\342\376\036\025\242\215d%.%\312M\246\357Y\352\214\312#\304\227\263\202h\216M/{\245\004\375m%\272u\376\250\203\022\264\314\3174\206\247\245Dte1\336b`\357dN\335B\214\027\341\375\271\211~\373\035\207\030Y\022A\221\302\226\266\354\177\256\330\026\347\204^k0\315n8\031\356\377\372jz{\357\373&Br\277\355\323V\316\201\354SZ}\334j\177\316\017N\024l\000:\257\310T\"\267\215\376\312_u\034\266\343\325\033~\366\331\334\254\305:\260\335Oh\320\223\342t\237\234Y\242E\302\"\nL\034\324\373\021\357\247\310m\371\371\362\355Q2\037\2047\234W\224v\010g\034\202\021\360\346\345\2207\377k\037?\325\037\035E[\231\370\234\347\023 \3746sg%\037\322Z?\250\376\265\362\365@t\316\245\365\216\340\020\356YFl\214\352\221@\361\217\030\354\363c\2471\347k\326<#\021s\2235\373\325\006\353V\205X\263\233\252\007A\363\375\271*0\rLS\033*\336!\354\335\227\375\027\361\275\251\221%Z\255G:\256\353UY#\177+\332\036n\245J\231\354\177\273\315\365\330\246\251\233\263\177\033U\367\372\372\027\311\231\221/hk?\010\220\240c/\335\034h\202\370\304\220ND\362moSq+\226\264\237\020\343\2504s\323\212\345j\231\210<\322vRZ\213\252\257\231\376~y\267\230`\246~-$Z$!)\231\"\002\267\257\3716y\2273#?\300\240\177X$\261\3700\215\272\037\016\252r\273\337\010\276\022!\327\274\336\256\376go\256)\2645o\312:<Ph\313\\\263#/\037\305u_6J\263\034\331\320\203e_\276\253\360\317\276([\177\276A\001\322\267r=\317L\216\006W\213\t\257\314\022\267w\230\214\313\375\300+u\020M\357E\235\017\203\237\257gj-w\273\367\332\231\325\037\337\357Y\231\262!\277\247\342\227-\235\230\230\024o\364v_\201\344x\036\337\253\316\261c\t7,\020.\004dqy\223u\031\005\336\356\266\224\002s^\302\207.n\364=\370\275*\242\002w\260$\213\035$7\313~\246\347\243M\310\261P~\225\26161\336\035\240\\\337\277\205-\362\303\261$\321\332)\310\331;\346\227\306l>=\256\373\215\301W\267\202\330\212\326\'[z\353\345]\035\314_\252\"\013\340K\233<\004:]\266b\3053\260\006\260\300\366^r\254 \023-\372\215\357\006\002\351\272\241\322=\364\372$\027*UI\355Y\271\347\004\021\322.9\212Xa\3578\227\"\n\013]p\'|,\031\t^\362\032\372\23762\200C\201\365\331\336\004\355\367<\376^\323\314\214l\277\025.E\032{k\315\023\"J\362\266q\'\336\357;\353\223N\334\014\232\275 \000\\\013G\17777$c\027\311u\375\326\251\205p\333\221\021w\275\302F\341\320\001$)s\022\372\'\224Gvi\2421\002Nt\361X\\?<V\312K/|\362s\223\221\002\313\201\360\200\322H\022\367e\033\013\336\372\275[8$\003b\373.uUE\350\274\274\376\327Me[\273\252\n\372A\347\324<\303\266-\'RDM/TA\3573\032\267\276\252\265j\376T\273\336\300R\344\221\001\337E;\333wm1\314\255S\237IJ\230\275\016\235\270|;p&\313\036\002\224\205g\035\356\013\236c\032\376\273J\212\034\233sa\334\014\325\034kT\257\312\357\334\013\023>vK\267J\235\3328\004\002\033\005\234\235\336\365\322\360\250Y\271&\344\324&\361\333\231\367\227\311\323z\367|\265K\262=\345\360\263\260\311\255G&\222bm\034\352\234.\025\331\344Q\021\355S\212T\230D\305\314\037\357\333\226\343\351\323v~\334|6%\310\233\337l\363\235\020}\373.\027G\374\334794\235\032\324!\030\371\274G\312\341\270\244\350\274Y\206x|\013\233\341D\311\217\206b\221\376\243<\344[\360\207\367\242=\224\243\r\rbp\357\364\353+\374\345\177P\202}\323\373\324\363\216\336\312v\362\037\366\374\334\023Z<mq\364\254V\251\003\210.2t}x\257\"\010\'\233)5\313&\2557\nD\346sG\301o\244aGO*\214~\353\232a\246\024\345r&D\326|\016;r\367\352\264\222\376\340\343\337@\311\376\237t\203\177\274\375\030\2032\024\307t\352\357\375\000\350B\333&|\352e\217z\316VV\024\005\213\255\214\030/\347\347\337\271+3\307\303W\363\363\'?;\261\255\332/\334\303\267\263\234\'\334\256Z\363\352\265F\231~k\274\232\261\361\257\214\335|\201w\236k;S\204\376\020\\b\313I\271\213<\375\274#\266\016\020\274\203\307_/\360a\240\217\225h\351\327\247~\263-\232\256\027\211\364\322vy\236WNv\031\255\313\271\252vi\241\327\206\246g:z\375gJMs\234_+\035%\t\226\333\354W3@\217\236f\032\346\2139\252{\336\013w=!\270\236\333xjx\364\212K\260R}\346\364GZ[\306\002\250\326h\315\204\276\343\262l\272\310\254_\324\211\245\276d0\211\270\034\317>t\322\346V\317\351d\366\364\216H\232\013v\335SLsxK\212\322Na\316\332\363_\250\354\214\203\262\237\231\254\246\3759a\221\356m\274+\223\332]\330&\027\200;\221=\342\201\321\013Y\000\n\325t\245\306\346\355\301rn\367\276$\374\025\306\332\370\301\353z\275YM\010$H\232\344\007\216\216\201\001J\266\'\242\226/\235rV\347\237\035\034\331,1\330=\3166\313\276\362\277\207v\333\237\272\001\332+?\276\352{TOi?\235\347\023D]v\013\261\230K*%\346\0225^\010\2141\266Nn\242\222\361%\313\234\232\006I\307;\245\374)k:\345\267\365X)\013\231]q]\333\223JC\367\2611\236\331d\371\254\265\337C\314&6\002\216\264\311\375V}#\274\217\215\304n\346D\2756\311h\327\205\312&\017\207O\241p\021\347\253\216\363\235\215\323|\2565J/g3L\3717\2423\263\263\007\253\204=\332;\032\273\314\202G\2169@@i\273\324#\235;\321]\003\242\'M\\\005f\332\361\233MBPj\231\023=\335\'rK\302\'\235\203c\201w\273\017\365\276f\277{$\275\266\372-.\333\264i\324\t\257\316\365\233\2315,\324\271\316\026\000\006|\006\342\367\275w\253\356#\305\367\366h\326\'\233\232\344\372\226`,D\202\320QV\366\330\327\227\312\304\242w\023\n\363\217}N\365\203\245\257\306\366\373\324\253c[\331\321\261o{\336w\302*\'\257#\325\3068\241\364[\306\022wCSD\221W$\271\314\210\244I\321L\375\215\265\377\033K\275Ng\235\247iK\273\261\334!\\\317\322\200N\335\373}\352\253\363\222\275\347\365\335\225\256\352\331\245)=\366\323\270N\367*l\231\235\377\327\355\355$\340\344\tw\304M7}\256\021\276\014\272\325\355[<\2571\313{\367\237l-[\267ba\002\3731\217\354<\255\305\343k\314*u\275\3225/\232#\244\221\266.\367\204s1\217\002\217\336\033\270%e*\3549\346r\355\341\256\333\023\237\333t\221\276\252\312^\360\245W6\256\343>w\022\3660\271\263\2611l\331\373\357v\027{\363\324m\316s|\345\213N\2072\251\363\035\'j{\255\371\\\357E\010<\247T\224\376\316\367u\213\313\344AK\273\354\302\244\227n\276\221\331\314\'e\352\277\006\014p\305\237\231u\264 \337\235iFl-\261C\335\365\272\022r\205\021\020\003\225(\267\324H\326\362h\026\326\322\223\273\370\273\211\004\275<\244o\261\347v|\303=\330^)\254#\371S\222}\2662L\357\253\333\034/\257\372@\277L\271\354\323\223\234U5]\344\307\272\345\036Q\313\337\3748\306\345\212\357\277\324\323vFm\245\372\361\252\005\366\275\356\303~\345\277;\020s\326\364\224\263W\242D\376zs\277wl2\033\365\323N\345\361&.\232\226\355\250\037y\326\261\313\215XU\275\335\313\271\352\235\'\377\035\363\316\371\235\244\352?\331\375\370\232i\273\342\277Q/\356Ay\352\212\372]\274\226k\236\363{[3c\234\351\330b\311|-\257|.}\337O\335}\364j\276t\017=\032\312\257\301`\354\177\357\300@\n!t$\307I\'\220\265\273U\357|\254\375)\236\316\305\212r\025\237\262\036\236\346\375\035\205K5\336g\026\307\274\244N=\257\244\371\340\307b\354n\263x\344Nz>\361\327\327\245\252\354\261\357\237\322\246\304\300\211\213\316\307\004\217\347\360bLs<\362\"j\226Xt;\023\0101\207\315\002\013u0\235\311\237\203\316\005\264pn\306b\374a\273\311v\023\316\255\323\357\315\006| \217n:\035\241\353\037@\364\013e\271/&+F~ab\300\273\230\307u\3266\006\232\272ou6\277\376M\306\177\334KQ\367B?LS\221\035\002L\221>fo=\303\362\347M\340\262g\261\237\347Y\205\200\366\355\rw\352{\223\027s\343^i\356\231(\227kc\341yv.+\335S$\000\226\321k\240\014\311{\273\365\221qH\373\274\257=\314>\244\342\n\373\0175\240\310i\005\371\371\256\256A\010\336\266\274\354; \304\210\233\271\'\271\257wM\347\315J\262\207g\0034\327e;-\021\263\315\350\201e\330O(}\335\214\2321g\345\261\361\221\275h=\255\227\330\333\277\335\177\236\234\340v\357I\211\260kB\214\374\310\303\207\026z\354\247/\017\207\370\344\357/i\202\367\267 \207\251\n\334\270\'/\273\260\350^O\227\373\030\272\331\343\336s\360\t\312X\n\276i\216\270\026p\263\340\016\002ynD?dn\302\344\364\002\\\327C\277KY\\\225\261\330 \277\211\275\271\334rX]\300\337_Kl)@5m_\236\0352\203\255\366H\351/\262Ai\356\355\324\330l\367\270\347C\210\253\366\355>)\200\342\355\365\251\353\376:g.\265$\261\313\226\303\257MS\306\255bR}\016\340\371\3576\274>N\335\331\354~\370f<\264N\314\3211\205\007w\234\271\216v\2573\374M1\234\357\372\277\306\373{\037cN\201h\220\272\247y\2166\363\340vK\274N\\\355\203\272-\202\207w\264TF\357\325\314\276i\302\320i\332\331w0\014\016\340\255\261\332\305\250\234\213\204V&$\261[m\307; t\277\364\232~A\272\'-A\261\n\324\321[/\220\273\316bF\267{m\313\371\216\024K\305\244\021(\361\312\377ws\267\330\354N\355Jn1\2460\010v/\267\033\000\0014\273\355\341\267\231\034\317c\275\361%\311\320\227\275\313\333e\336\035.\372\326\245\227\033\236\322\304\024\271\004\020.(Q\263M\005\314H\027i\216\332\241\004\354Qs\351\270.\201\362\222I\306\247\375\313\374\377\333\333\222I\004_{\216I\331\0225^\225\270\2268\336e\367\027\354\350I\023\315\357\222Kl\271\331\277\265h~\310\212\364\366\373\016\3371glI$O\364\304\221\324\345,\271n\260\354\357{\034\227\005u/\027\271\211&\013N?}_\225\344\271\335\240\2700\000\236\333\330\363\365T\324\322t$\335\333n\373\347\260&wq\322\\G\327\361\256N\027\334\n\345\343\267\320x\223 o\2676/o\262DD\354\222v\356\332\257\242\233\035\3544\207\201\235\227\023x\245M\264\223\310\267\370\304\223\235\211\"c\356\235\211\377^H.n\345\356\303\014\005\213w\276\316\336\230M.}\024\323x\305\364\353\311w L:]\334\024\223\373\334\305s\274b\302I\0331r]\366.;\222_`\336\375h\022\343z\335\357{\230p\274\334G\203r\345\215q\210\340U8|\320&,\005s\001\'y\354\235\357:\340\363\335\366\\sf3\251\014\200}\273\202\235\3004\350s\366\'{;\336\310$\206\2671:\010\210\000>\202b\371\300\273\273\353\260\333\274\361\264\354H\271\213SI?\231\254\237?9\rR\227\216\371\326\331O\3613s8\237\353^0\266U\335\216\203\311\265\253\250\334q\256\345WU\233\325\212\325C\325\377U\317\312v\322z\210\370\225\271\361\033\277\177G\350\253\347\362\276\346\245\265\331\307\261?\3361\205\277~\'\264\243\253\336\237\306j7\373\312\255\376\177\017\317\263\306\375|\377\010x\303\376`,\370\325F\376\364\204\372db\261N\013u_k\377\241\365\366\2268\267;\216\031\2072\244\351\372\313\207:_(\274MV\245\352\316U\221\311D\217\215\010\307\375\037\334\306:/\2766\311,q)\226\177\002\255\323c\337\2767\316\355\2775[\350\005\253\017\356\356\2250\303\320\366\274G\305\374U\277&\007,^\345\357&\250m\362|\224n#>\377\264\323-\375\256\232h\346\307\223x\027\337\3370\311\220 \360\303\330W\366\215\362\254\351Rc\354\177\246/\263^u\231\200p\310\201\206\222\302i\017\221\366\376\276<\276\321\315\235\ti\314o\372\245\261\340\222\357\327\264\325\254\023\343\342\204\252\272\2357W\235\230:#\306\033\304\027\204\245\035\237\347\341\342u\211\3621\262\235uOA13\251VE\370i\351\315\213\233/\277\017\207=\355B\253\347T\232\002x\337\021\362u\373\335\311V\371\371\013\273P\301\341\217\320\275\261\361\312\376{\2732f\347i\322\273\275\373{Z\337\347;tZ\244\257\307\365k\362s\226\337\274\3572\244V\356\317\357{\353\301\236\367\227o6\335\236{2\006>\006{\354\336\276w\312\372\264>\260Z}\r9\235\212\305\271;|~}\304\342o\204\217&v#\203\205;\305\371\361\327cs\215\352$\233\250\307\341\345\373\362\"\315\357\3446\347[}\035\355\026O\316\346\302d|\250c\234\226\311:\037iP}\315\263\267\'!S\223}k!hF\317\261\231\306Y3\027\233\372s\022PW\221\005\363k^\324\236\r4y\260\371\200\0176\314\276w\215\275\366cw\245\3615\344:{S\213\355>\353\312\214\033\373\303M\326\026\371\235\345H\313\027\312\301_\232\303\2366\215w\276\375\025\1770\323\n\002tM\220\236:v\262\324\314g\016\355\337{\337;\215\320D\363\023\340ge\274\202Bv\251\261\274\021\1773\374\254\026V\322O\356\252X\230V\302\241K\256\370\036\340\265\210\337R\324o\245\223&2\347\'\325\225O\352j\306\301\377<Kx)-\025\245__\002L\013\222^\347/-\\\207=\221C\356\013O\010\255\213\022\272\320\200\020\034\216\345f\341\373Y\346K\304\236\327\331\373>uG\276\351y\034G;\324\245+\022\262drS\276\243\361\315\367\360\267\265\007-]vG*;\246\335]t\306\211l\267z~\255*\312\\\371\350\347G\303?]\021\276{\250#\266P\217o\274\240l\372\221\177\246\322-kK\367\270t\346\026<}\005\027A}\230\377js\353\351\037\313P{{\322\376\006\252UM/>\267\020-{\230\312\373J\367{\366\202\330\265\001\241\3637\3571\211\253\244\317\316.\377q\240,\021\226\326U\305\003\363\351\370\314\374\322o\220\211\225\255M\333t\255Z\267\276\230&\260t\346\023\017j\200(\211\034)\003K \262\034\271\230\021\365!\336\316\254\314\205w4\307\317Hx\372\t\354z\336z\017\014\227y+\215bF\356\320\340;\254\2308&\253\323\376\032\371>yR)(\335\023\314F\267\227\244\335\316#\332\352\010\000\224\343\231\367\325\371\371\'\0076\246\254\227\035\326\304\307\334\037w\035k\232O\361\255k\236\270e\253\355\213\256\031h\274\371\355\316\242:\037W\255v\036\023{\271\223{\351\244r\263\014\217\232}\222\356\303H\2717\213\010WX\017\204D\211\000/\210\3444\222+rX\3631c_2{|\246\312\326\367\322\234\311\210\t\364NWa\225\354&\222;|\263\233Q#v\037\347\267\236\010\267)\270\265\334\035YJ#!\000n\200\236\237I\023\"=A\247v\036ba\320/g\356g\227\252`L\231M\374\365I1\323\242%\365\2671\216\r\201\332\250\307>\332\'<\364A\253\355!>\005\212nU\275\365\262i\031\036\335\373~y\351|\036\013\316\032\rVQ\364\260\2433\261F\000\364\205\316\020]\263_\307\264\2253\276\346]\326\242\3673\265J\277$\347_3\023g\313w\377\264E\021K}\336x\376\270\322bx\275\362\373\331+\024e\361\212\344\215\374\270\240\346\"\251\277W9T\221\321\335R\305\232\370\351\326\245\272\374t\324\232\363\256\263A\251;\353Y\"\304{pfq:\233\363W[\3539]3[\036[Z\317\350R\246gk\226\247\355\347\177[\3351\205~Y~V\255\330o\235\334\232\273\377I\253\331\317\020^\305\303\321\350\3259\327\345\324\225Pq;\305\206\226G\001\211.\375g,\321\036G\214j\226l\373\324\351\215\227o|kl{P\241s\310O\352\261\3435W\363\213\3165rZ\233\355\232`\243l\002f\177~G\350\350z\250zF\001\201\333\271\216ej{\237sQjQ\264o\351C\357\275\343\261\347\234-\342\2279S\231\346\tz\245\373xal\361\272i\333\261\326\235L\241\243\340\331\255\315|I\322\2739\213\271)y\317g\303\240h\216\372\234U,\255\025\373\337\275\3170L#p\362\265}\246!k\240\230\3055yI\365To,\265\003Yz\363\022I2\'`\234\224\270RR\227\333\255a\316\003\\\231\331g\315\005\313\321\016\347\264\214b\333\3259#\355\367\355\270\315\206I\214i\256\365\234\220Z\212e \013%\254\246\266\331>\3714\2511n\363\316`3\275\231\375kw\315\300\002z\343\345\363_07\243\261\206.\362\255DI\211\346\265\310\352\004{[W\325\370Dz\211o>*M\342\271\336\340:B\213\314]\365\231\271\220H\202L\366\224\312v2 \007Bi\036\300\265]1v\257~\320k\333\334\323\016\24572]B\266_-\366\237~\252\355\023\254\332\260zLE2\261\206\221\276+\356\242\234of\006\177\237\301\275\207\037H.\334)\215\202~\211\267\206Z\330\305\342\332#\353\244\332:dE\"\331?\010!:C\037\200\276\360[\3560\255,\361U\201S;\364Af\025.P\347\375\223\367\253*f\251Z\204\265\324\\\302\\\222\020\375\255\226S\332\232+\316O9\324\251\341\323\217\275u\227\216\261\240\\\255\354\303g\035;\"\'\302\271T|\035 \300\353\233\002},X\303B\224\234\365w\t\310\356\246\313Z\265K4\312\177\222\367\251\313\256\377(\020\231\326\356\355y\310\237{z\377\311L\376\036\343\021\224\376\n4\327\005\342u>\267\217\351.\234\361\301x\035\235g\227\007\024\230\305\363\237\272,\232L\232\207Jc\302a\262%e\273c\007\025^\002\205(X\031\\D\216t\244\314\310\357\034\353\035%;\332\336\243\221\261\000FV_QX-\254\327e\226wRw\275\314\232\204\207\317\353:,\245\351}V\r\367\205>\344\357=\253\237\213\255\001\376\353\034^\3056\023\341\033\345\266\3734\207CW s\275Y4YK\312J\2251v\300\307c\274\212\027\301^~U\227\340{\325\244\002\304I\322\327\377\246\222\226L\231\036\376\2547\243q]2M\354\t\376\rG<\264\317\346\264\034\357`\203\235\367\035\'\246\351\232;\253\005k\353Fyew+\323q\363\372\377\373\373\353L\006\215oT\371\355\227GK\223\304ur>@\010U5]\027\214\337\337\361\251%\375\013\027\337\225R\373\220\313\351\224\372\313\307Z\r\222L\023e\302\002<L7;\0166\027\253\300\267\324\276\215\203`\007!ep!\016>\276U}\006+\267\002\236\263\265\325.\323u\336\265\276\363\233\2406\277!\357\360\317\3069IA\236\302\223\241\245\236y\353s\033\305\313\365U\345x\350\360\244/T\317\233[I_\315;s^\367\2774\006\315\216\314(\246G\025\347\276\001\347F\367\305L\272\357\300\261\022\021\212\363\230\30113\227\210\243\003\250rs\250\301=8\375\r?\233\224\336>\327\364\356u^lh\341\017\311\205\rm\355\317;z\257\356\324\312\201-)\270\352K\360Hs\262\324\322[\2020\363\t&\224#\370\006\372.\231j\273\312\312\363C\006\214\021\321Z\374\242ot\376\013\214If\346\002\302\217\346\202\327\323\340K\251\243@\271\346\355\205\272L\022\220\033<\221\247$8\252N\361\350\373\3117b?H\375\350\371\372\356\242\334\017\370\226\327\213\315\021\014\314\267W\320j\210\203+5\255\236\327y\263\022}\372\207Wzq\031=\256\245\341\272n\310 \246\277\337\343\246)3\254\t\242\266\270\216+\272*J\305\320\301\362}Sz\r\207H\010\374T\331\214z\344Ep\263I\312\202y\354Q5p\374\t\261\204\3300iVDH\227\352\212\001o=\315\265\200\245}5Y\335\311\222\200<)w\331\366:\027t\036vt\235\033\025\322w\233{>\201\255\332\245\022\213\336$\026\251\200.\311\231\247\207\373|\031%\214\314\177E\036\224zx\244>L\203\026\340\t\215\301u\031\241\257}V \242%\347\274L\261H\313P9\353\260<\372\277E\274!\340N\232 \215/\251\2569i\215\213\263\354|K\236\343\227\271;\317\255E\231\326\n\376T\236}\326\330\370)\310\027\303/V\217\213Y\252\353\205\035.\367\274C\3411;9\327\031\034\234\330e\"Oy\277s\304\022\214\253\243\363|\334\233\00438I/\356I\315M\224\327\317\237?`n\343\247\025x\341\376\350\236d\317g\000\007\271\256\221WN;>\220\225\213G e <\307\334\232\227FZ?\277\217a\034\3474\271\356fJ\315z\360$\200\227\332\300\t,T\354\321$\373\336\317\212J\234\275\315\362>$\265\305w\273\245\361\033\351~\377\324nl\373yuH\263\374\356f}dAeHwZ\243J\277\034\333G\332C\365\322\037\354\355\247b\037R\326\350&L*+\312\306\t\214E\343|VH\3744\337|n\356\360\230\230\352.\n\320Z\276\032\223\261\266\017k\274\347\341c\247\227M/F]\373\245|\232\264o\230\232rTh1=Qg_\2443\300\027\336~^\210\337\333\363\234x\362v\375c@%\360]\273\373\253,?\023\3614\267\256\310\255\367\356~|u\2200\010vR\376\025\332s e{\356v\006\235Ig\211\274MnD@\246\"\210\237\343M\376\031dr\023\275\261c\262N\274\267\256\235x)\026\237\343\373\357r\366\312\372\234\3162\r\335\371sfMN\031\346\345q\321\347\307\311t\223\377\337\213|\345us\2629\351Rs\342\237\270\313\370\321.H\366\364O\262\203Lni\020\355\366\\\344t\325\311VV\035Ic\0172\276\\\215et3\225\356\r\375\014#>_\262\366\310\005\241\2757\234\231\036{\034\266\212oH\205\346\030\023 \236\226\375\371\325\353\331\330[c\215\375\276\353\204>\347\346<\370\353<q9\331\205\005EGW+\305]J\200Uvovs\357s\020\341\245\353\372\014\0351\334\237e\316\313\3630\210\2327W\212W\244\335\225\247>\211\\\371\036=\233\340\321\3352\313ds\247\023\233\357\253z\353\035 =.\310SD %\247\372Z\330\003\331\247<PAY_\207e\t\347\311\203&\227\017\241\250)pZ&\277X\020/\270\333[\313#\255\2737\244\3430z\0328\371g\234\352k\273\201\252{\2701!r\362\305!\237d\202\317\334\005\372<^\030^\002\352R\253s\234\232{\355\364\036\255X\275\266\346D\372\3346\375\024h_\234y\024p\242dz\372\331\316\364?\362s\232\\\301\365\327\\\237\310\247$/<\357\322\247\230\245*\007\266\326x\250\343H\332\363\223\267\326=-\362\001\354\354\257\272 aX\205\360]\332;\034\035=\234\034V\016.\367\027\244\333\247\023\334\371\376Z\014\246\r\272}\235\307e\245v\211f\211O]%<wRsQ\001yj\365\271K\377\361c]-Jc\252E)\233W\204]\256\024w{,\273v\341\375\230\202\242^\362\337\212\233\313\'\333z\257\277>\"T\324y\375~\007d*\272\240\262+\232a\233\304A^?\265v\233\340KE\313\211\363\221<U0_\356\023\224\201\306\355\023-\t\277~$\227e\250\200\031F\3745\256>\014\320\216\017\022\332\274I\3271\317\305G\237\365\276\2657l\375\257;eQ\014\3540RM\361\264\2617;\212S}x\022\263\371\023$Q-\336\025\333\037\254\223;Y\r/\235\335vDv94dE]\376\201\'|\246\246\307\350\253\320YM\2261\377\177yI\370z\201\343\005~\276\362\t\262\336{\\))\310W\356;\262\'\313\313\263\253N\212\274U\021\247\374\337&O\232vv\262\'d6\360\227\234\177u\306\224\325v\220)\313E\236\331\2639\270\006\322\2225\221$\220\37694\337t\213.\357v\262\272P\'\325\032KN.F?\000\271\324\243\377\367\373FW\317?dXr\373\024\2609l\364\231\313D\321)\\\345Z4\275\334\324\340\270\236\262\033\375)\1771\251\267\210\270\204\351\'\277\377\327*\037]#7\335wcaq&Qe&jH\276\254\2162S\231\037\216\243s\254\334\276cp\243\364\217\277S,x:\340\351eoNv5\370^{\020\005\345\277\262~\337\013E\253G\276\327\276u\321$\027\007\3550}\370\240\177\344\305\360vW\377\317\270\337z\335\256\244\324\222\266R\r\350\324\\\226\366\316!\001{\032\374\376\2610\365/\3662\221\206\337\025\276^7c\3647y\307\005\214\t\330\312^\220\317\360\302\302=k=1\000\303\030\246!\003\024i\255\030\237\025\021\373\312_\231dE\302\335U\3235P\2121X\364\257\0107\235t\ry\237\246\\7\024\021\244\311\344\347\030\377\036{\266\334\t\365\321\360\217\372\372\027\3420\025K\375O\226)\2019\257\037\t=\313x25\276C_\236\362|\026\365\223\004\264\343\261\222~O^\2328g\226G\262\203Na\345\335]\t6/n\275t\232\325\365\177y\355p\006\277\306\223\337\352\250\r\216DMnj(\225a\036\347\330\030l\n\321\225t\372\244\227\236\321\351jh\355$\026C\207\361k6g\265yG[\000\300n\303be\256\233UKe\360`\341)\250\276\001\t\203ms\2233\036r\371\323M&\226\343]\331\236\213\221\323\211$\300M\373\302\355tw{zi\212\326\007\0135\001^\376T/\345s\376\217\223\022\273]~\315\036\356\357\223\315^\311\222&\260\001\272\344\320\002\037\037+\373\242<\337\247\335\224v\t\251\353q\357\224\323\233&\245\373\033\354\377\017\366\257I\203 u\204\345\337\034\327\371\202v\343M\000D[jy\361\377O\214\221\r$\260\247\247\253\322ga\243\357\344>\317\327+\340\306\2311\036\302|\246\277&\270\0352c\234LU\006@s\374\352\310\302\232\337;\001n\200]w\320\020oT\226\0025\235\3466%\304\3229\260\266\222\330\221\025w]%%V4\207w\016O\356u\367\303m\352\371\206\363y5<\334E\224\254{Z?\332\345\335\373b\t0,\352{\267\233\216\2017\245\366L7_\205tR{\217\272\246NC\337\346~\344\324\264\343\261\304\r\2352S\227|d`\311\212\225\253A\331_\2764=\263\337\250\347\006\341\3059kUR\304\311\362i\363\347\210\205\350O\177\363{\322\356\024\267[\333\275x2l\276r\013\341c=\333q\352_\253\204\354k%b9\254_1\316\375\226\331\033!\247\301-\343H\020\372\260\034\347\0160\262\332\263\250\367\306\305,\313\353p\232\247\244\3344\357\374\241\242\366\271\007^\355\255\305n\253>\351\334\352I%\351O\316\272]\366]M\370\371\r\256\347\256\216\3361\221\337u\0002\334\335B\231\226\250\030\3166\002.\017\275\231\317\231\260d\255\336\302@\261\265/rF\260\267D\373iv\351\313)m\221}\275\235{9\025\345a\335g\234\206u,\276\035f\2530\217s<\364\322\202a\336\372\237\265\367\313\212\342\244\206Y\216\007kf);^\277k\350X\275\217\306N\322j\236_S\'\327&\272\315\201\264\333\\\363\035;-|M\345Z#\353q\274\356\022nv\340g\272\224uO\366\204\200\377\026,Y\375\"\255s\234\341JP\307`\006\347rM\333\014|\'y\205e\344w<z7\210\237M\"X\360m\311W\337Vw\203\3741)\342\353\'\256ll\336)vL}\347\024\254\271\204\327B\r\214\032}D\335;\254q\026+\215;\201<\254s\242D\201\247\3651\273s\341\253\376$L{z\304\345\366\035\363z1<\377\271\260\222D\214\352I\325V\2414_\315\254\311\366\267.\367\205\347^\367\223\356\233\303BAfX\334\0344\326@\267\222o\225\371&s\020\321\245ga\034\177)\321\355/\270\346u O\2301\334G\303\\\254@\242j\242\364\017:\255pNq\236\335\221\t\002BX\220\332m\000yh\233\260)\311\265\326y\304\303uMd\231\335v\007\314\"\2415j\036\354\035\253N\306\316\013\307O\335\255\311\033\373\367\367eD\362\230\252\323W\365\270\224\233\357\007]\031\213.l\235\237\322co\217\t\321\'x\210\366P,\323\235\302=!\246\343\030u\266K:R\243 \330\177\037\307\362\277\226\017\367l:#\304\377\003\2113\0325\270\262\337;t%\036\250\233b\211\371}W \211\207\244\001\001\355\347\347\322\330y%J\006\030\242M)\307\000F\273\307\367\325\330f\251)\323<\373\001\322F(\237\016\235i\252;\312\366\262\235\"\275\356\"cn\2329b\202\347\2316q\032\322\257\243_\314\333\347\023\'\325,YI0\230R\231Lk\004\217}a\355B=\263\205\001\304\026\031~\260\277x|=\'a\376O\035\223\341d\211\243\303(\347\024\017<\356r\345\327\035^\302M\223\345\005\021\357\336\340\023Wvx\334Uf%\212\376\254\372\250qF d\377\030E\036]\366\202]\240\233\336\316\\\355N\357\270\r\223\320d\327B-\274\277\334\302Hl_t\rk\263\343}\346;V\255#\235\242;\233wT\304\330\256T\360\374\t\2012\006_\026U\266\336\370\233\311\257\223\2715dDF\343Y\034\351&\221\2626\000\240\242h\306\366\367\013\332\360Z\227>s\014\201\350\214\205\336\343\255e \233.\352K\007\314T\177\004\023XO\272h\232cD\303e\265\261\345\251\327\000\276\246dr\363\277|\034\222?Y\205N\027z$\216K]{\312f\262\246$\216\334\233\357f\023\263\357=l\216Ko.c\234\325c\2629>\317\257\305^\321\246\202Dw\324D\323\272\303De_\252\211&\007y\205\305+\221\367\257=\3645\326h\270biv\216jz\317\302\223D<\322AI~\272}\227\025\227yjjDH\357\347s\366k\376l\317\353\221,\'\332b\037\262v\227s_{\324?\034\340\334\023]\"\203\375\216\003\311\312\371\023\030\352`|&\306\360\322\250\007\240Na\002\202\200\035\025\313ljOk w\204|pQN\213\363\220\302\361\244c\004\021\317?\344D4\235\231A\377ZX\006\373\331\210\331\330\334kw\034yH\334\337T\370\250X[W\010v\216d\361\324\252\244\003\275\317\234\356=\3707\262_oc\337\033z\200]\2711\214.>\343\n\305\367\247\3218\262\215!ROk@\234Lh\337q\244\304\221\022&\014#\013\375\353yo\341\361I?\367\377\357s\341\031\304\331\344\027`\002\\\346/\226\032d\377.\245,U\343\275\232\270MV$zk<\3514o\021,.\334\346\334\345\332\260\232a,X\225O\025\311\325g)R\242\033\022@\246L8\361\270Y\'f:\033\\1$\306\237\376Z\217K\225)e=f\220\364\032d\371\321X\300\003\337\257\372g|\200\177\"\007\355xG\340\305sW\312\007\330\037V\305~?\304\036u\210\346V2bo\216\275\253\255Q\013\220o=(\372\002e\2467\236\023\'\350\221\304pY$\037\340\315\234\266\216\306\317\224{\0061\372f\364\251\261\\\317\362m4\311\347\317Y\2155\')\276\332nyYj\305W\332\370\263-\2200\253\277\255&U\177\332\257\3735\324)\177i\203\347\350L\017e\332d\0371Tx\307\214\034\020 \374\350 \333\026\347\323\274\300\367\214\276Y\177\002\217c\255\316p\211\320\020S`X\342wE\021X\252\204\247\327\"\252\272\257;\267O\257\322\n\344\324\3000!\346\210\231\214c\037)\004\373\204\026L\237\007\373\271\364\314f\364\315\344V\335\344\367R\232\225*lj\317^?q\242\326g\272\0329\322_\212\322\362\257/3\275\272J\206l\267\311O\340\313K[\346T\210 \212o=\353\261_\270\0258\274\276\225\233\021\263\374\024#\344\361\376\201m>Nn\241\327I5\320\304\363\220\332\206\277\351\363\360H\354bJT\260\326\257c\270-\036\256\335\275\251\300>\026\035\233cun\024,\034/$\024b]\262\342\362\224\235AH#.\266\000n\326\354\202\037=\277[\377h{O\346\215U\034J?\371\255>\325\344\207\377\242\230\274c\036\341I\206\236Mt\307\375\374~\314i\375\262\346?\301\276\237B\006\030: /0\354K\235_\353i\261\262\216_\273\336w\345\330\376\343Hy\373\246y\177A\250\300\354e\370\361\211\314\371rK_\321\216M,Z\031\007\230\246\263\337\244\027\325\354\177\367R\276\312X\306\373\00211x\301\366(\354\020\007J\342\203\'~\233K\357\270X\345v^$\266y3\354\323\222{\351Q\331\204vY\030\327<\275\260\304wZ \274\370\346\315t\245\331\026\362\222\336\025\345\035\214aA\275\200\023&\023\233\355\024\177\036\024\247v\225^\313o\365P\377Q|?\367)\277\312\036\357(?N\370\317F\r\010\273\335\030(<R\334\275\035>R\302s\203\336\227~\326\254\313\322\020\373[\360\313\003k{\234ki\314\231\\\364\354\201\271dt\377ic\203\252\177\003t\372\352\331\3467\234\\\326DSu\3405\323\212h\313\010\352\246\313@\352X\320\377\'\233K0\265\032\265\370LO\354\237?\021\201\255\217R\267#\215/\242i\361Q\347\234l\267R\323x\221q\000k\023\316.\352\032\274\264\317\231\354%\366N\245.\376\374\371\336\237@\265\351\300\254\207\371q)*\222\377\025\036QD\035\201\356\354\031\002\337\201\233v\227\325\204\246\301\000\0269\337\006_\373\277:\270\334}\237^n\366\363Uq\307\256xn\264\366A\246\317\272\234l%\372_\3259s\336\347\317o\031M\357\213!\247$>!Q\'\353\372K\0040kU?\362\201i\377D\373\362\"v_:$\323\027\0214\335\265\237\203\237\344\303\206Q\233\367`\007\227\253r\307T)\276\r\374\222X\010\355u\r#\223L\202\362z\302\240\320\376CM\303\2078\2140)\334w\215e\251\375\303\346\257\352\203{\207\327\351\243\302\361$v\2207\276\267a\241\305\033\2263\177\3571\216ZU,\302\213\331z\262\032\215\310\233\337\255\231\205\240\363\357\327\325Q\204\304\303\264\321\315GIr \242i\325\355\014s\230\"\267\275\363R\277\375\326\2013\353\221%\241\222\351\355\356|\374\376\211\204Mp\221\'%\212X\261\000\023\3449\237\261\351\035\251m\344\362\242\362\311\212]\313.{<N\214\375\024#\333:\304\317\236d\236b7\017\\J\021\236a\033s>+DK\221\223\372\324\033\013\312\312\273\331\376\212Mr\0353\305Eg\236>\343\276{\234\220\346\331%oU\223\354\335\271\332\311n\276Ix\355\253\030rK\000C\357>\322\356{\320%b8c\261L\322&\236\342\225\376g\372?Ac\025\277\007\001w\2619\336\366+\217v\344o`\226\313\340\013\031\025\210lM\'1\032\272t\332r[\220;\311\276\243\316\275\303k\341 \010\204\343\374yn\241\367\277w\324\306>|\236l\354\227\033=d\005\341\202\267\341bZ\210V\367\261\251[\317\222DD\006\373\000\246E\247\223\275\345\r\006\223&G\333\300\022Y1o@i\033\025\365O\026\252Rt\362\210[\2133!=\260\\~\357\215\316\245\242\\\314\301[\360\203Gcq\021\004\000!\261lLG\265\320h\346K\332\240X\006\353\212&\2565\261\316)\213\033\\\354\375.\363/a<\025\337}\210t\367G\006\212\217(sPy\214\367T\024\250\202\225\252\245\356\302\3007\274M9\314\037H`\271\013\242j\272\340\030\237\265\004\234*\230\341^\234\302%t\267\356^X\314V\204\r\233\212\261\325\204\007\376}\241\r\023\274R%3\376a\2142h~\206\3562\332\237\260\000y\362\307<\037\204\204/4{N\267?j~{\315\333\273CO\355S\341\320\310\224\007\177}<\307\222>\353\312\325\253\336p\264\215;\330\"\326\374\r\365\256#\024\252\356\003x\003\215\t\001\373CS\222\236\341\327(\326\302\234\245\311\367jVu\'\310\"o\316\252\302\210\\^\226\204\376o\227\306h\306\204\230\254\226\336\275\274\310\203za\252\245cuT \214+g\376\362\333k\353@\243\351B\245\'\245\232^YK\261\013\334\3777\262\335\271b\'\340\373CP\265\035\306\177H-\262Z\347Bn\244\223\0170\005\313\3334\303\303]\330z\352w\331\334W\244rG\237\276\262M\237\205\337M\310\317\006\370\202\252_\2710\332\370\300\376\226\213\336)\035\027L\305\362\242*\331\250\254\372\203_\235v\337\256\371\311\235L\276a c\262Hx>V#\205\301\025\341y\313\257\340\246%\367~\265\330w>\324\253~\026w\3402\326-\024{\341K\334\277\217\343\323\037is\204\033\366\367\327\177\327\354O[\r\1772]\002\361\020\033\222\356\254\200Ob\26656\320\3267\222[$\000\301j\32431\232O\007\"\317\367\213\327!\335r\273\235\221\355;i\006en\367r\335\361W\272\027?y\224\210\"y\316\267\237\362\004=v\244\257_\232i\220\315;\236\201u\245\373\276g\323\346\022\206\365\305\373X\335W/L\235\354\225\013[s\005\377\271\237\264\002\362y\346s\255\257\356\021\353\311\256\270\216b\303K\027\205C\357\333a{\304\006^\312]C|\255~\\\211\221\331\320\325^C\t\'q\224\315\007S\345\034\332hJ\001\224\352\333\216\212\363*\0271\247\371\333\274\371%\365\265+\3654\322W\324\004Y\030\304\3578\255r\013\177\265\254\372e\274\304\2130\224\207\232\350\005G\203Y\366\027\363L\363\202\232\t\353\tl\370Z\333\216\241\274=\357\\\237|\312|\316\272\360\362JF\225\357z\211\240r\032\326\036z\362\365\347\2023\275\222dY\253\307\213\313\3401]\'\355\202\245\241\335p[9\233\017\\\273\333\004\2540\002\034`{@\324\377e_\002{\204\307\244%\035^`\357M\211\335t\301\305\037\327\313!AjNI(\307\350\337\204I\243\303)<\017Q\342\315x\212\227(5\027:w+@\373\221\224\320Z\"k\221V\036R\0231\256Qx\267\305\247\312,\242b\272\307\301\202N\024\320x!J\014\031|\352\201\316\'\235\013t\366s\320\222\370D\344\246G\2009\026\260`\021\200\r\334\r\\v\030D\200>8\202!\'(N\300\376\231W*\371\324l\026\305\224tx\377\035\200V\177\032\243\244\217\027\324\263\275\343\374\t\004\000\215\346\024D\271\336\360\267\252k\257\301\202K\256 \257\022\307i\363\254L\356J\304\353kel\342\351\360b\266\231vR\3761\270\030\214\231\035\355\031(\206\023pl\022\335\342\306\303\000!n\031\013 \304&\001vTI4\335\356\300\0009NJ\222\271\346\014$\336\315\177\226w\233d\237\357\301\241<\310\207\351\342Q\006\347\316\204\316\307\273l\374\353\203\244I1\247\363\377\205\277\030\226\257\353:\224VdC?\200\334\374\341x\225\252\022\222\025{/\322\"\247jpv\202I\333\212\"\267\350\272\3450l\026\233\3223\361\014\3126\024\257\351\263\002fcC\363\3770\260\340\317\\\231\347\376D\253\350\304\264{\324\346\024\355\347G\352\204\247`\304\230\342\367\225\366\343t$\177\017\327\236\373\2169\365\235\334u\223\033,\265\357\303\361\tU^4\221\230\244\215j\256h\257\355.\221\260\003\367H\306D\241\330\274\025R\204\331ek\'3?\345\026\221\334\351\324\322\310\255\302O\302\240T\374\352\327\204U\263\363\336\345j\036\316\235V\214\236\213\022W\315\227\200\331V#\322\263\344\360DO\365v\272gJ\276G+6(\023\037~\376s\301\340Q|5\242\004\337\265B=\322\373\340\252\237i\313\212\336\020\034W#]\377$)\314\177M\230\253\257\334\250\375\313Z5\274\221\352,P\213\235I\261(\242c\360\241\022\263\367\234U+\336\\\377\377\334\327\033{\207\3536\245\204\273\350>\"\026\241n\303W\242\007\013\211\302\205n\356}Ns\232;\275\273\377\177\251i\200\377N\2332Lw>p>t\320\266\203^JN\307?5\273\357Uy\267\212D\226lh\037\022\255\356\025\302A\361\363z\367$\353~\006\014\330\360+\223\'O\257#/nN\313wrk\367\211\342\360\337\226\252#\204z\206\255\274e\242_#\267&\373tqf^\365\001KG-\277\027\357%\334<\355\336\346x\215o\356\371\360\336\256p\317\222\230\266\336Nq\311\217q\335Bm\270\317\253\201\376\254\240\376_\372\266\340i\201p[\r|\235\354\370\232\037I\260\276\305sK\277Q\315\305\3326y\336\333s_\371\321\032l[|\342+s^\221\330_\247\356B7\314\312\222\2362\371\356\363\200\014\262\314[\204\377eH\306\'gf\241q\322\356T\374\356\355\325\271S\322\221\304\207\0166\376\322\347\350\253\231\022\310\317i\\#\236\346\337\204N;\014\217\2706\313\010\271\272\212\261\316G,\226!\330\177\367\273\242?\323\357\334E\316qg\262\373\305\277\251g\336\006\007k97E\023\n\310\212\264\240,E\014R\r/\346\300\226\233\033\013a\005>\237\3616g\374\341qa\347Y\206\342\246`\263\025\034\346\344\372\213\260I\353\004\361\025`3\375G\005\344\374\0076S`3\344\201\344\202\264\214OK\317\246\320\254\210\356g\273\336\263x\277t\302\027]\013\315p0\265+2\033\313\312V 7+-?nrzj\306\272\3335\357\006h\310\022K\221\245\273\236\250d\351\206\245,^\025\237ic\036h)\327}\262\323aO\362\356&\306|Z\271\017\274\264\355\344\305\222\236\373\260\351\316\231\023sd\024\036\226\353m\316\260\303\036>=\373\3675\2632u\021n\366\266\033\260\363\333%\037.cy\362\366\213\215\215\217\325\006\236s\3475r;]\200<\037\310\372\371\366;\312?\036O\037\272\351\004\274\273\367\236\347\334\235\025\235a\204\000\031\3113U\367\211\223\350L\3040\353\375\216\0236\262\277J\367\260h\221b\210\257>.q\263g\365\236\222i\r\276\230\325\337\323\246\323H\2310\331\262\013N\263\347\357\337\033\343\240\006\302o\332k!\255Pv\363\234\366Ds\215;\373\372\322\243VW\331\217\365\357\275\341\271\0312\'\334\363\245\247\376$\373\257\362\355\247\366\275ZP\300\244\262RIw{\032\257U\364\317\226\025X\237T\017\206\027\306\033\236\002\307!\247+\347\352o\373\333\336\013~\340{5\221\360~\376\3138\246y\0339wI\357\264\365?\256D\311\223\021S?\001\034.qS\275Z\377\251\251\033\253L\307\'z\365\317H\257H\312\251J\352\252\272?u}\200B\263\014\347+?\236\026$N?\323M\017\375k\346\024\213\227\2131\367^\341\034\324\367>\177VPD\310$\302\2260\301\221kV\354\n\237\332\346\177\226,\311{\363\345g/l\037\305\242\325\354\322\257WC\301CBy\331\320\027P\323\261\246\217\271#\265\327F\t\017!3\320 \034\227l\\\316\300\346\261J\306e1g\004\276)\216\252\"\270\330\210\3546\034yoTM\314|#;\2649\264\324\362\253{\371\262\314X\023\244K\302\030Jj\'\375\272\301\036\325\374\236[\345\216\343\2478\010\203b\273\257\2370R\344G\203\333\356\373&\200\303\326\274\301\030\231\002wq\323\241e\300\n\327{/\343\242yrH\351\216\373\241o=\373}\27424\371\253\243]\255\003\210\027\367\037z\256\334\301\244\363\210>\026\357\220\274\274\000\366\202\362\276\230\240\263\370\331!(\370\366#\306\300se?T\210\357\247N)\271\227\331q5C\240k|\354\202\273\344\372\3254\"\014\351\252\357F\375\320{\212jI=8\356_\"\234\331\207$\307\2560\232\334\316>\220n\247@\3348\233\022bGS~\255O2w$\007\304\362oOO\306\315\214a\003\351\363\335\2569\"E\310\316\001\323O*\314\277\036\220\377\365\216\266\216&\251&\237,\246\3550\341A\013\265s\261\257|jw\204\276\367*\332G;\352\210\245J$\222H\326\341\262c\001\274\357K\037\205\222c{\277\223\314Kb/\273\3577\277}r:\034\362\347\224e\211/\343\247&\364\335\013\313\373\3443\347\'\357\227\"\252\027]\206\255\266\332\347\003\325\376U.\3176\336f\221\2154\354\351W\364\242\324\370\273\353\235\2426uO\236U~Z.\310\022Z\273\270\2327\277Rb+\021\273\344\223\274\033\261>\354 \256[\276\342\223\273\003c\214\250,c\300g\215\017\313\354\211p\3568\253\243\256\303P\245N\373\324\303d\363v\274\366\354\230\225<\364\276\317\363\255m\377\307\2458\346\251\336\222\004\203\356}??\3362\223\346\252g\342\253\270o\320\264L*w\251\365<\244\030:\004\217{<\234\342\327\344(>I\374\034\326\3469\316\353\003-\255\354\r\r`\202\360e-\310\177j\321$\271\316*o\331\334\"! q\262M\031\220\311\346\211\032\030Y:\346\373\346\227vt\222\327\242M\211\363\374\360T\n\021\326f\035\371\242I\324\254\215\233TpE_g\373\346\271\037\375(\034\311\337\266\344\2214\372\347\204;\305\301\002\'\367>\364v\301\no\362\240\240\272\304\036\237\361q\323\344\205R\274p\215\271\375\255\357\356!\264\232\234\266\256\\\321\277\357\342\232\262\013\016\235$\223*\257\272\320\"t\341@\'\326A?k\374\277U\217\356\375\333\332\311-&\'\330\30138f\035\035\353W\320k\273\275u5w\240D\3730\245{$\357\031\371\215\023\216\311\222\nT\340\'.b*\241H\347$\356\026\177\272\000\275\377\n\n\002\250\212h\324\032\006\305\2562j\032\202\3217\370\"O\223\206;\254\355\210}\276\346NN\362\3432\320\276\230\276\217\2118\036\274\360\0166\373\351\017\335\261\007\216\361Xz\'.\362\377B\323\t\356\010\022z\227c\336\036\212F\2170\336\371\252\375\363\346\271u\355Z\272\221\335\232\377\332U79j\222Z\355\360\211X^\234n\0267`MS.\272\303\336\226\364_9\373\264\305\334\264|\240>\272\"5\217~5a\345\250f\217\n\367\355\204\023\005\227*\341v\024E\300\032\345/9\230\354|\251C\357\223\344{\355\316\277\376\376\371\214\006\314\325m\275\356\373\022\362zR\242y\013\266\027\367\215\354\222\312|\252LL\022\216\377jX\207\234\222\001\014mp\263\214u)\377\007\206\211\203\255\337\267\314E\220\005\"<\031M^\335\300{.\212Y\244av\037JWo\204\303\313\276G@\320\217\211\371`eq\244\377\263\372!\022\245\343\233>\223g\003\204\231\023]\212\257\300\326\3465\361\364:#u`\227\341\2630m\326\374\370%\260\233\357\257\200Q\357\356O\272\344Lc\232\335\321\252\001\357xV_\316\273\230\306\023\016z\256:\236x\367\313n\235\367)\364\214\244\360\375\3702|Y^\350\004j\237M\366}#J\021g\375|\202\370yq\024\202P\'2\226R\247]n\351\013\r\022U\273\320\256\260\223]\013O\343\271\332\317\375\337h\217\373\356%\007\213\344\357\315s\233RL\224\253\331\243\337\304\322\237\353\016\230G\3170\016\3420\313$77\341X\274ll\340\246\353\220\373DST\214I\307\257M|\357sk?n\322\257\377e\217\267z\307,\253c\265\177\314\337\236\237l\273!S\357@\204\312\177\253\243\265F\004\004Yy\253\014\373\302\2119I\355-\037\327\213\213B\376#F\033\333\316?_O\177\022\"8\214\321^\330\n\261rJcj\005\366d\037\346\2747\3255\246\213\206|6\2547;%\247\014\274\255s\277\252\311\340\243\236,\215>\031C\244\023u\233\336\244\001$3\332F\3146\363\351{\254\273\256\037\323\360\2158\234\327{\225#\364\222\010L\023\236\341\340N{1\227C[\232\205l\276\023\262y\355@H\360L\3408\326Bw\276\\a\353\355\306\257<:\337\301\313)L\372J\272\366\004\231r47e^\336e>![\026\0300\014,\234o\363\227u\n8\006i\360\370_\341\216\241\335tb\037\250\351S26\231\020L\325\325\312\271\2676i\037\304\342p\276\271\311mjUum@\220i\277\2536g}\021V\177&D\344\232\306\354\273\003q\272n\262\304\212\2602\351\257\325bAK!\373i=S\3270\233\353\033Z\234\317\302\274\303\035\024?\311\2752j\365)\357\037\023\205\274\232\017\274\307^\227\337\to\261#\273\n%sq\232$O\300^d\033\3175\230\3261e\024\311y\326\001\357\336^G)\330\217\243\231\032\311\243\261\013\356g\312D\211\327\016U&\201\376\010q:\210s\220\333j\241!]\350\002\210\241 \216>\317\271xM=\321#e\266\332pK)u\341\000\256w\270\277yS\310\225:\245v\301\246\326\272\324E\207S\024\325%\346V8\254I\3002\014D|\324\263\177v\032\255\223\237]w:\230\036\340\274(\223bI\243\217\253\242j\235\266\264<\254\375*\353\373\370\363.\364\336\035a\230*9\322\017\356G\0131K\217\257\206\255\202\rM,h\214\207\335t\350\017}\347\021\026w\317\237\231\324\301\032&\353\'\331\316\003#-\323\226\200\332\362$\272\213\341\320\301$\363\211\376\377\021b:N\313\r\300L i\035\"&9\370\032\305@\357\3605.\031\363q\216\272\032\362\210\206\244\337m\266wC:\233Q\344\025g}\373\237\377\221<\246\022Y\365Jn)\306\222\277s\374\252\376\224\235\376\327\251\376\226Q\316^\246\261/c\374-\365\310\212 \274\277\315\327?\361\036\271\337<\t\2445D~\2357\".>\324\343\332Q\303\027~n\376\310\333\223\225\354\215\313\"\210\275\301y\376\376\222d\357E|\312\360\216\247\224\305\245os\212n\236u\372k\347\214\302\264\340\324\215\333\243\033v?\253\nc\220}0\262x\376?0\261\354\237\\\353\302.N\376\364@<\014c\273G\320\235\004\232a1\305\237\357\022v\276\276\341.\351\002\362\333IPV(\2235w\273^2?\221\366\312P\304\302\342\223I\367\023\270VL\2311\177t\323\\\246\326\260 \257r\271\201\300\243\215\246\246`wn\350\237]u\316#\345\'\363\375\017\257?\335~\236H\350\274\316\023\327J\007H\210\210%\245H\030w\267\370\266\311\177n\030F\365\352\267\3574\200\324Eb\334\021d\216r\210\316_o\374`+\351l\322\177\222Z\233%\302\326\356\033\332J\305\377VN\206\0210\035\303v\200\244\212\276\337\345N\343\275H\254\246\334\264H?G\252n=\030\312:=\220\347\340\276\323R|\021\314\267\236\316\351\023\373| \240\277\\\341\201?\026\3111\274#\323\034#\262\033u\016V\375$Y<\331\031Z\367\235\232h\333\037\346\257\210!B\226\356\367\274Hp\256\227\265v\275\246\370\023\217\"p\371\037\027-\017\211\352\377\246KIZH\004\202Dj\221\327\035\2016\016\332\3764\033\361\377s\212U#{oDOG\177\021Jp\271|\022+v\347\t\304a;0\254\257>tLnc\313\274\301V&\036\330\035\356\233\254_\264\364{,\375\\\246l\314\363\263\320R\375\350I\312=Us\022\237|\326\223\277V\202\225\371\206)\344T\010\216M\330\215+.\354\340\331\214 \371_G\307\313\332\336\311\017\021\232c\003\267,5\247\323\237c\365\254\344\017\231\332\255\315\237q\233Z\321\214\267\260\000d\344\267:LJ\366\275\370\2029\245!\255y\224\264I\025\375\r\202;\002\351\256+\225s\243\263\373\215\246\302#\031E\224o<Q\347HK\014*lz\026\210q;\226\270\303&\211\207+\337K\206\345\264\2332V\032\216\200p\000_\332\274\373#\304\t\277uw2:\335\314\255\227\325\215\204\254\325u\337\261\263\032c\376\264}\030\010\346u4/\032:\235\232\3061OB\260\237\343\263zO\224\364\364t\277\343\267\315n\216\324\231\365v\215![\320\r\270\367G\007\276\223LK\346V\272\266I\370\374Re&)\312v\031\253\345`\3242\264_\376\232\013\325W\212ko\263b\372\331\253\020\327\345PK\364,y\225u\314\371\336?,\343kq\235\3155\325l\003\323U\314\013\330\003\315r:\270d\037\273\034\023\275&b\272\267(\217\022\366\277\375\217\337\252VyM\'\307w\\-1i\333\246\261\217\203\322D~!:\367\3044\261\314\014\306\232\276E\225mt\311\306\263\344qA\203\232\345\277\240\272\204<J[y\213\360\361\311\217\322\355\273\234n\215M\007\3539\2739\245\025\355]K\366[\336c\n\315\2625;\304[N]\357\343\247|\037\204\245^\232\317\365\031\2541\263o\223I\310\312\3051\007\216\367\311\201Mf\177\233\307g\033\336{T\320\324\345B\311m/\203\237\233\264U[\036\030\274\205$Tj\253\370\307\014hD\263`\273\023\335\220\242\305\021I\254\371l\372\366A\010Wcc\177\230#\364\327\274\277\346Nd\211\200_~ \317\350\346u\332\356.\357C\346G\266\361\357\204c\022/\317\336\347\376\303\325\033\232\353\375[\336M\261\227\352\364\243?y\307_w}\005yx\"\376\263m0\265\223\253\025\300\226\317\315\251\217\n[\2619\226F_\267\025Q\231\227\275\325-\333+\264\025\262\323\362\367x#\305\331|\013\307\255\3019\274;\227{\261\345\267]\250\377l\001^zA}5\206\373\177\202\370\177#\255\357\034\037\\\244\373\243w\351\252TZ\334\347\024oG\"\305L6\344\255\312\251\017\314\367\336\217\215vmD\246\244\255\360\266R0\327l\265\003>\355Y\247K\250\277\375\224\322\261\271\243\rE\366Q|\374\352\261TW\2715\014\2373\3367?\324\214\222\345\r\356\010\311\364\367\346\335\300I\273\330\323\372\372\276X8{\r^\0249\377\350a\221\316#\232\253i\356\0244\273D(\375\273\344\265\033\263\034MC\271\334\355\337;\';\215\331mCw\0273\222s\347#\370\305\300\333\320\025\001\323\016\265\0266M\017\261\252\233\372\254{e\254\251v\370\310\302a\356\246w7w\313\307\356C\263@}|\307\024\255\254P\0079\322\372\'\\p\245\254K\235g\204u\276\367\301Z\323x\344\306%\253\320\316\335k\373\256\nR\365k\256\001.]\227\233\236u-\367\nC\311\'<\306\326\242\257\331\227-\231\327\257\212\350_U\264\260\363\377\277{\215O\334v%\325\006C\216\222J\214\303\223\251\206z\311\035a\313\307\236\027\336N^\0379QI\332W\3566\020G\334\024\227\333,\037\333\306O\275\315Z2]g\217\343.i\221^\252\326v\201\302\342\360\2272Ql\273\031(\307`\227\210]\324-\217\222M]=\274\340\013\032-\303\336\313\371e\202\362.\362\266M\250t\373h\375\300\353#kV\346mkQ\033\337{1x]~\032\304\236\203q\2635\250\366\227\313)I\244\236z\027\355f\013Z]\316\304\262V\316w\203\237\364\177\313\032\026\206\266\254wS\375\233\251}K\334g#\376R\357\377\257\246ur\'\2117\260\004\335\226\246?\246=\334\212\315\330\314t9\235\013\271\214\356\334\356En\371\354p+2\037\226\243\342\316a~)DNX\375.\344\035\231\305\211y\347\002\006(\2615\347\341u\301\017\341\321\274\335\360{\233\327\005V\\\347\013\311\232\337\361\317:\227\211=\252E:\202\247\356\302 \201\261\255\226\\r)\344N\324\254\007e\367\177\236\335\363\356L\347mx2\207jP\350=\345\370u\037\037\317\370\210Ebpj\034\273\354\231\017\331j\377\177|\020\022|\202\035k\'e\347%\341\264\314\245\267\352\031>\226\332\350~/\317\305l\030\201f\337\206\372\222\340\227i\030\257\345~\347\202-OA\010[5\204\335\340\273d\344L\306\266\222b\277\375\027\276\254\343\366I\005\344[\350t\264\223K\233IyK\343\033\001\352\374Dr\006ez/3Tsu\371\372\344\020cKR\264\356\354\307\324\355\335\220\216\232~m\255\3426. \317\347\245-X[*T\275\"\227\031O\373~Gt3~\311\016\t\326\265\177\373\250\313\336h\232K\222f\304\2073\360\322w\016\007\271\355\373\315~\353\250c\"\314\257l\r\271\017{\335\317\2728\200\336s\265\200\026\376\343\023G\004\362\252\330\217\217\230\341Os\271\346\364\014}\311\364G\323a\217\324\302\th\364\371\371\232b\224\216D\017K\251\335\334\207\026.\316G\272\321\231\205\225W+\230\263\202\036j|\347Z,\257\000\205C\244\235\001\272\322\3572\013\320c\241q\206H\256!\361t\033?\\m0h\177\213.\314\252T\367\226Z\325\253T\274\363\343\247\254\237t_@\323i\203\023\271\253\226\035n\327\215\321\217\375[w\213\013\311z\277?\377\330\377o\312\351\274\222\',\375\355\343z\352\346\240\253f\377x\263\367\347]\332\224\237\'\345\020\264\005\354Y%\207.\327\010\325\033\337\3634\'\017\364z\334\316\367\376N\336\026\036\3000\236\264\342\361\354U\352\226\367\265~P)cLF\323q\023\227.\210V<\377~\334\334\302]y\376\240fV\337\025\304\023\336\212\027\221\234\031\362\231\200\211\002\316s*\0265\340\303H?\377\356\211\370\331]\221v\034-oG(\006\233\372G\274V|\177\233\224\265\264\024\321\r|\322nJ\354\360\013\030\237~\2651\315\337U\352\000\362i\227\024\320\274\372\350\251\211RnX\023Y&\235\230\177h|\334\300\032|Z\370V:\234\377\377 \316\3239\363\215\337\345\rI\247\346\311\253\223.\373\000\347\356\275\217\232\351\035\335u\007\017\321D\304\263\354A\240\352\346\254\311\001\023M\335^\016\354\233\274\365g~\341+w2\370\211\326^`/\236\221LGO\375\314\231\335\205\364\252\227z\366Y\206&\256\370\260\303\311(5;\354\3652s\300\240\335\301\021\202\373\273\343}\254\375\"\017\036Jb\276@\347x\330\330\313?\260W{\343\353\313\321\304\311\265\327zb[\257\250/\341X\335\246\271lc^Iv\377\334\344\276_\347 \3763r\2716\354bm\351\357/\327\"\002\312jo{v\021\341\376C\362\334\261\004\227y\246=\3656\361\321y~o5{\226\333an\325\337y\357\372\265\002\3057\002\370\"E\244e\265x\333d\220W`\254\027z}hH\3418\203\tX\037\373\315f\276;$.;\301i\266\3702\375\235\005\367\350\316\277-\362\357\231\324g\255\231?\353I\262\244R[\275\030\007\231\261\374t\013sS1\321\333On\240\t]\254Y*\326\026.\023\017\360\304\350\3315\376O\235\300.\0140\300\377;=no\353\306\2775\013\301\326-\345\013\014=\235\216\273[b\362\372\212(Wi\367\341\241\"sL\356\337\274\241\253f\253\037\241\35379i\377\227\036\025\273\032\010\301\233N\363+v\212\021\217\340\352\033\347\333\001\267=t\0069\256\373\324\2472\315\216r@\274an\2437\207\205\311\315\357\233\257\267;V<t\255\370&\233jI\200\377\205@\300\3777\370!\252\352qW\251\307V\253b\032Y\247\324\342\270/\343~\006\367\377k\254T!\252Z\237wds\224\254\310\375\375\272\313\274\242\rf0Z\342\330\243\273\357\242\335\017\205\375[\365n\352n\267\332\243\277\030\354~\303\022\323+\325\233\035\270W?\004\006L\010\334y\364<\272Nxz\320n\261\031;\347\211\306\273\005\205\367\315\257k\217.\253\241V\3713\027\244\332p\232\234\240\315/D\257\025UO\233\267\307\267\226\357\300\361y\330:\325\210\364\203\224\263\232.\253\036\277\354\334\355\017\360\271{m7\202\213X&2j\371\032\343?\265\360\371\206\331\341p40OL\255>\005\255\317\314\341\217@\276\314uk$i\031\323\263\277^\201\332\203[\356U1V\242\337\000\322[\360?X3\374\321\024e\260\342\360rx6\250\r\251\022\255\373\322\2105r\245\344\313,{\246\035\317\200\353\255Z\266\364\302T\276\335\335n\225X-Uq\352z$\275Ba\016 S\214\317=f1\202\377\253\201\215\252\354\360mi\321,\327\353\2260\3440\271\"\353\334\342\261\312\177x\303\3724B\334\020j\232\324\332\227.\r,P\333\3266}e\277x\1770Ym\204\237\343)\006c}\255\035\001qf\210f\001\021\020\326\255\367=Oz\264u\214\023c\213q\235f\332\375Mf8\014\252\027<O\255\"\272^5\324\252\221\2370K\370\301\245\251C4ioHTt(\351\312Jf\265\212.K\312?\201\222\1777\030\3703\267E\327\261\3304\335\230\3574\001\363\235\006\007u\376\236c\245\0320d}\'~\241\250\216\335\2504\r\356\333zc5\267CA\260\205\273\021\307\035\375\351\376\310\344\217^\353\246c\327\345\226\245\313r8X\322\364\321VVz#\305M\247n\363/u\277p\002\t.\255\236\356\363\305\251\037o\"=\235\363\303\251\336^\253X\265\274]\333\257\234\273\304\031\001\016Dw\245\354\217\246\375E\217\247\324\356\321\316H\360\003\332\204\003=\311\035\256\231\363hp\367\337W{v1\320j`\262G+\333|4\262H\276\271;\276\266k\027\005LI,\246\333\335\320\376U#\365\311\256\244\313c\361\270\345\311l\302\240\357WI\273\017?k\214\000\274\300\354\203g\300\272]\357w\3339\365d`\231[\014\014,\023e\033\013\201\352{\353@\363\313\375|\367V@\235\316i\264\326e\264\302+?\304|\353\275\314\244q\200\010"
      }
    }
  }
}
node {
  name: "Assign_25"
  op: "Assign"
  input: "conv6/index"
  input: "Assign_25/value"
  attr {
    key: "T"
    value {
      type: DT_INT8
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/index"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_26/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 246
          }
          dim {
            size: 3
          }
        }
        tensor_content: "\253\213A;|~\001\272>\027\233:\003e\226\276\212\326\321\276\320\035\264\276A\034m>\n\205\247>p\324\256>\322\302\340\276?\002p=#\373\366<\245T\321>\026\256\334=\035\006\303<\001W\210<\252\265E\276r\253\253\276]\235H\276\211\013\031>\240g\217\276z\265\200\276R\326\206\276\200\331\223<\340\207\377\275.\342M>\315\341\205>\347\310\026>\016\032\214>\315\323\350\275f:\274\275\342\210\333\275\037\203\206>3\013,>\264\347O=\236%j>\203\244X>P\204\330<c\370w\276\376\336\204\276\317\025\001\276\224/\200\276\357\237\343;Ha\204\276t\330\237\275\301\024\241\275\372H\247>\2009R=\235\361\200>91\226>\035!\307=\365\341V\276\336\330J=1\r\321=\346\017H>\341\357\344\275\330\363\250\273\241f\203\275q\344\355\274\272\303S\276\003\252B>\317\227\326=7\322(<\210=\210\276\256\343[=T\255\237>Ry\272\276H\336\241\2760\213\027\2768k\022\276\302\030\235\276\002j\203\276\032\305\237\276fT\331\275\340g>>H\203A\275\276\202:>\263\360\260\275\3136\202=?}U>0\021%>\234\007L\276\375\353\230\275\rP_\275\\\232\275\275\251\336$\276\272\026\240={\231\302=\2439\363\2755\246$\276\343\365=\275 \362L=\240\3338>\360\367\357<2B\027>\246*\250>\207)\204\276r\356\212=8\227\010\276\355\334\277=\202b\315=9\007\022\276\255q\201=R\232\240\275;\203)>\3776\242=\252E\232\274/\302\254\276tj\205>\316\367@>\276\324x>\332 \237>\350\365$>\242~\307\275v2\364\275+\0013\276\247\242!\276\262\360\265\276\264@-\276\251\304\236\275;V\273\275\225\032+>\326W\214=<\352\271=\306\177V\276:\250[=\316\033)\276\016\220\237\276\353^\322\275\204\000\202>pGL<8\214\277\275\211H\263=!\013\221>\3166\265>\254\031\260\276\344\266c\275\3232\235<\360Lf>\003\362\370\273\271\370\324=*N\243=\241\005\205=,\212\330=m\344\364=\022^\261>\341\311y=e\223\001\276\317\355\203=\3203\021\2752\362\256\276\t\r\217\276\270(\223\276&\346\340\275m\260f\276\250\035\312\276\207\266\250\273\343\315\002>\001]w\276\2521x=(K?>I\376\271;1r\272>\017TU>\347\265\346=V\266.\2756\202\003\276jOH\275\2227\003\276Rw\007\2766\344\224\276\006GH\2768[7\276#\2069>y\227\205\276\217\357h\276\024y!\276\244<\371=\242\304\300\273\271\310\177\275\357P[\276;\301\254\275pQ\272=ne@>\277\3059>d\314\367=\033\377L\273\241\261[\276_\244N\276\raG\276\261D\036\275\314\3408\276\242\301\302\275\351S\263\274\274\371\256=(\324\242=\230\326\211\273<\244W\276\343\335\037\276\331\274E=\254\347v>].\253\276$\324|\275}i3\276\360\322\000\2735\020\304\274\221\237\217>\253N&\275\321\206\210=\035\246\005\276\351\001[\275\204\366\221>\335\300\242>\311\363\031>\323+\217>\337Z}>S\276\016\276\322^N\276\035\347 \275Q\354\260=]\031\243\275!\340>=a\027\217>\\c\314=>?\270=J\326\323=\245\036\007\276^\272\217\276\007\030\230<E`\024\275\260\343\345\275\216\233W\276.\275Z\275A\214[>\035P\374=\204\255$>\224\035\200>\021m}>5R\201>\204yv\27566\217\276\365\334D=G\022\273\274c\247:\276l\242!>\035X\014>Q^\257\276+\262)=\002\002\265=\227\267\316\275<]\363\274\372\003\313\275\020\024\000=`<\217>\343\203x>n<\314=\207a\025\276\305\223U\275$B\211\276x\227\033\276\265\311-\274\225S}\274?\332\030>\360\340`>\247\'o\276^\237\200\276n[\223\2761\316r=\361Zv=,\270`>\202O\023\275%\025\221\275\201\242\233\276\307N\024=\017w\271=\232\311I\275\353W\272\274\n^\240=qI\223=K\007\225>i\335K>\332\221\020=a\327A>\010Y\215\275\250\300\"\276S&B>|\345\001>G\210\330\275\226*\224\275\032\020\236=\334B\231><\021\330\274\023\202\366\275_t#\276\020\253H\276j\250G\276\360\204\231=\027Y\222\274\324\265\266\275g\222\201=\236\3444\274\200\031o>t0\207=\221q\330\275V\327\206\276\"{\202=\006\273\r>\213\231=<\0132 =\337] >#\225d>\327\t\235<\225\013\225\276\377H\276\276\tV\203\276\\va\276\"\357\t\276\231\201\020\276P\023z\276z\363\247\276\246\002*\276\321 j\274\273\302N\276\323*\335<\001\223\357\275{9\270\275\231}\020<\205\307\301\275@gJ\276\241\1770>\005&4<+\277\376\273\264\244\353=o/\006\276J\277\256\275.\315%>\323\312\216\276\364B\347=\213\246X=5\335\250>\035\340\240=J\2138\275X\257:\276\270`\2249X\233\201<88\215\275w\276p\276\007\337\213\276\237q\255=\twi\276\022W\207\276\001O\240\276\221\353\031\276\225\237\311=B\257\235<\331`\213\2762#\311\276\224\035\361\274\r\341\260\276\033/\317\275F\200&>\035\232@\276\340\r&\276j\214\371\275\335\004\214=ea\201=\025\241!\275q\3356\275\305EA>\035\324<\276\336\'O\2761Eb\276\273#\235\275\301\267\204\276I\263%\276\nx\331={:C>V\323(\276\327\'\003>i\317\347=\213I.>\307^<>4\251\233=\212>\312=\315d\347=\244H\207>4f\323=y{;\275eg\372=\276\034\203\274\020\300\221\276C\370\201\2763\200\212\275\310v\'>+{\350<\000C\'\276\357\r\334=\344r\031>[\037\233=\373\362\204>(\230\272=\315\234\033\276\302\203\203\275\327l\213\276\027\304\301\274\246CC\276\221\210a<\265`\227\275\217\355\027\276\034\372E;&\263\036>\202!\241\275*vB>=\210\036>\253\270\313<\210@\023>\236\364\343=\332\301-<\002H\370\275Q0w\276\201\347u=#\206\211\275w\241\033\275\241\241[\275C\3040>\355\020\263>\025\r]\276\333\223\246\276\323\362\252\276Pt\364<\257\246*\276^\021\336\275\306\251\211\276\241\362\022\275\305C\300\275m\2372>\231\271\342\275\200z\245=\036\205\202>\247\361m>\351\217*>(i\212\276_W5=\265\257e>\301\303\003\276R\262\372\275\353e\235\275X\037\376=Y\332\277=\375\'Q\275e\022\264\275\374\236\023\274p\366\023\274A3\000\275\321\216\371\275\003\267\031>\257Q\316=\n\224^\276\341\342\340\275\336\247[\276\300\037N\276G\312\246\275\005\323\000\276\315\251\301\275h\264Z\2764fp\275\274N\203=\311Aa\276\025\367<>\375\350\262\275\342hx\276\nx\356\275\265\031\262\276\354\367&\276E\270\215>\304\302\243>\244\3142>\273\272\207\275p\346I\276\325\037\277\275\255\223k>f\344\345=\262p#>P\007\217=\321Ki=\364M\251<[\t!=\276\226\n\276\231\353\240;\210\037\213\276\351\214\023\275\354\251`=6|;\276\032\354\016\276N/c<\347\266\301\276\374d\250\276w\246m\276\240\316!=\210h\033=\020\335\026\276\004\271\020>pe\241\274\"\265\354=\241\234\004\2766\344\333=xsB>\253X\213;Nd\225\276\356b2\276\311\367\366\275\210]\t>\362\305\240\275+\213\201>\272\335a=\243\017\352\273\327.\r\276\254\225R\275\353V\220\276\230\222%>\213\203d>\356@>>\236\316.\275\304q#\276\3336\224\276d\345\265\276\272\324u\276\032\304\362\274$ZI>\276@\216\274\026\034\036\274\276\265\230\276\202\361`\276\032pj\276\312N\013\275\005X(<n\361\224\275\313xR>6T1>gX,\275\006\234\035>\337b\270\275\302\220\222\275\t\204E\2760|\211\276F\2224\276\205\240\026>j&\\>2\007\233>\016j,\276\210\006\347=3\374\214<\375\265=>r\3122=\220)p\275\352c\022\276\274\367\216\276\202g\350\274\207\036\361=\031\313\256==V\216>~\014\030=\224\254\220\275N$@\276n,x\276I\320%\276 \223\242\276r\001\241\276\202+\305\275\372\203%\275\252\203\366<\275\300?>\337\275\242\275\267[\026\276\021\313q\276\243\264\363\275\247\203z>\212K0>\030\254\013\276\303\226\316=\264\300\351\274\331\264\017\2760y\203>0y\342=\262\367x\275n\034+=+\205\221>\231\307*=i\014@=[\234b<\nSz\275\273\330\341=+|\204>T\213D\275:\253I>*p\033>\335\346a>\010u\327<\352\014\367=\3444\274<P\224\023\276r\237\241\2755`\r\276\361\305F=\2064\211=\352\324]\276\37003=\016u\231>+\363.>\323\274\010<O\323\021\275\240\017\202\276n2P\275c\263\177\276\337r\260\276\370\334\233\276:\024\230\276\255\023K\276C\337\234\275-@\317=\341P\n>\277\010\033\275N\376\203\275\251\t%\274\0351\261=E\247\364<\217\234\215\276\033\247{=\022\000\010>\362\370I>z\216\224\276*;#\276\326\373\026\276\246@\226=kG\320\273|j\231=\036Lc>\372\247#>}\005F=\332\372\310<\371\277\250=ET\034>\325\231\227=\037\277\022\276;\216\250=\202~\213\275\347\321d>\346Ba>\315\2612\275\206r\234\275Q\325\315\275\242\227N\274\'\026W=R\250\207>\002\233\'=\035}<>\013Q\200>h\027\201\275r\017\t\276g\213e\276\223\277v\276\211j\r\276\026\246\007>Y-\324\275\220\260\006=\3127\023\276\206\334b\275\'\216Z=}\354\027<N\027\230\276_\316$\275\207X#>\223\'\356\275\244\004\277\275\006\333\264=j\031\266\275\256\017U\276\363\002\244<xt\017>\270\001%=\251\242&>\"7T>5k\216>q\213\035\276\207\343\201=A1\201\276\351\333>\276\245\271\032\276l\277\\\276`/\221\276@U\022\276a\242~\275\227\232t>\261N\240\276\200)\236\276%\223\375\274\313{#=\363\033g\274\323\177@>/\361)\2763\341\374\274^\035\277=h:\021>\227\211$>!;G\274\364@f\274X(a>`z\035>\235\341m=\316\'9\276\302\323\\\276\243e\302=c\225^\275\345I\204\2762\353\353\275\276\247=\276= l\276&_\r\275\025\223\267;\336\206{=\326\372I\276\371`\220\275;\223\207<\255\357\202>\226PD>*\212\326=+\303\243=\006\2720\274\326\301\217;\207\033\316=Hyp>\243\354_>\035\203\035>\354\346\202\275\336Q\007=%\343Q>*\"\221>5p\226>"
      }
    }
  }
}
node {
  name: "Assign_26"
  op: "Assign"
  input: "conv6/centers"
  input: "Assign_26/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/centers"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_27/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_27"
  op: "Assign"
  input: "conv6/shape"
  input: "Assign_27/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/shape"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_28/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 246
          }
        }
        tensor_content: "\014\026\000\000\002\000\000\000\001\000\000\000\001\000\000\000\002\000\000\000\005\000\000\000\001\000\000\000\007\000\000\000\002\000\000\000\001\000\000\000\001\000\000\000\006\000\000\000\006\000\000\000\n\000\000\000\013\000\000\000\001\000\000\000\006\000\000\000\017\000\000\000\003\000\000\000t\000\000\000\224\000\000\000\001\000\000\000\002\000\000\000\025\000\000\000\002\000\000\000\006\000\000\0006\000\000\000\024\001\000\000C\000\000\000C\000\000\000\232\000\000\000\005\000\000\000\002\000\000\0000\000\000\000\r\000\000\000\003\000\000\000\007\000\000\000\003\000\000\000\267\001\000\000\003\000\000\000\026\000\000\000\001\000\000\000\010\000\000\000\013\000\000\000\003\000\000\000\004\000\000\000\006\000\000\000\357\003\000\000\002\000\000\000T\000\000\000\004\000\000\000\002\000\000\000\001\000\000\000!\000\000\000\002\000\000\000$\004\000\000\024\000\000\000\002\000\000\000?\000\000\000\206\001\000\000+\000\000\000P\000\000\0008\000\000\000\020\000\000\000\241\002\000\000\033\000\000\000\017\000\000\000\003\000\000\000\002\000\000\0004\000\000\000\001\000\000\000\001\000\000\000\230\000\000\000\225\000\000\000\010\000\000\000\006\000\000\000\'\005\000\000\003\000\000\000\027\000\000\000\002\000\000\000\004\000\000\000\005\000\000\000\001\000\000\000\277\003\000\000\002\000\000\000.\000\000\000?\000\000\000%\000\000\000\032\000\000\000\'\000\000\000\006\000\000\000\026\002\000\000\372\004\000\000\010\000\000\000\017\000\000\000\021\000\000\000\006\000\000\000Y\002\000\000\024\000\000\000\230\002\000\000\007\000\000\000\002\000\000\000>\001\000\000\014\000\000\000\005\000\000\000\276\000\000\000\007\000\000\000\024\000\000\000\252\004\000\000\003\000\000\000\274\002\000\000\037\000\000\000\001\000\000\000\002\000\000\000\236\000\000\000\026\000\000\000\003\000\000\000\t\000\000\000\001\000\000\000\001\000\000\000\004\000\000\000\235\000\000\0000\000\000\000~\000\000\000#\000\000\000\003\000\000\000\270\000\000\000\262\000\000\000\013\000\000\000Y\000\000\000\013\000\000\000&\000\000\000\327\001\000\000\002\000\000\000\003\000\000\0002\000\000\000L\000\000\000\010\000\000\000\023\001\000\0009\000\000\000O\005\000\000\002\000\000\000\003\000\000\000\256\000\000\000\r\000\000\000\003\000\000\000\016\000\000\000\003\000\000\000\341\004\000\000F\001\000\000\314\007\000\000\027\000\000\000\006\000\000\000\234\000\000\000i\000\000\000\006\000\000\000\002\000\000\000\001\000\000\000\003\000\000\000\364\000\000\000\020\000\000\000\025\n\000\000\214\000\000\000\010\000\000\000\310\000\000\000\003\000\000\000\220\000\000\000$\000\000\000\017\000\000\000\005\000\000\000\006\000\000\000\n\000\000\000\002\000\000\000\"\000\000\000\025\000\000\000\005\000\000\000\037\000\000\000\r\000\000\000*\010\000\000\014\000\000\000/\000\000\0003\000\000\000\006\000\000\000\t\000\000\000E\000\000\000\007\000\000\000\005\000\000\000\241\000\000\000\006\000\000\000\t\000\000\000\010\000\000\000`\000\000\000\001\000\000\000\307\000\000\000\007\000\000\000\004\000\000\0008\007\000\000\003\000\000\000\024\000\000\000$\002\000\000\232\001\000\000\004\000\000\000\002\000\000\000\025\000\000\000\002\000\000\000\024\000\000\000\204\000\000\000,\016\000\000\001\000\000\000Z\000\000\000\023\000\000\000\313\003\000\000\'\000\000\000L\001\000\000\005\000\000\000\001\000\000\000\035\010\000\000\007\000\000\000\013\000\000\000z\000\000\000\005\000\000\000.\000\000\000\250\004\000\000\003\000\000\000\246\000\000\000.\000\000\0007\000\000\000\001\000\000\000\002\000\000\000\025\000\000\000\003\000\000\000\003\000\000\000$\000\000\000o\000\000\000A\000\000\000\007\000\000\000\024\000\000\000\021\000\000\000[\000\000\000\335\010\000\000\227\000\000\000\021\000\000\000`\005\000\000\n\000\000\000\027\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Assign_28"
  op: "Assign"
  input: "conv6/freq"
  input: "Assign_28/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/freq"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_29/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        tensor_content: "A\312Y\276\365\335\201\276\356\335\226\275\315\244]\276\026\245\376\275\207H\r\275\242\344U\276\250\211\003>N[\343\274\363\261\260=ST\210\275T\303#\276\026\202\234\275$\376\363=\233D\320\275\316\032\035\276\334\231.\276\373rt\275m\032\302<!\377\226>\014\255\211=K\311\007\276\233G\202\275\210\227\r=\307\223c=\246\256\361\275\276\373\236=\226\000K\274\2219\241=\260\350\034\2762\366\016=\355mM\276\017\356\315\275>\004\013>\376\277{\2754L\021\276\020s\251\2720}\375\274\332\013\000\275\377\3659\276\276\034m\275\304D\325=\367K\330=\231\260\267=\230g\252<V\365\305=u\377i>\214H\246\275\251\331\373=\377\001\322=\036s\r>\354\246\327<\002Z\233=s(H>\222\215\235<\022\347?;A@\n>|E\222>\2515\r\276/q2=\341\231\217\275\337k\341<\016^\307\275-\017\225\2759\243\230\273\255\325\322\275\212\367\307=\252q\324=\354\361\267=v\254\241=\204\355\270\2759a\344\274.D\270=\373\t7=\364\314\n\276W\022\004\275$\207\026<a\243\002\276\005{{\276_`;\276\212\016\037\276\336H\377\2751&!\275\263_\361=\260\331\351=\306x\265\275@)\013\275n\367\215\273z\246\021>\252j\226\275\210>\256\275\023SA>\344\027\227\275f%\211\275\373{\336<:\242\246=\360\300H=^T\350=\232\362\250\274\376I\n>\257\241d>(70>\332\354\254\273\n\234$>\222\200_\276;*\250\275;\234;<\326P\256\275\337<\032>\367Kp\274 \311\211=\232\347\341=\335\026=\276\346\353\271=\026\313\020>* \220\275R\326?\276\337\215\300=W\342\247=\315\024!\276\010c\000\2760\304g<\324\315\266=uG\027\276\305\314\355\274D\332\254\275\361\251d\274\2661_="
      }
    }
  }
}
node {
  name: "Assign_29"
  op: "Assign"
  input: "conv6/biases"
  input: "Assign_29/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv6/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_30/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
          dim {
            size: 10
          }
        }
        tensor_content: "Cv\370=\216g\236\275`\302/\276\252\022i\274yo\206\274\366\315\341;\256\\\251\275\237[\326=\022\034b\275\034\374\020=\3459)>\347\016\303\274\371\223\221<\245\205\035\275\376\364J\2756u\315\275\202$\323\275[/6=\'\\\310\275\tn\355=\257\232\247\274\320E\031\276$\331\351\274\371\331\247=\302\322\257=L\235!\276U\304)>BY\273=\032\250\'\275AE\233=\360\001\023\274d\235T\274\266\303\317=\204\036\226\275\325\224<\276\267E\356<\204\177Y=\233\346\242\275\360U7\274\265s\365=\271G\227;\353\301\306\275=\247W=\2239\210\275\275]\273\275X\335=>Isl=P,\366;\335q\326\275\244a\003\276M\253\270\275;t\243\274\210|\226\274\016(\005\276\343w,\275\307\304\371\275\360\351\265=L\216\322=\302mN=\220\212\257<\272G\235\274\217\347\251\273aKH>(B\354=\262\200\332=\022\270\330\275\362#v\276*\002/=X3\360<\203\r]\275\253#\005\276\257w\260\275y\363\205=\014\211\201=\237\313\374\274\236}!>\341z\200=f\312\365=\036\311h\276\203\316\321\275\253\232\321=\363s\005\276\230,\302=I\000X\275\350\205\212=\032\\\365\275\215\327\276\275z\216\203=\267\336\032\275O\0025\276g\220\261=\276\005p\275*m\005>u\035\371\274{\242\025\275\003\030}=Q\300o=3\214\333\27552\224\275M\350[\276\016S\035\275B\325V=A#\016\276\365\325\334\275t\202\251\275\363\252\261<\"\230\201<\364<\252=\346\023\337\275\254;d=\317\256\017>Z\316\214\275.\373\274\274\305\034\235\275t/\223<\322\025\032<f|\333=]\233\335\274\343~\236=\241\231\215\274\334\177y\276\256\216\020\276\325L\314\275\264\264!\275\255\252\210=\035\021\344=\270\2150>,\313\036\276\322s\020\276\225 \270\274`\306\210\275\371\346\366<(\330\016\275\241<\375=&k\242\275\274i\342\275p\363\033\275Ww\360\272\330\034\340=cC\324\275\'\352\r\276\n\':\276\307\000!\276\301\362\026\276H\036\343<)\017\252\273\323\3208\274I\271z=\377\377\345=\376\225b=\225\2403\276\037\025\354\275\305\327>>\231>\264=H\263\223\275\205\036W=D\305\237\275v\331\031\275\355\367\n\276r\211\340=\343\317\206\275}\365\344\274[\010\334\275Y\003G<\005o\216<\177\023F=\251\277\314\275w\023\013>\216\242\267\275\031w\001\276\305\251\022>\027\302\310; m\232\275\317H\313=x\262\356=MyM\275\210t\304\275\222\375\342=\247\"`=\230\343\241\275 \263\323=\020$3\275\013\363\234<\304\010B<\323\252\267<\234\242\023\274\216\376P\275V\212\253=%@\237\275E\350\203;\320\014\250=\332E`=G*\224=\006N\261;\2366h=\263c\327\275\214\005\234=\"\255\204\2760\216\217=H\022.\275\311\243\255\275\032Wr\273\237\315\n\276\037\227\246\274\220\004\036>\362\035d\273\353\325\333=\207\376\"\275-\332#\275\307\305X\274/\210R=\373\230\334\275P\256\240\275\263i\305\274\365\367\027\275\223\2470=\017\3217\275f\330\364\275\246\205S=\2449\371\274\007\021\366<\3462\240=\033\252z=\336b\010\275\336\331\347\275L\000\'\275.(G>\330\271\361\275\326\211r\276\373\311\335\275\177X\257\274\036\351\276\275\201\036(=S\377\224=:8L\276\2272\014<\"A\217\274!\241\010\276\300\262\225=7>\240<OA(\276\307\021\212=\360\200\017>\314\272\037=4\215\372\275Yo\325=\351\315 =\306%=\275\312\375\204<3\333S\276\n\n\326=d0~\275\351z\314\274\352\021\254\275\224\206\334\275\\\024\206\274\303\247\225=$-5=\330(2\275(\210\010\276\311\010\330\275\346%0\275\004\263\016>\234\231J\275\255{\003\275\344\234\227=3\311\t>\270+\027\276\227S\320=v3!>\2671\344=\256\001\000\276,\224\331=\014\365\017\273q\254;>\363\t-\276a\322\025<v\321\367<\033\220l\276\026T\333\273\264\343\235\275\005\343\311=\257\333r>\273~\375<\242z3=\031\241\030= \205\355<7\354\200\274\023}\224\275\n::\275\375}\000\276\270Y@\273\332\311k\275\262\363\325\275)\275J\276\204R->\341\025~\275\362\035K={|\223<\351\335\217=\034s\315\273\010\244\270\275\240\320\007\276\177q\235\275\n\323\350<\333\242\227=\177\235\305\275\024\231\374=\360\026\\=\014\351\207=\240*\010\2761/g\274\332\335\035=\251\266T=\304\270\230;\340\n\201\274\n\201\020\276\217`5\276\343\033\357\275\374\217$\275\305\264\000>\2731\211\275\\E\032\276\344\315\212\275;\364\034>3Q\271\275\303\327 \276\354\210\"\276s\204G\275_H\271\275\271\007\037\274\305\225\237\275K\026\202\275+\237)<\237\014\022\274\367\225\375<E\273\360\275\233\024\256\275\335%?\276\375\207!\276\031H\355\275\234]\253\2743q[\275 \205D\276\020\210\027\274\2444\246=\310Al=jK\237>^<\224=1{\214=\365\317\305\275\270=\312=\370\374]=h\2125<\024Xf\274\246\014\342=\321\236.=\036t\033=@6\354=L\026\270<\316\007 =\226O\315\274d\004\264=n\236\230\275G\226=\276\356j\317=e\304\004=e\314\202=ng\254\275V\262\372:\241\3016\275!\203\335\275]x\210<T\225\372<\230\261.\276^\023\226\275\252E\375\274\330\215\207\275\037\007\322\274C\355\006>/T\230=\027\372\254\2751;\033\275\342\323\306=\202\246 \276\310\nI\276\323\224\010\276\252\320Y=\t\027l\275\362(\342=0\200\324=/:R<\305U\223=\005n\301\275\313B\256<\216\242\203\275\330x\202=\231\220\202:\352\0364\275\202P\035\275[\231\344\275\344\270\214\275){C=j\2230\276(\317\200\275\276\336\020>\206,X\275\207\027\016=\345\347\"=\374\346\273\275\301\2434>\300v\271\273\2226T\275U\'\026=`\251\200\275K\006\250\274\241t\010\275B{\212=q\212\231<\014\350\323\275\236\2368<%\371\352\275\tk\026>\210\277*=J\241\031\2762U/\275M\334\022\276\337\320\177\275\312Sa\275\302cz=!\010\010\275 \004#\274\207\351\206=[h\204\275\250\336\221<\212\365\007\276\224\243R\275\315\213^\274\347\215\337=rX\233=\"y5\276\037\304\301\275&\255\016>k\037\317\275`\301\257<M\217\">\272&\237\275\267\327\t>\347\220\251\275\002B\272\275\222N\374\275\266\354\376;\221a!=l\351-\275\310F\247\2759:\265=N\326\035;\031\274V=\215M\026=\361\354G=[\360\300\275\232\372\036\276\026C\024=W\232\374=,\200\260=h5\013>[\001F\276Vt>>:\231\324;E\202\"\275j\207h\276\026\300\212\274\256\216\207=Q\3745>\227\216\010\274\272\206\313<E\225\010\275\335\326\215\275/\365M\276\246\031\036=\023\262\226\2747b\277<\361\272\273=)\317J=\202\022\254\275~ \320\275\344\331\275\275\361\205\353<K\307\221<\r\264d>\021\365\327\275\323\010\357\274\355\325\037\275 XC>U\372\260;\365P\245\272\251iJ=UzP\275Yi.\276c)\007=*\016\337\275\023\024\223\275?BI>\"R\004>\327\347\257\275L^0=\252\237\300\2753\374\014\275\361\331X=\367\263\255\274\014\242\016\276\000\350\324\274\245\373\333<\r\345z\275[\270\213;\030\353\236=\365y\205\273\360b\232=\353\301;\276\303\273\214<\270\010\272\275 \313w=\327\344\235\274z]\350\275\250\246p\276\344jp=\234\223 >7\336\234\27553\250=[\347a>\312>#\274\227\251\202<\365\207\261<\352H[\2767\223\004=\025\332\270\275\264\242\331<O\037l\276=\2336=\036\305\301\275\353\221\304\275\377\327==\305\321\213>t\007\006\276\253\255L=w\340\000\276\350B\206=f\3659\276{a\337\274\007n<<\215c\002;#\020!\274W1@>\377\241\034\276Nj\024\276\367\303\033>\230\264*\276\242.#>8}\024\276K\344\247\275\035cM\275t_\016\276G\242\220;%\312\335=R\227\036=\3528%>?\002\261\273u\002s\275\r\007o\275t2\237\275K\355s>\233\246\365\273\177`\254\274+\035\221=\312fr=~\307z\275\343\251\032\276\202?x\274y\3166\276\']x=l\344\020>E\237\243\275\326\021r\273\3330\250>\354a\371<|4\314=\217\333\235\276\260\032\005\275\267p!=\250oC\276\000\311\r>((\276\275=D\230\274\223\255\212<>\274\372\275\033J\264<\000Y4\276\317%\n>\250\377\301\275\305\234+\275\326d\304\275\235\235\351\274-\024!\276\037\374\272\274<1-<\313 \231=f6\317\275\243K\r>;\372\272<\313k\221=\000\375\036=\217\371D=\351\223\213\275\220\016%>T\017F>\007.\344<\250\322\357\275\225\373\304\274\272\227\372\275\342\346\025\275D\2245\275\243%\220<\243>\307\275\261CK\2761\366\253;uM\230\275\204\217,>\353\264\306\273\213D\304\274\320\234\035>\305\351&\276\356\270\306\273N?\020\275\210c\354\2752\304\276=\310C[<M\376\'\274WD\351\275J+\016<\322_\037>\246\014\354\275\365I\014\276\346\361\024\275\022\217\375<.\226\260=\241\353\262=d]\031\275\022\037\206<\212?\237\275dA\260\2759\334\222=\201{\301=\367]\013\276\276\375r:\'\271\263=\226\316\320\2757\333@=\313F\374=\"H\375\275\030\3156\275.\371\033<\226+\203=c/\245=\306Z\202=b\251\370\272\027n\352=9o\342\275\024%\006=\273\004!\276 \033s=\363\2474\276\234[I\275\330\323\027=Dt\265=\255\316\314=\371\037\364\274\334\276n=!$]\275+\3426\275\315\005\251<a\201\007\275\230c\220=)\022\252<6\214q;\307\211\251\275y\001\r\276\330\331i\275n}r\275\263\2371=\030j\230=O\270\022=\347\033\033\275\331\3303=\023\210\250=8\314\260;1\272r\2759\325\374:\234[\253\275\326\332\312\274\312I\203\275e\374\n>\237\267\313<\244\360\200=bR&\276\270\345\267=I\342a;6\355<\275z\034\037\275RUB=\356A\031\273\271\333\244\275U\202\365\274\276o\207=\337\036\245\275\323o\016>\351\202\374\274\375\034\253=\201jq\274_\001\311<\251\030E\274\022\277e=U\230\327=\210\203->w\356\003\275kw[\275\305\325&\276za==\202\320\311\275\347\002*\276\234\202\247\275)Cw=\350\263\256\275#\244C=\362\350\022\276\000\372%=\263\323 \276,\2517\276p\341\000=O\177\n>\270\"^\275q\240_=\330\004\373\275_\205\000\275W\257\211\275p\251\241\275E\312\324=|\271\270=8\260\247<\246\205\323\273\271?\362<+\027H\271w\374\371<q\355\317;\031\242\010\275\031\344\345=\035Eo\275\232\242\300\275bGJ<\311XF=\223\355\220\275R\341g=\375\351\362\274\346P_\2757!\260\275\014GZ=\203\366~=\205}s\275\3738\310=\340\2424=\347wQ\275\236\225\013>\361@\314\275\017dW\276U\323^=\213\272\233=}!E\276\202\317\275\274\220\212\345<\352\002^=-\317\327\275\177\247\255<\327=\321\275\\\026\374\274\315\317\250\274\027+*\276j\207\274<\0023C>\304h\026\2753\376\245=\"\373\327\273\352K\211\275$*5\276\317O\234\275\0149\307<1.\325\275>\010o\275\345i\006>\310\025\352\275\002\235\213=:\217\253;\200\010\242<O\376\353\275\003*\t\276<k\342=\213\271\375;~~\304=r\0275\276\335&?:\362\034\355\274\323\357\216=\223\357\243\275\001nF<k*\010>\252\203\364\275\210\361\017=\"\261\243\275\253[\224\275\025=\321\275\017\353\010=\005A\003>;\270\375=\202\007\225;\226\261w\275\253\005\025=\333\035\240\275E\037\231=r\257:\274&\303\262=\262m%9i\300\264\275JE\222\274O\253\004\276\210\347\210=\201/\276=\036k>\274\265\310\354\275\220\177-=J\212\372\275;\271\315\275\035s\225\275\320\370\200<\3504\270\275\004?\025>\354\341\236\275`\377\032>7\235,\275\370\242@\275\312\255\352\275\301\026%\275\321\217W\276\025\006\212\275\340\244\302\275\007X\352\275-\223\370=\2728v<\341\231\322:\000\3537\276\265\317\020\2766`\235\275\254\212\257\275\337P\330= \371:=\266\325\206=.\362\244\273\206T\263\275\273\303\333=\314X\301==\317B\274w[*\2760R<\275XY\356\275\024M\324\275\223i\r\276<\232\337=\207\021\233\275l\342\367=\004\177\236=6\027Z=;w>\276A.\225\274\244)z\276`\214_=/\274v\275a3\222=\225V\021=\264S\232\275\360O\026>\253\3235=X\265\304\275pQ\037\272t\340\r\276~g\246\275\324W@\276\372\265\316<\373_\021>\260\237\030\276\013\032t\276\277F7>5\311\261\275\257+\253\273\354N\034\275\355\2367<\033!s\275\3759\022>/\304\356\2747\034\030\276\361\226\330=\364&\335\275\350\336\327\275gP\032\276\221{,\276Ft\357\275r\350\307:\333.\032\275\317\201\313=\257+\215;G\035V=\252\202:\276\2138\304\275\234\230*\275b\235\366=\270@\221=_\246\366<4\002\222\274\271B\t\276\374#M\274\226\274\354=\317\314G>|\326\022\275\n\313D\274f\223\243:\214\362%\275`\027\275\275D\001\254\274\000.\224\275\247\354\243\275\024\211=\276E\367\244=6\350\031>\017\027\204=\375n\313\275\265,\260\275\254}\014\276\316\200d\275\335Q5<\225\024\245=U\226p>\"\206\346\275\236)\363;\214\266\271=k\266\240\275h\243\240\274\254Lh\275\305\347\343\275\013\273\263=K\002^\2761\210 >#\326\375=\342\255\013>\372\235U\275\312-\220\274\206\253!\275\305\306\231=\253\340\274\275\265b\235\275\3635\t\276\307\332\276\274n\204v<\343\205\260\275S\251\324<\237\320?\274\007U\364\274\233,\343\273h\034\002;|\'\311=\332\306\024\276\036\tR=\336\340K\276r\354\030\276\002:\216;\036pD\275&\322\233\275\337c\316=\333}\016\276if\027\276d0\210=\036\223\244>\2557\230\275\210\255\372\275GTW\275@\324G\275[J\277\272(ao\275\232 \203=[\301\313=`\3076>\n;\272\275\232+\371=\026Uq\274~p\200\275\212]\032\276*\312\271\275\367\345\363\274\302\"q<\027+\022>\311%;\275;\364\354=\303\204]\275\277B\330\275\"\301 \276\t\037\231=1\014\214<Y03=\233\335\022\276\232\233\335\274>\211\272\275\326\321\351\275\345\221!\276\224\270^\274\246q\376<?\362\341\2751\230\205\275\\\260\213\275\211\345\035>\005\310\032\275e\337\017\275a\322\270\275\365\237\334\2756\375=\275\346c\313\275\325|\311\275\303h\311\275\026w\363\275,i\014>Z\232\303\275\371\234k\276\217\217\257=\201\333&\275\007\207\303=\330r\326\272\240\2300>\217\257\257<\251\302\310\275\334m\241=\356\035\024=i\243_\2751\003M\274\34098=\304j\314\275Jny;\347\360\t>\0042z=\363\0038\275Bk\256\276\343\345A\275\220\2024=D\013\031\276\006s\221\275\237\200\274=\377\221\350\274Y\257\002<\031\202\276=;\244\241=\364\201\302\275\250\262\007>\313Q\t\276r3\333<\0221\343;\370\313a=A\0100\276{Y\267\2753 \213\275\250\257\024>r_\227=e]\215\275\355\003\020<\257\033\240\275\256-J\275\254I\350\275u7<<\032\227*\276\264FA<E<\260<q\210\263=A\250\020\275\255\276\266\274Tb =4\255\014\276\233\216\010\274\2565\237\275;\254\351\275\354\341\300\273\237T\275\275H\206\333\275\267\201x\274f\2340;\374\362\013>6\005\267=\366g\212=\313\205\267=\320[\324\273\345\225\007\276:\017\347\275}\'\022\276s\323\013\276s\302\353=\014\252[\274\335]\226=E\007\005=\241\271\255=\332s\016\275\342\331\220=m~\341\275\223Y\224\275\004\256n\275\361\002\021\276X\360A>\006,\230\275\024>\r>\206\024T\2768F\260=\254\362\315\275\224\350Q<\322P\331<E\276\226\274D\t\203\275\325\0339=$,;\276l\021.=\272\2432\275\364\320%>\373C\230\272\276\014K\276\364L\202=\362\342\205\275`a\026\276\264\2518>\320\240\306\275\311\301\313\273\013\023\010\276\037\000S\276\251+F<\177\271\375=\315\213\323=\347\001\000\276\222v\016\275\035[\264<\334&,\276\324Y(\276\257\370\345\273\323\0222=\321\352G\275\002F\204=l\335\321=\326\257H=\365\353\316\274cmr\275\353\210\321\274-\330\374\274&\310\210\275#\023\032>\215D\277\275\020;.=k\014\254\275ne\223<\303E\340\275\205\216\266\275U4\023>\013\276\261\275\310\037\252<\022\367J\276\305^a=F`x\275qL\013>\020\366\014\276\235\263X\2750\200\\>\222O\257\275\2674\374\275\006>\034>\306\341\240=\226\373\014\275\207G\010=\257)\264\275<\320\313\275\337\'\t=E\007\253\275#.\355;\212\003+\276\302 \211\275D\254\237=\0028\262<y\"(>\301B^\272\004\225\246\274\203\313:\276F\247\336<p%\321\275\"\010F;z\207\243=N\342\232\275h\230\305=\030\260c=\323\245\230\275\231\316\351=S,\232;\007\356\341\275\272\022\325=k3\254\275]p\322=\331\275\201=\024\3311\275\007#*\275R\341\017\275\312\334\005\275y\200\026\276\317X\311=nUU>Il\213\275Y\005\366\275\374N;=\324v\311\275\231\376\025\276\262k\002\274\315/\267=\310\357\'>\020/\213\274 \353N\274V\230\347\275W\322\252\275\351g\004>y\304\202\275\345\232@\275\224\212\372<\374\302\247=\355\225\305=\224\214\323\275\211\325&\2762\307\220\273\355\301\366<\317\324\016\276Z\214\230\275\324\301\023=k\375\245\275\034\217\357=t\371\226=\017+\200\2756\354A\276r\271s\274No\310=-\277l=\350\275+\274\031\330 \275\357\263+\276\233\270|=2\"9=\036\200P\276!u\202\276\341\327\024\275\223e\330<\341\372\256\275\312\263\251=)Y\326\274\231W\250\274\361\351\000>tS\224=\300\311\234\275\273\231\265\275\322\254`>\022\276%=\226w\246=\344l\224\275\225XM=\354\334\277\275y$=\275x\357\361:\004\354\225=\242zI\274\032?\027>/\023\314\275\316l\304\272\322:\202<\327\271\010>\356\002\032\275J\177\215\274\240\236\031\275\355\0140\276\003z\026\276\316\356d<\277\324@\275\337\310\017=\206\313t=KW\252\274q\337\\\275\'9/\275\372I\007\276\035M\023>$\210+>w\361)\276\234\002\343=\254 \331\274\3567\212\275\255\014\002\275\224?\336=\"\301\231\273H\335e\276\265\337\032=q\251\345<\3419\346\274\030\0268=\241\030 <5\332\224\273tD\310\275i\237\247\275\207\370B\275a\177;\275\207t\267\274\233\246\n\275B&\302\273\275M3>\315\377\373\275Jb\206=X\001\213<\036U(=\3237g=r\315\213\2758M\237=o`-\275\210\260\224\275\311~\n\275\333\235\324=\016\"\241\275\201G\372=%\224.\276+6\335=\303H\360<\216{\000\275\233\275,\275q\n\316=\352\020\232=\307\033\263<\313c\264\275<\177p<br\006\276v.i\273~\"\005\276~B\323\274ri\223=\326\313\r\275}:K<\023xQ\275\000\253\027\276l\347\361\275\230\345\244\275_C\234\275\013\320\307=a`a;Y\304\301=La\221=\354\371\205=q\037\204\274\206\237\221\274\231\347\235\275\007m\321=\247\001\217\276\'7\027\275 \336\222=\026aC\275\375\346\024>\347d\376\275\300:&\274\307Y6=\365:#>\301#]\274\025\035\255\274\222\346\023\276\246\316^=\272\272U\275\264\363X\276\312\210\247=]ch\275\211\356v<\204\214h=\322Q\334\275.[J\276y-\013=\017\237\030>\270T\010=}~\223=,8d=\364{\230\2736\367\312\275\203\226\263=g,\355=\205\307\337\274.Y\036<<\272\324\274\245\360\225=O\376\344\275x\314_\275\362\240\230;\210\206\242\275\031\264\324=\245\006X\275\273x>=\017\221a<\257\373z=\303y%=\000\203\224\273(\332\203\275\271\313\231<\017Qp\275y\364\017;\326\361\307\275N\211V\274\014\342\331<\373\302 \27628+\275\335\236\276=\320\026y=O\377$>\320\223\267\275\260\006F\273\333\275\211\275\261\324Z<\325\310\310=\"\242\273=\337\207\247\274\204X\263\275\275\367~\275{\355,<\312\337\300\273t\323\241<\212\022T=S\326^\276U\220\213\2753Q\205\275\001\006S=\263\371\213\275\342s\264=dw\003>\252\212\000\276mua=\257\226\341=\211&j\275\005U\025\274\r=*\275\200Oh=f\254\010\275\222\021\n\276\211%\201\275\272\020H\275\204\222?\273\374$\014\275p\360\006\275M\242\220\275\177\027\376:?:\021>h\027k\275+yO=|\030\204\275\341\025\036=\333L\251<Qw\240=\322\201N\275\022\265\270=\367s\201;4)W\274\212\351\215\274\367y\274<\302%\235=wRk=;\207\000\274T\240\"<\nL\312=SU\000>\004\316d=\246\307\205\276<\000\030>\354\347\235\275@\032\237=\243s=\275\264\352\255<\273~\233<\331\"/>\332\302M\275b\340\207\275\324\223\237\2745\304\007\275\334\363\254<l\227Y=\333\240\013\274F}\330=\222!\232\275\032z\261=r/F\274eL\217=\340\376\221\272\025/\016=\306\362K=\237f\364\275\253&~\275\300\252\237<\311W\001=\247\026\r>\274\024\306\274:9\002\276C\210\215;Q\257\252=g\233\275;\237/&\275\372\330>;\037DJ=~\357\207\275\361\311~\275\256\254\303:\217/ <\303`0\275\203\344C<N\310\264=B\270\376=P\032r=\320\037\215\274\222\017\r=\244\316\354\274\367\277\213\2748\352\236=g\276\0009R\314w\273\252\366\034\276\273\243)\274\356%\270\274\367\370\256\275l\021Y\276\374e\304=R\t]=\302\357\013>\034\322\257=H\210\224\275\206\376\017\274\304C\230\275XDa\275) \316=\2465=> r\257=I\037\205=\210u\001\276\214\031)=\"\2516\276\376,\222\275v{\245\275\"\346\216\275l\361d\275\231~\313\275E\0017>\275?\030\274\344\037\253=\276l\227=t\201\343\275\245j\271\275\002t\324=?\017\254\273#\251\002\276J\373\326\275\306@\257=7n\254\2758\334\014\276\233V\006>\032\223-=\313Q\341\275\275\267\024>\226\303\362<\270\007\026\275\257\342\n>\\cG;\267\247]=\245\022\036\275\311\360\342\275\335\306j\275\243\362-=\r\353\322\275\211\302\020\276\347\027b\275[\320\302\275OT\334\2755]\244=l\245K\275\367^d=\271\001X\275 \221\200\270\023\377\037<\241a2\2754\010\t\276\245\250\007=3\000\220\275RH\235>-\211\325\275\326\030\242;&C4\275\330k\245=\262C\270\275\005\315\377\275\211>\243\275\034\352\355\275\374\\\307<\356z\235=\201H\201\275\240|\252=\3409\201=\317\355\005=\215X\013\275\2277\262=\2776\177\274\376\257\350=uP\316=$s-=\251\276Z<\'Ez\275\220T\241\275\027s@=\022>\034\275\030E/\271B\371\213\275\310\251\034=Y/#>g\366F>\267\332(\275\201\034i=\326\254\340:\225\210\256=\316>.>\312#\251=\325y\020>\214lD\276g\326\246\274\342\325\357;\211r\203\274\337\253l;\351#\226<Or-=M\203s\275\320\033\260=\315\036\242\275v\303\241=]\377\332\274\354f\345=3y5=\250<W\276\261\215\365=\265`\243=\240n\217=\234\250\217=.=\241\274<\2337\276+\363o\275\276\261\035\2759\317B\276n\377\223=\334\217\241\275\345\032\177\274~\360\000\275<y\356\275\220\273\264\2754\253\366\275\333V\204<\204\002R\275sI\272\274_y\215\275\251\351\000=W\216]\275\034\010\300\274\264\331<<G\302\200=}\212\030<\335s\252==\337 \276b`\031<\345\373\t<\312Aq=\341\325\345<3\3618>\310?\250\2747\310K\2750\215\365\274\024\017\277=\374\323\214\275#\341\372\274\2230\311\275t\321l\275N\010V\275\344%$;\366/\353\275o\241\030>\204\237\340\275P~\006\276K\375\332=\205\331\255=\341\361\006\275\275\030W\275j\212f=\214\263\013=)\202\241<\305A\005=\367\334\026=\230X\225\275\'_|\275\367\271\001>\3342\344\275\273\036t=\307\214P\275\262+\200\275\314\272Z=\363\031\217\274\3239\330\273GJT<\234\356\225=\205(i\275D\031\264={`\233<S\334\014\274fyX\275b&G\276/$\005\276\307\263\221=\022\223|=\255\315\242\275dU\207=\300\213\225\275\233\313\243\273\320\376?\275c\302\003<r\201\257=\253h\321\275O,)=h\305\360\275v\"-\276\320\003\\\276Z\003\241;\3713\340\275\036\026\036>+J\021>\0328\277<\000\014\007>q\022L=\233\021\335=\020\372\010\276\0230\000\275\321!\316\274\3311n\275W\010\270\274\037b:;@\307\323\275\275\222\311=\212\367X=\3752.\276\231\245\010>\342\006\264=a@\027\276\2513\010\276AE\350=\232M\036\276\341yO\275o\020\034=\363\312\241=)\302\361=6\r\326\275T\037\204\275m\370\324\275%\347\267=)\301[>\006\245\375<VA\233=\331\252\201>1\\\\\274\332\023e=O\327\255=!\205\256\273\342\316\245<\261\350\214\275\244\022\0109\243\271H\275\314\274\327=\031&\300\275\270\301\212\275)\331\220\2752\243\221\275B\004\026\275\357f<= \267\034=\0357S>\037\345\312\272\337Zj\275_9\263=\310F\204\275\257\033b<\026\003\324\275\364\323\363=;(U\275\201\264\371\275O\275\355\275\251o\217\275Y,\303=\361\t\225>\336\224\t\276\007\225\306\275\362\346\273\275\223\371\214\274$\345d>\331\347\252\275\256\250\025\276\364{\245<\367\374\252=\216\001\222\273\363\346\344\274\246\367^:\367HE\275~^8\276O\202\253\276\322 \250=\274P\"\276\202\253\337\274@\277\204\274\253\312\001\276\365N\204\275r\332\232\2752\214\010<\312L\023=\236\276X>3k\262\275\346S\246;{\3564;\351;\312\275\247\013\037>\317V\337\275sA\037=\266X\025=aq\307\274\333S\001>\211j@\276ga\020\276\240MZ\276q\321d\275\274\020\317\275\214\030N\275\367\001\350;\216!\353\274\272\217\272=\206\303\364=\251\344\r=\234\256+\275(ib=fz\334<w.\276=\276\374\251=\255\024\321=\212\250,\276=,\200\276J\334\036=n\245\246=\005\230\222=S}W\276\013\360\036\276k\244\203>\006v[\273\217h\265:\277\212i=!\324\335<\266\213=\274z\247!\276\211\314\376\275&\371G\275\200\276\254\274\243\224\365\275o\003\334=\365\240*\276\210\361\206\274\354~\373\275\014M\266\275\273\357\254\274\224f\'>\234D\212=\332\357\235\274U\267t\276d\014\253=\255\207\200:\325\021\342<d\306\034\276\225B\373\274\321\273a=\365\"\270\275\232\325\302\275\351\350\312\275G\3422<\357\253\375=\255a=\275\225{\007>\033\n\270=\034V!\276\036\233l\275|\371=\275l\310\032>\026\304\303;\"\331\317<\"\301\256\275\013\223\032>\356\377\253=\037\252&\276o4\266\275{pq=)\365\214=y\233\375\275Z\2458=\035\2554\275\222\313\'\276\210\320\326\274\370*\324\273@\223c<s\201\177=\272\022\351\273\'\264\002=8\342\031\276\334(`<F\210\267\2758Z\367=\240\351\207=\310\360\325\274Y}\303=\037\2258=\244\351\357\275\223=]\275:\213\222\274X1\032=-\377\206=\332\336\001\276\270\335\201=\220\313\202=\034\336,\276F\r\005=[D!>t~$\276\326G8=o\250\257\2759\036h\276\217\333c=\035\331\260=\005\242D=\254|%\276\205\324\213<\361\323 \2755\217\320=/\255\235\276&H\237=\375\326\217\275\316\240\002=\255\027\221=J\322\025\276\302H\262=\353\242\242\275\210\257\347\271\026r\222=\305\032\177;O2\"\274-E\324=F\177\346\275\225\024m\275\335\001\202\275\\\265\001\276\216\250\\\275\261\364\311\275l\325_=s\331\345<B]\225\275\202\363\212\275\362Cz\275x<3=\275\366G\275\247M\211=\226\204\205;\250\030L\275\327\260\232=\002p\375<:\017\212=U\222\303\275\306\r\345\275\032\034\017\275VC}\275\235H\303\274y1t=\215\035\214\275Y\211U=a\277\224<\236L\304=\243\313\t\273j,_\274\223H;=C=-\275\3353\230\275\036\333\037\275\232\253\232<\037\223\224=B\017p<\261m\317\274\261u\230=z\020g\275\371\323\254=\231\254\263={YL>iw\"\2757\024\310\275;\374F\276\221\007\320<\332*\327:\366q\335\275;\351\020\276\262\263\201\273\016[\024\276M\311N=\277\307\253\275\327\257\343\274\351L\330=m|\000\276\027\375\300=O\001\355\275\037\232\225<\315t\231=UB\234=\373\002\023>\262M\314\275\203t\224;\330>\303\275\004i\257=f]\332<\302\034i<\031H\377<gH\224\275\332\223\037=\330^\036\2734\310~=7>\250=\215\267V=:\332\267\275k\235\026\272\345\324\214<>\032k=\346\315\361\274\260HN\275\026\306\033\274\223I\311\275\220\214\250\274\262^\010\274\245{\010\275\311k\233\276\332\306\022\275?\315\232=\022X\024\276\371B\221\275\367\304\304\275\212\026]=\214;T\274\256\244\027>\321\022\003>*\000\034\275\272g\264\2755B\221\275\362\334\202<\367d\356=]*]\275g\242;\276\\4\233;\214u\270\2759WG>oT\351\275\265\270\265=\006\246\244\275\344!\237=p\330E=~U\256\274pCC\276\245\2218<K\336\313\274:\034\271=w-\377\272u3=<:\177\244\274\230\025\205\273\2116;\274XM/=\013\375\337\275\226\333\346=l\357\002\276\214\223\325<r\034\335\275\247w`>\302j\215<}\027\323;\027\317[\276\271\232\255<g\256\245=D\264G\276\367a\272=\203~\341\275D\203;\275\214\375N\275m\327\365=\250r(>\30211=\233\242I\274\323\267\032\274\023\234\023>\336]\371\274\341\004\222<?\334\325\275*\234\243\275\n\340\377\274\247W(>u@?=\335\006\264\274\205\226\331=\237\342\003=\206\343\232\274\242\335\226<W\314\203\276\231D\210=eM\014=#^\240\275@\036\260\274\005{0>\035f\005\276\2641\026\276jB`\276a0\024\276\217\261\300\275H\336\277=\320\213-=\324\2719\276lM\t<j\276\016>\252\343\310<H\202\"\276\206\270f\275\227I\240=\233\326c\274\347\257\231\275?\'\031>\016\021?=>\261B>H\013\334\274\211\340\242=fQ\302\272\000|\307=X\002\315\275}!G\275(_\002>d\204\373=R\200\347\275r\211\325=S\226\342=.\365\276\274\005bT\276U6\002=\335I\032\276\224\022\303\275\367m\021>\031r\035=\214I\354\275\247\321G>\036\000\300=\343\025\334<-\343T\276\232\010\307\274\t\034\270;\324\353\033\275\001\253\337=\221\247\005\276@\032L\273\336\360\320\274s\004\024<B\316\364=Lu\000\276\353\377\226<\227\277\315=0\\=;(l\017>.\001\350=9K\252=D\017==\005*\311=\203t{\276\346\2534\276(\216\223<y3\271=Qt\306<\353`\017<}\322\344=\023P\245=\262M\300\275H\372b\273>\222\032\275\225\2375=\2539\311\275\225e\321=wt\362\273\3078\302\274\376\004\366=zv\352\275\317\037\024\274\257\314\314=\230%\034>!b\364\275\01445\275\235<\263=*\220d\275\216W\305=\013\356:\276\270B\026>\177\2755=\251\230\201\275|\232s\275\3307\275=\200Q\256\275b\224\024>\373y\202\275\361\022\272=\037u\014=^-\036\276\022\226\241\274\263\025x\276\034uC=i<\031\275\313\373\303<\236.\336\275\302{\327<r.\331=\205\206}\275+\246\337=\316Dt=y\305\t>>*\312\273\007\t?\275; \221=\237\317\000>M\251\341\275:\337\005\276\360\000\027=\314EN\274:\215\251:\2076\233\275I\200C=\005D\007=0\302\325=Cs\025>\260\243\251=\277\316.>\376\241\353\274<^\216\275\253\227\270=\330\237\206\274\251\376\354\275\244\362\036\276\350\023\032\273-\323\236=-\n\200\275\304\331M\274|\244^=}\375\323\274u\235X=\346\204%\276\244\272t\275\337W@\275r\340\264\275\021\364\257< \266\217\275\n\330;\275\374\017\242=+b\213\275\245#t<\013\235->\326\333\216=b\326\263\274s\350\336\275\323\273\373\275^1\216\275\021\343F=b\314\200<eM\261=\201\014\245=Z6\334=\177\027\270=\372\'\237\275\250\214\326\275\2328O\275\354i\253\275c^k\275\333r\260\273$\260\323\275\275/\346\275\253(\204\276#\373\312\275lI\367<\317\2316<\364V\373\275q\003\242=\363\313\362\273,\330\021;.CJ\273\352,,=\346\326\361\274\324\r\320\275\235\220\036>\014\007\260\275\302|\277=gK\204\275^\034\013\275\352\327%=\305\367]\276\001h\226\273\023\3735\276\333\262v\272\300\27559}=\202<?\217J\276\265\343\353<;\335)=\232\201\250\275\206\006B\275\277\214\302\275\263\204b\276\243$\337=H5\364=*Q\341=u\0250\275\231w\251\275\030\222\031\276>\276\223\275O\352>\276\245\205\225\274\342\232\333=\236|\026>\273\024\000>\256d\242=Fk\230=TG\254=\233\273(\275\002?E\276\226Dg=5\266\236\275\001r\242<\005\000\315\274\214\340\371\275X\310\240=\215\016\337\275\2729\016\2760\212\370<\213\212\023\275O=\354\275\270\0018\273\354*\243\276za\332=\302d\034<\241\301\347=T\003\244\2752\226\274=\016Ks=\300\203R=\245\225\243=7w\030\275\207\307T=\320X\207\276\273X\312\275\265F\322\275\\\347\006\273\274\201$=\313f\326=\033\371\375;.\351\235=D\255\025\274\204\340\275\275\335r\353=\267\361C\275\353lD=\320~\200=\311\036\243\275r\222\201=Y#\324=\373\363\001\276\344(\326<\204&\317\274\314\221\205=\300\274w\274:M\243\275k\020\316\2757w\325\274\022]\305\274TH\254\275\275\376\371<\306\274\304<B`\250\275\273\275\265;\211\356\034>\270\235\022\276f\203\231\275)e4\275\217\245\340;\340\020 \275G\331v=0\257\216\275\257W\375<\311\306&<\277_N\275\260\013G=\034s\020=\360\274\322=\242\350\303=\201\362M\275\222\240F>\006F\211=\'K\244\2757\025\022>\213\342\261=,\356^\276\221h\325;\262\'w\274\2143\230\275\316{\250=\264\010\331=:\266\224\275\373\006e\276\201\334\305=\341q\030\276l\235r\275\363x\017=\243\000\264<;\3108\276\360P\306;kDV=p\335\204<\352\273\007\273s5K=33\">P\007\355\275\267\274\302\275<rd\2759\243p\2752\013\303=\262\034\272\275<\373|=\205\340\032>\360\334\312\275\226\034\344<f\326k=K\345\001\275o\033\000\276\236\000\025=]\033\372=1L!>\250[z>\345\222\326\275\200\306\272=]\035\305\275\274\202\036\276\344\357\245\274?\240{\275\033D%>[d\306\2759\231\251\275\342\027\210=\006\024\"\276\206<\374\275nH\230>\247\\L\275\320\262\333=\233\301r\275\266\202\237\275\253\234s=\373_\245=\347dI=\301ly\275\253\006\230=\340\2443=X\272;\274`0\365\275\217\304\226\275V\237=\2768\315\327\275\225\341\205;\016\203\370\275F \301\275\303O\302;xuP=w\254i>D\250\t>h\021>\275Q\035\361\275\322\276v\272f\272\037>\305\0072\275\007<\253=7\344:<,\007\265<j\313\314\273\177\231\307;\r\222\013\276\007o\235\275\246$\004>\037\346\353<\253\321\r\275\263l\225\275\326\027\324\275\317\204\000=\211QM=T\212\223>\245P\225\274\022\351\021\274\013\325F\275\214\332\342<\270*!=\320@\030\276\350\216\333;\222\001\257=a\033\301\275\257\335\002>tN(\275\222\304\001\276}\270)=\'\177\277=\311\245\371\275\'&\345\275\355@b\275\273\204i\275\242VQ=\242qH\275\334\325\217\274\000^2\276Mw\314=\370\254\345\275\301Lh\274q\202T>p\333\n>s5\">R4\274<g\232\026>\304\252\t<K<\241\275/\200\017\276\306H>\276P\035\363\275\367&\243\274\205\365\373\275\364\364\271=1\266)\275\010\n\n\275O\272\206=\001ya>T\355\267\275\032\010\003>\363\266\007\276\255*\313\273h[\r=\032\232\250\274l\215n<\t9\270\274\355\353\251=\260\325\303\275\332\333\245\2755\345)>\245u\375<\352s4<\323W\022\275\202\346I=\202\210\275=\337\000+\273\341\304C=9[\024>\234P\272;\026:\227\273\305\270\336<\276\347.\276\371\322,=\325e\310=\233\026\216\2739\336\032>p$\004<\004\354\026=\364\226\305\275\026`\037\276\220q\233\2753\332c\274\232A\026>\007\200\315\275\0219(\2766F\251=0\222\225=\322\033M\275.\270\373<d\242%>L\360p\2755A\277\275DX\036\276U\262\247<\347Ns>\020\264\204\274\\9\236=\330Do<B\353\307\275\315(\202\275\375\004\300<\013\016\324\275Iav=\261T\302\275\325k$>(\232G\275\267\374\342<\245\334-\276\024\257\227\275\262\373\274\275\311<\227\275\274p\017\2762\311\374=\321\352\277=\377\242\313<*\252z>\373@}=s\353\376\2756I\215\275U\321`\276\372\356\026=N\235\327\275J\307\021\275c\333\227\275>\310\004>l\246\254\274\211\t\345\275\364\254\205=A7\256;\360l\356=\000\3675\275\240\316\355<W\254\254\275\273\232s=\363\345K\275\r\210\327<|\222\224\275j\177\235\273\323-\013>\224w\022\275\033\r\237\276\326\246b=\0039\365=\353,H\276zm\270</\354\010\276r\236\225\275^\035\213\275\201\366\r\276\213\270\200\275O\177.>\303\201\205\275p\036\\>\016zq=\365\226&\276\007\345l=@\024^\275[\346\371=\014\231\013>\354\326\330=\3137\247=(\232\r\276\"\266\t\276\237\266\350=o,2\274\366?\303;\347PB<\3400\033=\301qX\274;Yg;\365\000\000\2766\035\247\275\251\374\337\273\273\315\252<.\340\301:\n\327\242\273\265\365\234\274\027!\267<\332\033\021=\340\251\357\275\\k\031\276\010\007c\275P\224\003>h\036F\276\215DN\275\303\371\371;\301:{\275*kY=~\320\267=&\314S\275\313\305\376=\352\370\241=rA\000=Ob\356:\261i\261=\n)\211=\267jZ\275\033\326\262\275w\233\354=\245\260X;\264_\205\275\211*\004\276\311s\267=\213S>=T\333\265\275~^5\276w\324T\276\304%|>\207g(>\026A\"\275c\223\320=\262<-\275?\216\007\276\035\030\001>(\246c\276@B\207\275|\244\255\274\021$\030=\311E\233\275\244\222\207<\376\340\021=\361\366\217\275R\026_\274\341\237\312=R\314\034>\311\210\273\275]\'\322\274\323\243\244\275\346{\"=@c\255\275\240\316\n>t\341*>\220\\w\276\367h\211=\006\365\305<>\363m\275@\rZ=\r\274\346\275\322\322\331=g\306L<\334\230\362<\363\335p\275\327\371:=r\031\307\275;-\262\275\375\312\234\274\321zs\275\035\\\210\274}B{\275$<H=\376h\342\273~\270\377\275\261S\203>\304U\224=\205U\224\274\342\214{=\374\254T=\347y\257<\016F\014>\222\367\003>\326\237b=\252\316\275\274\301\262\020\276&\240\247\275\300\274\026\276\013\361\025\275\365\n\203=\230\017\r=|j\206\275\311p\325\274\354V\314:\004w\264\275@G\231=^\337;=\272\343\361\275\377\370y<\361o\261=\n9\020\276V-b\275\241\361\\\272\235&\240\275d\026\231\275Z\305\266\275;\217\332=\323\343\217<\351|\023=(q\300=\251\361\230\275\363\010\023\275\010\246+\275\000\262\343\275i\2368\274\305\272O\273\235u\001=\256k\261=\217\002\302=t\025\262<\002\225\355\275\363&\302\275\336\332\272=W\336\225\275\221=\373\275\r\224\303<d&P\276B\314\243\275\237\277t\275\204\223\240\274\315:\032>\242\357\261<5\355z<\242\232\177=\305=\031\276w\342\021\275,=\364=\304U\331=\356<\232=\t\tZ\275W\227K\276\334Oh=\303\241\341\275\253\371\005=\314\273\324=)\377\215=f&F\274(3\004=B\337\301;\370LN\275\007\373\201\274\255\3132=.\377%\276\251\226*=K)\014=\n\014\250\275R6\006>n?\005=nj=\275\027\272\210\274\264\2717\275Z\311\005\276\325\346i\275J\363Q=Md\255;\336\303A=s\247\331\275\252\013\266\275;B\202\275>\224\303\275\024\320=\27617\035<fPG>\325S\237\274\306\270\317\275btJ>\327\314\211\276\263d\224\275\261\204B<R\371J<\013\021\217\275\235\370I;\301\237\320<\264\031v\275IE\302=X]\367\275\331\r\336<\315\346O\275-\372\323\273\376\371\242<\033\307\234\274\026\327u<\307r\373\274\233V\206\274\352\2762=\314i\254\274\016\357\351\274\255\316\273\275\274\224\037\276vh\305\275G\350`\276\377\347t<\036\323\346\2754\331\023>!\223\356\275\023\363?>&\250\221=\374\201\305=0\322\025\276\001\240M\275\250\237j\275\323\236\304=\211p\270\275\203\267\314\273Q\232\231=\270\344\037\276r<\262=%\026D\275)\2638<\244]\335=n\253d=/\022\235=&\n\356=\030\317N\276\346\301\246\274\334!\027=\345m.\276hM\343=\232\003u\275K\241w\274\355\314\271\275\366?\274\274|S\353\273y\343\222=\000^m\275n\315\215=X*C=\021[\321=\337u/\276\001\006\261=I}\301=_\350\301\275\370\353\t>:\313N=\340\2137\274\n\245\231\275y\213A>s\312\000\275\356 \032\275\263\3540\272\372\365\326\275pY\342\275\362\035\200\275\337\033\000>\276Ur\275\267\032\327=Nxm\274\274\216O\275}\353/=<<F\275\266L\275<I\276\267\275\307\224\270\275\335\270\316=\035[\274\273K\rc\273\222\255\250=i\252J=\235\274\217\274\357\345\270\275\2678\025=:\304\221\275\r\367q<l~\303\274\247\336\260\275\213\233\022;\033\273\000>\226\307\356=X\340\330\274\272\323\022\276\331\005\'\275\315\327\336=\001\316|\275\301\221\337\273/_\262;<\0362>Fa7\2760\302;\2764e\254\275O[\236\275\220\022\005\276\2241\303=M\352\202\275\274\327~<B\364\322=\325\321B\276\n\376\242\275\036s?:\350a}=l\001\234=c\270|<\n\254\353\274\275\304H<3\033\203\275\035\213\032\275\376\300L=\277zL\275}\005=\276\235?\223<\376Y\235=\362@\231\275\342\203c<\345M\255\275\320P\203\275\227\310k=\212\275\027=\225ZR=j\2156\275\3408\216\275\010\301\t\276\0304\211\275/\251\336<\026\0360<\335E\326\275HE\335\275\013\335\356\275!\372\363<\366\272\310\274\200\363j\274\034\235/=\240ea\275\234\2435>\3368\016=<\255\220=u1\004\276I\315\236=\000\261\217<{\303\231\275\237\204\002=\033\037y=V\313\201\276Q\222\252=\255B\363\275tS\007>\211t@\275\207\024\001=\023e\226\2753$\024=s\251j\276\371\2464\276\020\'J=e\256\205\275\036b\006>#\005\244<X!C=4\364\205=\214\017\344=L\212\265\275\364\366\034>{\216C=y\037\220\2750\367\352\275lu\341=\273K\242\275\'\036\n>\234\242M\276\264d|<\313\220\225\275\302\264\367\275.R\372\275e2\346\275`\341\252<\341\244\006>dJ\270\275`\352\351\275\212\252\261=\266E\\=\206?\022\276\232q\272=\353\242\020<\214\361\211\275\270L\t>\006_\">#C\347\275\2768\362\275\233\3411>\206 \007\276\200\207\021\275o\371\251\275!0\344\275,\351\357\275\336\037\217\274u\321\374\275\334\377\260:y+\367;\226Gt\275\200\354\257=6c\330\274\334(\227\275y\311\247=\224\231:\275\"\224\237\274\016\371f\2764\236\333=\017\311:\276\316\202\030=\254\tH\275\213 \005\276\363\256\304\275,R\315\275\263\346$\275\323\217f\276$Q\312=\231\370\323\275\326d\351\275..0>\014\217F\276\300\016\350\275:\347\213<e\275\212\275@\201\320\275\007\352\013\275\314\033\305\275VT\376<\214v\234\275\336~\201=\353E\212\275\024\231\033\275-\024z\273`$+=7\002\374\275IK9\275\233\2670>e\266[>\215\235\241\274\372&t\275F^\037\276\\7\022>\323d\226\275\341\264\307\274\305\352\200\275\362\3419\275)\370i=\363R\272\275\324\375\303\275\303`\217\275\261\327\223=\223\367\244=\234%\205\276Nun;4l\307<\347\255\246=}\331\020>\374vh\275\034\003\375<.\233\273\275\014h\265\274\303ZT\276\356\r\r\275\367x\235=\305\203\215\275\372\020\253=\202(\\\275]9I\276\357\033\232\2753\263\013>\265cw\274\1778\237\274)\370\014\276t\235\373\274\342\332\016=\203\201d=\374\354B\276\001\271\267=\327\314;\275o\003;\275R\301\303=+z\334\275K\252\032\275wM\246<\332H\231\274\355*%>X}\371\275Y\014\021=/y\360\275\254\233\270<\270wG\275a\r\206\275gF\346=\03039\275\346w\024\276\342<#\275e\3229\275f\273\270\275n\353\353=\350&\007=\016\233\200<\321\267\310=\2663{\275\304\266\234\274m\032\270=R\310\030\275\211x\004\276v\224n\275\223H.<r\'\360\274E\025\203=__\347<\036\021=\276\022g\r\275\361|\033\276\010,\021=O3\222;\277\r\347=e\026\333=:,+>\366\216\232\274\336\t\225\274,2\022=>\347\214<q\277\002\276\372\214\007\276%\275\200\275\211v\253\275\211\033\340=U\2470\271\304\305\327\275\365\343\377=\275\001\312\274\217\341\211=\242\363\033\275\352 \200\275\335\366\230\276\356\351\367\273|Zb\275yY\210>I\314\225\275?\223\260=K\344g\275Q\020\362\274\271\3055=,\375\033\275X?H\275l\013\000\275\263\250\331=\335!\002\276\t:O>\240\214\310\273\340\2435\276\370\206Q<\312\216&\276\017:\265\275\356\205\270\275\033T\262=\363\377\263=f\343L\274N\366\274\274Z\177\"\275-\206\027>5k\345\275\036\210J=\376\005B\274c\370\020>\231{\256\275\177\240\323;g\252\372\273}\243\251\275\"Z\"\276l?\334<\375\240\321<|\216\2309\330\272j\273\261\222\340\275\217\272\243\275\022\261\r\2754)\017\276\\\016\016>!\246k=N\231E\275\002\227\211=\260\247.<\373\210\323=n\334\376\275\007v\036\275 \037<\275FR\223\275\367<\004>\034Da<5\362\021>\200i\373<n\t\262=\352h\222\275\037\277\314\275<\342G\274@\036c\274\310\320\n\276 M\203\274`\315N=S\260\242=\016\224(\275\266&\330=[`\002>\312D\357\274\304v\200=Xo\314\275\303\227+\276g6C<\375\001\223\275jO\234=\035\311r=\331K\372<\016\023O=\207\353\220=\331\264\254<\344\314\t\276\250\n\372\275\305Gk<m\367\333;\233\354\t\275\353r\024=4\"6<\265!\206=B\r\215=wW\265=\017\022I=\242\305\257=:\353/=?\003f\275P\225\317\275\313\302\237=\017|\275\275\017\312\"=g8?=\210\300>\275\221\346\004><<\336<\024\226\202\275\245\216\232=\2742\244\275\246N\263=\023?\200=\371\357\200;\\w\323<Y\2741\275Y\312\216=\341>J\275yg\262\275\020\310\275\27561\014\276\270\273\030\276\177\304\246=\223,\216<,\341i\275\224\253\370;\337\367\240\274\241\374\204\276\021\235\017=\246\344=>\313=\215=.\340\300=\214\013\201>2\300\004=5\232m=%\320\326=\303\270O\276\3235\217\275\2647I=\366\024\244<\252j\220=\031z:\275\206\375\236\273b\374\027\276\250\276\032\275\232-|=t\205Q\275q\365N\275\272\362.=\342C\263;\216\277\246\274N8?;\220\033\305\275\000C\361\274\264y\211=L\272b\274\014\307-=L\023\005<\253\"E=\304d2=z\337\006\276\251/\264<\243Dh=\320p8\275\250\336\023\2742\374\207\275\337\025\250\275\255\273\010<\003\235\230<8\257\214\274\022a\235\274\010\364\202\275\310\207\213\276u\212\303=\245%\t\276\202\350?=\216\352\253\274\344x\377\275f\351\200\273\021\246~=[\266+\275\000\033\177\275\026SD\2751\324\246<\016<\307<\361T\030=\211\264\034=.X\234=\273\312\027\276\266\314;\275\347\035y\274r\224-\275\262\214Q\275\007\213f=I\215\223\275\343\277(\276b\203i=-\373\t=\276\224\327\275\325\337\241=\330\365\252=\227\204g\275U\220(\275\205\355\"\276<\305\272=\237 6\276h?-;\354F\331\273\275\233\223=\317\363\314\273:\357\022=\375;\233\275\263\364\023\276%/R\275uw\374\274\365\302\247\275\326H\026=\357\247\220=\201\260A=<\231\032>\351\260\233=\234\013`\274\365\r\002>I_\007\276\t\037\366=\255\247\353\274\247}A\275} \005=\360\027\030<[6\205\275\207\272\250=\240\255\375\272\037\236\227\275Co}\275CB\002>bUz<\356O\000\276\205\311(<F\260\276=\00430=^\232L>\031)\273\275\3761\200=\022?\204\275i\336B>\2269_=a\271\316=\220~\273\275\336\3645\276~ \357\274a\342\255<Y\244D\275\260y\277=#\034\334\274\342\376\273=\367\312\270\275\214\254?=\354\332\032>+\377\212\275\365\007\275\2754\314\375\272C-T=\266z\275\275g\337\205\275\335[\020<\253\304c\276\376\327\243\275\310\203;=\251B|<n\273j=\303\275+\274\013*W=\350p\313\275\020\250\356=O{\003>\nW|\273\0338\021\272\341\255];\031!+<\205\000\2559\230\334\321=\357z\016\275\355\215K>\030\2112\275\032Kv\275.76\275\240j_\275\003Z\340\274\340I\000\276\033)\265\274_\t^\274wI\306\275F\265\301;>\000\021>\020\311\357\2737\273\233\274\274\003\257\275\021mF=^\014\r>\265\274\274\275\320lJ\275W\330\257=\347\355\232=)\272\241<\27677=ml\241\276{3\355=p\372*<\007\356\212=+\213\372\275?\177\217\275\374\212\035=\275\212\341=\002A\225<\261/\257\275\221W\347=\030\202\263=:\205,=\2600\000>p\034\246=])\213\274-\372\237\274m\243=<\232\343;\276U\263\265=\353$\371\274%/d\274R=d>\212\206\006\275\356E\001\276B\252\324\275\315u\236\275\021\202\036\275\235\345\013>\022\273U\274\355`\307=3N\000=\224[\263=\323\007\215\275\310\032\232\2751\272\033=\263]\221\275|\264\020>)\240\245\273\\\003\203\2756\350\032\275\021w\007>\337\374v\276\207\261\025\276B\266`=\323d\025=E\020\324\2743\267\010=\313\211F\275d\377\201\275\367\014\204\275\010N\276;/~\273\275u\306\006=\357\033\264=\371\347\363=\377o\215\275\213\036\276=L\300\205\275\351s\316=\021\231\022\2761\264\351<k\305\333\275\202\225\016<k\371!\276\004T\340\275\307\330\002=\351\276\021\276\273%\025>;\205b<0\240P\274\307,\221=\307x\210;\337\3642\272\214\326\312\275R\036\216\275\227\321\200\275}\345\014\276R\247\026>YW\027=\337P\243=|zW\275\264\244\211<\337l\206<\216W\353<\270g\004>\303\251\217:\036\336\235=\365p\311<\273\205\330=\326\267\235\275\333U\345\2746\377\224=\275q\340=\263\003\261\275\2430,\275\211V\207=\302\263\035=\007o$\276\264\327`<\005!/=\201p\022\275\275c\313\275CD\266\274m\020\313\274^\220\316=\210\363\324\275\330&\266=\222\374\216\275l\367q;\227\263\241\275\301\3148=\372[\332=}/o\276\265\3402\276dE\274<j\003\020<\235\364\277<\375\276\010>\006\310k\275\364N\252\2755X\275=\231\032\033\276\310b\366=\313\"\026\276}\004\003=QN*\275@\r\214=\t\217m\275D\354\222\275\337\304\231\275\355\347\322\274\303\254D>\211\322#\275\2016\035\276\373\362\267=\377\327E=\327)\276\274\"\247\344;H\345\013\275F\'\304=\0208\245\273\231d\332\275\235L\306=\000\335\357\273R\246|=\361\353F\275\252\2300=\007\020\210=\255\320\r>f\226\325;%\037\006\2761-\201\275s\301D=\004\177L=\250\315c=\311\331\220\274\272\241\275\275\257\367\266\275\367\260\254\2734`\177\276~\252\315\275\350\0272=\326\272{=\202\317\017>\035\370[\275R\360\350\274N!\206<\364\2614=~\336\337;\230\207;\274\262\276N\275\213#b=\026\335\310=v.\323;\321 \244\275\032\321%\275+\247(\276\025\216\266=J\305\363\275\000N*\276\031b\250\275\323K\001\276\374\211\367=\206\262J=%\223\217=^3\364\274\245)\034\276%O(\276g\315\036>\321H9\274Fp\r\275n\251\023>\273\020\344\275\277O\211\274Y\343\220<8/c\274Q]\205=\3242\234\275\256\000\177\275\007W\254\274ca\247=\231\331\251=\320\325\254\275\262\034\033>>\264\312=\355\261\032\275\213\252\202=\026z\305\273c\300M\276\354\030\255=a\302\201=\235\303\210\2752\256\214\274=\203\257=\251.\370\274$\250\237\275\2500\026=4>=\275B\211\265=\204\350\227\275\017\365\001\276\370\372\325=\227\2367=\322@\242\275\275=\346<\264\376\322\275\272\300 \276\217\257*\275y\nF\275\010\236\352\275v\235u\270`\261\351<\327Z\204\275Y\372\010>0?K=\322YM\275`L<>L\264\241=\346\353\326<\'O\001\276\177C\250<\326\213\345\275\351I\222\274\266d\014\2742\371\363\275<.\022=\005\300\351=\321\021\235<\221\342v=]\316\377\275\265\223\313\275Q\356[\274&\024\301\274\2753\323=\250s\225=\275c\320\274\333\255\244\274\235q\014\275KhL=\302w\231=\303\002\300\275\377\'!>\231\016\352\275\352\037A\275V\177\323=\245\327\246\275\370\331j=D\t\274\275\334X\274\275\263-\246=\014\331$>_\263\373<\203UX<\372mG<2\\\035=b\2608=\235\322D\276\216\315\007\273[\007\374=\036\224j>H[E\274\302D\362\275A\201q\276nU\256=\261\310\375=[\311\205=\235>\216=\260f\033\276\315c\306\273?\367Q\274\226\222\326\275\024\335\213\2753\301l\275\237h=\275\212\255\224\275z \364\275x\301\302<<\224\372<\354F\243=\360\224\313<\246\343O9\215\336\000\276\'\021\021=\005>\241\275e\000\010\275\351\305\350\273\254\003\034\275\316\314;\274\252\340V<B\347I\276 \276\342\274\255\003_\275\355\361\003\275\201f\010>\245\202\333=\tp\237\275\367\035\350<0\263]\274\211\361{=\231\277\200\275\000\234|>\331a\032\276\3540\277\275hF\237\275(1\257=\243o}\274\326\337y=d\276\202\275\264\352\023=\n\311\021\276\241\306\217\275\357I\210=}\205\255=\302\t\035\275\231x\023\276\374\212l;tn\005\2758d\311=\224\267<=\375\355.>\036\325\374\275\241\010\320=59\025>\313\234\240\274\350o)\276\177C\306\275\223cf>`$\274=?\022D>\327\256\177=\213RC\276\227\"\206=\3529\236\275\215\240\032>t\221?=\005\306M\275j3z=5\214\232\275=H\275=-#\237\275\221\234r\275\374T\371<1v\177<\243\272\007>\234I\212=$\247\217\275p\275\301\274\231\354\246=c\370\310=\242\200\251\2734(*=\223&\237\275\257PL\275\340\210\275=A\032\034>k\201\330<+\013\325\275\3026\206=s\233+\276o\037\225\274uw\336\274\t\235\t>)d\253\274\361\312\013=\256\026\226\275\027\300\017\276\373\342\016=F\357\220\274\317\277\274\275\336\002m\276\340jI\275l!]\272+J2>o[C\275RzW\273\376(\225\275\004\023\201=ur\306=T\371\220\275\030\304\354\275\017\201\370=\346~\314=\033\033\377\273yY#\274^e\026>S\321\206\275f\234\240\275\035D\221\275\210>\244<+8A=\363\343P\275\365\020\232\275|\222]\276\370\327\354<N\361\236=\320&\327=\304cl=\007\306T>\325\256\376<\026\010V\274z \312<\003\314\037\275Y\251i=h\337\300\274\310\027\351=\212\205\326<S<M=s\313R=o\340\232=\324\357\370<I\177\251\275Rm\356<\207 \021=\313WN<);\177\275K\267\233\2730\346\340=\224T\342\275\213f\006\275\203\352\245<\210$\035\275\241\277u\275\257\322\037\273\006\235\246\275\367\206x=\351:\"\275#\224\254\274\327\020M\275\244\217\325<\223$\364\274\000\356@<\006gb\274l\026,\275\332\371\033>|#\006>}\275\233\274\010\207\200\275\037#\344=k\t\342<\022\244\366<\032\343\224\274\264\244\230=w\2013\275vs\317\275-\207\314\275\200n\300\275\231;\220\274\220[\'=/5f=\207H\016\276\n{L=(\211\220\275Kqi\275a\314\202>\204\275,\275\334{\220<\331\0104<\215#\265=hri\276f\276\255=\332/\036\276\246M\020\276=J\005\275Qa\030\276\254|\357\275\351\005l\275\1777\265=:\377\204=\222\345^=O<\224\275R\002X=\r?\314;6X5=<\237\332=z\265\225<Ch\275\275EH\315<I\350\005\275\252\353\200\275\366\351\003>\240\210\256\275\306\207\016\276\213h\231=w 7\275\313 \341=.\225\026\274\315\246\351<\217\344/\275\001\031\273<\000\205\270\275\367\215\315\275>d\020=\343\264\014\276w2N\275\010\263\240<HR\271\275)p\004>\346\3473=\346u\265=\273\260\254=\205S\334\274\036\314:<\246\202\216\275\264\204\r<y~\"\276WA\263\275\231\227t\275\205\324+\275,I\016=\n\230\364\275\220m|\275\343\201\254\275\275\356#=\245m\217\275|\3478\275:\r\005\275`\324{\274\004\237\221\274\003S\334\274B4Y\275F8\026=#r\347\275f\230\314\275y\336\231=\252\322\216\273\300\356a\274vj\000=\211WI<\031m\365\275\201\337\203=\263\013\257\275\247\1778=\0225\010>w\026\227=\314$b\275y\006 =|\221\355\273\357`\210\275\016\323\013\276kq\001\276\007\025\013\276KF\264=#XW\275\210Gu=A\241\024>\004\0274<\243\250\251=\3748\270=\253c\277=\307\325\217\2769\253\020\2762\031\245=?\275\253=S\223\000>\003\302\365\275\366/\244\275Q\030S\275s\362<\275\213\005\252\275u\244\262=7\322\235\275\376;1\275\3442\332\274\222\277X\275\337\347\032<\3135\203\274!\304\326=Q\027l\275\016\236\024\276~\001\313=\346\275\226\275s\247\240=\373#\273\275\2772v\275!\274;\275i\n\270<\006\322D>\256\254@>\003|\240=\360\255\212<G\270\302\274J\"\377<\307\323\031>\001\306\347\274\247\000\240=(\323y\275{~\326\274\031Q\001\275\342Y\231\275\371\372\236=e\002\225<\214\340\227\275DYG\275_r\262=5\321C\275\263j\000\273\305\022\023\276\332\254\000<\216\177\311=O\243}\2750WY<\336\3738=\216\257\002>%}\n=4\350,=\001\334\215<\217\002\345={\317\n>\316\321+\274\3531\247\273\212\035\237=\\\254\225\275\242\237\233\275\336\352\334;sf\341\275\264\016f\274x\023\272;\272X)>P\360\261\275\220\003\013\276W49\275\233P\206\275\022\320\017>\310\352x>$G\001>-y\037=\254\234\313=\231\027\204=95\231\275\322\016o\275\267\177\346\275\243\377\234=\210S\332\275u\031\002\276\353\351\247<gY\361<\267H\217\270g\211\315\275\360\260y\275\te\202\275\240\317#=J\032\243\275\0170\252=\211\225\373=[\016\230\274N\234a\275H\224\344\274\357\326\033\276\246\363\237\275s\021\373\275iq\370=H\005K\2751y\026=\227\001\007>\332\235S\273\212\r\274\275\212\020\300=T\300Z=\212\331k\272\306\t\231\275\303\302>\276c\277\304\275D\014B<\272\201|\275\201u\311\274\253e\023=@\314\216\276\035\300<=\317*\276=\216F\t>5\272\247\276\230\366%=O\"\024>\321j\356=\301\273\033=_\226\216\275\301_+\274daA\274\324o\254=\016\016\010<\223(\354;\364\251k=\305\355\360\274}\366\005>n\001\335=w\357\224=~\226\034>\322J\302=p\324Z=\347\264\352\275\237\351\373\275\3570I=\307\3531=:6\331=O\273\262\275\333\275\344\275\262\205\362<:\335\020=\035\004\312=\301g\227\275\036S\202<\226\363i<c;M\275~\306\\=\211\3627\276O\256\352\275\264\200\266\275\224\350=<!\366\235\275E~P\275\2264\376\274\301\030\335\274\215\017\357=\017\244\211=\223\275\001\276\370\177\270\274o\306\215;9L\017=\205\365\222=\242\326\306\271\021\365B=0n\333;\3730\337=\004\211\202=\235\257\231=\\2\210\275\215\005\322\273]\"\006\275\241\265\362=\006\267\313=\307\375\033=\316u\331<\373[\327\274/K\327\275#\235J\275\216\037n=\320R?<\2556\234<\224\370\266\2751\211\226=\221\240\365\272\202\261\337=\224\371l=\300\323\251\272\326\372L=\216,E\275\254\035[\275i\225\240\274\030\334\002\276 \243\024\276\303t\253=\235\231+=\351\372\\\275\356\014\305<|\022\244=\322\224x\275P\371\344=\205O\352\274\317)\200\274\036\304\350=\272;&\272\356\303x\275oh\225\273\255N+\276\")[<\207\032\375\275u\310\027=\036\036k\2732\330\017\276+\345\217\275\332\300\244<>]N\276A\177\362=\256\020-\275\351\304k\276\023B$\276\300\264/\274\227\266L>@\377\326\275\316\302\265=\005\256C\274~\234}\274\322\026\021=\370Q\016\276\377\316\313<,\352\244\275\220]\003\276\202\206\240\275b\2300>\260n\034\276K?J\276\217_\003=\357\323V\274\330\002\257\271(H6=\362\316X;x2K\275\354\217\370;\0214\002\273\214c\021><\007\374<\\+\231=\023S\246=\254k0\276\333\2473>\333O\215\275\035\254&\274,\252\n>\326\003\223\274$}\000\276\246\210\305=\376\375\211\276\265\273&\274\275\346\235\274Xv\304\275g\215a\275$\236\344=\363\275\000=\035!\271;M\311\003<\256U\272=\305$\355\275W\333n=\341\223\320<\365\006\311\273G\240\314=\253d\213>\3570\331=[\224\206\275\374\002\222\276?S$\276W\013\206\274\272\351\3719\240#\030=\344.A\275\224K\260\275\376)z\274@c\033\274|\351\004>\016\236\262\275\224\232\247\2751!h=\226\027\363\275\310\327\'\274\026\003\270\275Yj:=\274\035\016\275\356\367\325<\032\222J=d\273\337\274\033\377\312\274\351\321\332\274\361\357\237\275\2275\207<\236]J>dH\312=8\250\371\275p\305\273<\242\335\274\275\244\001\305\275j-#=f%\002>\263\026\007\276qoG=]\373\275=\274\347C=\256!\001\275\370\036A=\216w\003\275\277\313\201=wK\363=\200\375}=B\316\377\275\201\212G=Jl\326\275Xu\001\275B_\206>&\2300\274,W\207=<T\037\276\3346W=o\n\r\275\232\0326=\334\320\001=WT\024\276\373o\277\275\324\330d\275\210\370\221\275qZ\341=f\014\227\274\260\302\351\275\341\235\016>mP\270\274\260W\237<,}h\275<2\266\275\216\360\370=\305\356\250\275dbj>\304\305\210\275\004*\325=\347{\346=\217\357\003\276\332\220\033\276j\377\310=\021\266\273\275OhM\276z\316\272=L\243\271\275\235{\232=\245\222\000=\010\325\214;\005\022\003\276\277`q=\232\330\215\275\217f\253=\346\rm=[5!\276u\275\013\275\310.L<\263GM\275\332\031;>\233O\220=\272n\'=\303\3639:\200\n\221=\252\370\273\275\322\366\205=\365\316\226\274\347\251\246=\345{\263\275\025\221z\273\n\203\257=\233N\024\276\301\257V\274\014\314\263\273\271\n\210\275X\252\264\275\2651\201>\352\020\033\276\2728v=\025\327@=\\\266\035=|\212\247=Ch/\274\314;\326\275\305mg\274\312\316\367<\311?\343\2746\350\325\275\262M\262\275f>\200<wO\n>-T\324\274\347s\220\275\277\177f=} )\276}\270\270\273\272\220v>\237\224\315\275;\\C\275\245\251\266;\200\260\020>\210\006\315\274\354\\\272=\251u\256=\0317\245=kj\252\275\377\215\351=\2563\315\275*\366p\274\364\r\032>\210M\206\275\271j\017=3\271\356\275W\316\265=\254[N=l#+\275\352\376\361\275U\355F=/\354\256\274F\242i\275\326\375\205\275\342_(\2753,\277\275\303\201\204=\350\307\006\276H\365@\2761\306Y=B\242\333=\214D9\275\004\237\300;\022\306!=M\207\210=6\027=\274\360\374R\275\254\347\317\274\033\360\205\274\360\344\205\274\233\270\n<s\224\255\275\367\224W\275>61>\271*\235<Gc\216\275(\020\306\275\'%h\275\013\336V=\237a\004\276\232>\211=a\345j\275a\203\212\274u\314\344=\331\017\274\274\272q\342\274\205 \357;\353f\353<\360C\222\275%\214\014\275\330+X<\317\277\204\274\016j\241=\205\002\233\274\360\221\220\275&\001`\275\026%\243\275\276s\302\275(m\022=\327\016v\275\t:\'\275\360mg\275\372\024\241<\326{\027>\344\357\251=m3\234\275\027\335z=5\312\217=2\315\023=\354\363\244\274\310F\336=\014\312\320\275aO\332\274x5\240:{\030\207=\231\037\264=\3029\016\275j\034\314\275^\233\207\275zs\331\275\265\3718=\235\301\035=\016\323\005=\365\267\177=\350\271\265<V\212\231\275e5\343<\036\022\211=\234\270\242\275\356\226>=jm\023\276v\203_\2755\202\221\275\213\177\030=R\241l=\231\262\227=\214\221\306<\267\225\205=eq\014<\222\350\304=\376\354\205=\370\231\006>\333\303\256=\004\345\204\274\322\206\235<C\317\200=~}i\276\255\212\017>\367\272\010\276\305\3642\275(\010O\274\227\032Y<\360F\302\274Xp\033\276\200\242u\276\014\271\213<-\t\'=\254R\266\274\305\204\256=V%\334;D\023E\276\264\016p\275\331]A\275\274W2=\374\334P=\024\222\223\275\364!\023\275E \243\275~\t\273\2749\363\016\276\241K\204=\251\206A\2764\354\337\274(n\215=\361\353>\274\331 1\275+\275\n\2745W!\276\006\203\244\275\300\236\025\276\312\t\202=?\021G=\017-\013\276M\266\211=c\177\020>$4\320;W\r\331\275\330\334\303=d\371;\2759\206\371;\321\253\034\276\345\337\364=\033M\315\274{\254\243\275\377o>\275\337\314\235<\323\005\212=\241\t\206\275\351\361\266\274\314\327\035=}\200\222<\004D|=Tv\255=\205k\271\275p_\237=w\036\243=\252`\r<{\014\322=\022Ai=\211\325\204=\340T\211;\254h\305\272\350_a>y\245\362\275\347\237q\276\332\014\277<\305\036{\274\234\177C=_xR\275=a\367=\005c\t=\007\346D\273\302\033L=\256\300<\276\300\352\315\2752\221$>\304SF\276j\323\252<x\226\355\275\265~\263=B\313\200=\304\270\035<\247\226\025>\205}G\276r$\216=\276\345\3759V\347M\274\314\341\367\275V\037\024>7o\340=\006&,=y\363\226\275zQ\336=Dn-=+\375d<\023\326\007=\267\375\326\275__X\275\354\307g\2751\340Y=\t\213\367\2750\372L\275\201\351\031=\335\312U\275j,\014>\355\350\272\275F\303$=\374t-\2753cm<Ev\257=\310\330\212;\230\255\016=\321\361\"=v\007\023\276t\355%=\0026\034\276\217\320\223\274\376\254\001\276\210r\344=\0049_\276\001\200|=/\203\234\274\315\304\034\273\277\356\223>\240w$=\220\270x<W<\251=|\2655=0\025_=[>l\275\270(\231=\022\032\370\275\304N-=+\274X<)\245\326=\023\212\t>?\374Q\275\225\332k=7 \236\275\376\033u\275\2472,\276+H(\275\234\034\035>\323#\023\276\007m\321<\220\221\306\275\364\301\323\2758\333e\275\275W\020=\021\311\024\275\204\321\267=\216\350;\275:ie\273`\306\233=vq\r\276\004L\353<q\247\271\275\021\332\242\275\'\205\375=\361\331\t\275\242\036\310\274a\225\342=W\020\241\275\364.\200=\374\271\235=\366\027\361=\347\345\356\273x\226\037>\202\231|\275\274C;=\266\026\354\275\026\204C=A\277\026\275\013\3345\272\272\251,=\352\253u=Q\335\210=\177\254E>\215F\221\275;{\257<.\246\326:s\215W=\361*\221\275\362\237\337\275k\'\365;\014\276\001=\223Q\312;\320X\233\275\2160\001\275\253\\\345<}\206 \275f\014r\275B\221\263\275\037m\256=\277g.\275%\337\343\275\367\324\206=\276T\203\275\223\363N\276\\uz<2\322W;N\030\244=8m\303=\300\316\244<8<Y=M!\260\275\240\213\230\274Hx9=u\345\311;\307\260{\275\320d\017\275\302\032\030\275r\357\266\275z\t\023>\377\242\313\273\352\255Q\272Xj\255=\212v\300=&\334\264\275)\010\t=[Q\307\275\037FL\275U\314U={\212\020>}EE=?\213\025>\036X\002\276C5;\275nk\303<\3601\333<\237\030\035\276\274]\330\275\242\202\003>\n*\262\275\210\263\177=\206\243\226\275\203f\016\274\332\270A\2769\232\212\274/\3561=\243\'\201<F\306\217\275\313\001X\276e\243\357<\201\277\326=\212Ne=4\365\006\274\314\3174\275\226\3673>M\017\357=\021\352X>>r\364\274h\216\003>Uk^\276PW\240=1\235Q=\337\256\375\275[\250\241\275\247R.\276\000g0=i\237\017>f\351!=#T\275\275\330\340\025>\322;\'\275\323\365\216\273M\235\265\274\373\'$>\254\240@\275;]\322\275\302r\343=\300f\003\276\251gW=\306\211\333\275\350\222Z\275O:\266\275\362\033\222=\277JZ\276\224\251\323\275R\307z\274\366\333D=n)T;\375[K\276(L\247\275\250\213\235=\363\017\001>\332=\033=V\014\007=0\265~\275\n\201\216\274\365T>=7\327\205=1)l\275\360N\233\275\270\346y\275\245\223\370=\005\027\313;\256QD\275\241\276\231\272\257U\352<$\002:\275Wf\351=\343h\034\275\300\323j=J~\213\274\301t\340=\374m~\2752\273\214\275n\340\266\274%\376\340=G\330\367=\r\376\200\275\035\225\260=\033\322K\275\262+\342\272v\304\177<\243\307\356\275\347{\207\275\252\362\337=\335\330\202\275\2279\024\275\\\356\241=\242\361\301\275o-\342=M\273\013=\221J\020=i\004\024=\244\257\n>\272\246\244=kc5><)v\275\031\312\340\273-yC\276j\371\200<\340\317\254\275\2664k<\366\206\270=\2043\343\272]\\\211=\\\375\243\275\303\204<\276\207\305\017\276\265\223\030=\303\206\021\276B\nN=\013\377\210\276\271D\312\274\231\325H\274$m\\=\316x\365\274d\204\216<\322\242\216=D\034C<\t\2375\276#\020\245=\266\351\343=\366?\321;YB\306=Z\246C=\022\257\267\275\013Sq\274\343|,;g\220y\275\307\000\254\273\2063`>\235\r0=\346\240\313<\213\373\315=\270\227$\276\275\214M\275\004qO=\335 \t>=\241\201<M\264\235=!\355_\275\365#\316\275\236l6\275\301\035h\275\264\036\313\274\035qX\275-\377\357<\225\025\363=\225.\016\273\235*\345=:\260&>\034\301\222=\241%\264\275\367\214\225\275\323\036\217\274\233\024\225<\2047\244\2755\333\314\274\305\212\037\275\330\233\037>\343\256\264\275R\3253\275X\024Q\275\250\035\301\274\246\375/=\341\0100=\2672F=\010\352\315=\367\027U=s\350\222=\337\334\225\2744\266\312<}\230\321\275\253\235\300\274X)\207=\354\346\301=\225\236\237\275\202|Q\276\370\261\353\273\007&\000\276+<\302\275Y\021%\276\365I\206=<\321\320=\375\302\215=.\005*=I\260\221\273\345)O=\221 \326=\274R\010>\215\374\035<\013\251\243\273\261B\223=\005\037w\273l\2648=D\017\014>\333\3129\270\313=*\276,&~\275m\360\206\275\3257\233=\216q\032\275U\013\332=\351\323\301\275\363\2568={\375\007>\361N\252<j{\346\275e\215\020=D34\275\231\014\300\275\376\'\357\275\307\230\t\276\007\307\327<0w#<{\276\376=\332%+\276ee\362=\031\364S\275\221\262\314\275\177\001T\275\254\350\357\274\236\006X=b\350\362\275\332\001\347\274\026\265\032\276\006z\014\276\323:#\276Y\255k>y@\324\275\241\207\">A\324\300\275\226\254\200\274:3\232\274E\357h\274\026O\206=\252\315\254<a\265\313\274\346\027\020=\275I\236=\r\025\301=\266A\337\273\242\315\326\275\271LM;$\302v<\311\357\323\275c\022S=\275\302\031=\n\374\221\275:Dm<KcT>\357\004\376=\203\341\304=[\224\340\275!ip\276m\316\313<\332\331\027>\241J\202= \210\006>\310\346\221\275\246\313\317=\242\013\233=\212\207\230=\265\276\'\275\253\313\227=\337\207\206\2750\261\006>u\"\016>R\357\203\275Q\262\271=\323$4="
      }
    }
  }
}
node {
  name: "Assign_30"
  op: "Assign"
  input: "fc7/weights"
  input: "Assign_30/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Assign_31/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        tensor_content: "\026\r\262>\214`\306=\204\216R>\201\216\304>3\301\003?9\263\026>]6\356\275q\311\005\277\217\010V\276\370\215\255\276"
      }
    }
  }
}
node {
  name: "Assign_31"
  op: "Assign"
  input: "fc7/biases"
  input: "Assign_31/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc7/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_1"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_2/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_2"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_2/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_3/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_3"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_3/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_4/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_4"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_4/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_5/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_5"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_5/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_6/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_6"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_6/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_7/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_7"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_7/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_8/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_8"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_8/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_9/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_9"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_9/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_10/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_10"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_10/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_11/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_11"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_11/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_12/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_12"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_12/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_13/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_13"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_13/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_14/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_14"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_14/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_15/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_15"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_15/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_16/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_16"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_16/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_17/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_17"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_17/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_18/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_18"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_18/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_19/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_19"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_19/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_20/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_20"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_20/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_21/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_21"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_21/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_22/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_22"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_22/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_23/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_23"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_23/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_24/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_24"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_24/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_25/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_25"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_25/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_26/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_26"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_26/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_27/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_27"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_27/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_28/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_28"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_28/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_29/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_29"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_29/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_30/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_30"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_30/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_31/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_31"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_31/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_32/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_32"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_32/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_33/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_33"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_33/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_34/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_34"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_34/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_35/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_35"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_35/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_36/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_36"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_36/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_37/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_37"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_37/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_38/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_38"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_38/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_39/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_39"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_39/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_40/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_40"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_40/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_41/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_41"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_41/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_42/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_42"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_42/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_43/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_43"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_43/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_44/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_44"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_44/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_45/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_45"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_45/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_46/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_46"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_46/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_47/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_47"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_47/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_48/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_48"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_48/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_49/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_49"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_49/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_50/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_50"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_50/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_51/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_51"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_51/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_52/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_52"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_52/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_53/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_53"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_53/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_54/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_54"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_54/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_55/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_55"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_55/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_56/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_56"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_56/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_57/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_57"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_57/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_58/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_58"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_58/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_59/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_59"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_59/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_60/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_60"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_60/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_61/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_61"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_61/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_62/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_62"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_62/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_63/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_63"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_63/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_64/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_64"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_64/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_65/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_65"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_65/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_66/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_66"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_66/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_67/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_67"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_67/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_68/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_68"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_68/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_69/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_69"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_69/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_70/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_70"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_70/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_71/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_71"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_71/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_72/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_72"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_72/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_73/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_73"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_73/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_74/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_74"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_74/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_75/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_75"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_75/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_76/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_76"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_76/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_77/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_77"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_77/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_78/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_78"
  op: "ArgMax"
  input: "Softmax"
  input: "ArgMax_78/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
versions {
  producer: 26
}

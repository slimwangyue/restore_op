IMAGE_SIZE=32
tflite_convert \
  --graph_def_file=./model_op.pb \
  --output_file=./optimized_graph.lite \
  --input_format=TENSORFLOW_GRAPHDEF \
  --output_format=TFLITE \
  --input_shape=1,${IMAGE_SIZE},${IMAGE_SIZE},3 \
  --input_array=input \
  --output_array=final_result \
  --inference_type=FLOAT \
  --input_data_type=FLOAT \
  --allow_custom_ops=True

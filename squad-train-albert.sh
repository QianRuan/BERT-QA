export SQUAD_DIR=./squadData
OUTPUT_DIR=albert-base-v2
cd squadOutput
mkdir $OUTPUT_DIR
cd ..
python ./transformers/examples/run_squad.py \
  --model_type albert \
  --model_name_or_path albert-base-v2 \
  --do_train \
  --do_eval \
  --version_2_with_negative \
  --train_file $SQUAD_DIR/train-v2.0.json \
  --predict_file $SQUAD_DIR/dev-v2.0.json \
  --per_gpu_train_batch_size 6 \
  --learning_rate 3e-5 \
  --num_train_epochs 2.0 \
  --max_seq_length 384 \
  --doc_stride 128 \
  --output_dir ./squadOutput/$OUTPUT_DIR/
  
#show eval results on dev data
python evaluate-v2.0.py ./squadData/dev-v2.0.json ./squadOutput/$OUTPUT_DIR/predictions_.json

#rename the tensorboard checkpoints
find ./runs -type d -name '*PCKI' -execdir mv {} $OUTPUT_DIR ';'

#delete intermediate results
find ./squadOutput/$OUTPUT_DIR -type d -name 'checkpoint*' -exec rm -r {} +

DATA_PATH="/path/to/your/data"
MODEL_PATH="/path/to/your/model"
OUTPUT_PATH="/path/to/your/output"

python3 baseline.py \
--model_path $MODEL_PATH \
--data_path $DATA_PATH \
--output_path $OUTPUT_PATH \
--max_length 2048 \
--max_new_tokens 200 \
--min_new_tokens 100 \
--batch_size 4

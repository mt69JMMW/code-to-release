OPENAI_API_KEY="your openai key"
DATA_PATH="/path/to/data"
BASE_MODEL_PATH="/path/to/base/model"
OUTPUT_PATH="/path/to/output"

python3 iter_refine_gpt.py \
--data_path $DATA_PATH \
--base_model_path $BASE_MODEL_PATH \
--save_path $OUTPUT_PATH \
--openai_api_key $OPENAI_API_KEY \
--max_length 2048 \
--feedback_max_length 512 \
--threshold 0.5 \
--num_beams 2 \
--num_correction_steps 4 \
--correction_batch_size 4

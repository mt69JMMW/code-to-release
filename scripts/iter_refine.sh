DATA_PATH="/path/to/data"
BASE_MODEL_PATH="/path/to/base/model"
FEEDBACK_MODEL_PATH="/path/to/feedback/model"
LORA_PATH="/path/to/feedback/model/lora/weights"
OUTPUT_PATH="/path/to/output"

python3 iter_refine_on_feedback.py \
--data_path $DATA_PATH \
--base_model_path $BASE_MODEL_PATH \
--feedback_model_path $FEEDBACK_MODEL_PATH \
--lora_path $LORA_PATH \
--save_path $OUTPUT_PATH \
--max_length 2048 \
--feedback_max_length 512 \
--threshold 0.5 \
--num_beams 2 \
--num_correction_steps 6 \
--correction_batch_size 4

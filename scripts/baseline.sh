DATA_PATH="/mnt/data/zekai/generator_data.json"
MODEL_PATH="/mnt/data/zekai/llama2-7b-hf"
OUTPUT_PATH="llama2-7b-baseline_results.json"

nohup python3 baseline.py \
--model_path $MODEL_PATH \
--data_path $DATA_PATH \
--output_path $OUTPUT_PATH \
--max_length 2048 \
--max_new_tokens 200 \
--min_new_tokens 100 \
--batch_size 4 \
> logs/baseline_llama2_20231213.log 2>&1 &
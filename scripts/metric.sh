#!/bin/bash

MODEL_PATH="/mnt/data/zekai/flan-t5-large-squad2"
DATA_PATH="/mnt/data/zekai/generator_data_qasper.json"
PREDICTION_PATH="/mnt/data/zekai/iter_refine_qasper_flan_t5_900.json"
SAVE_PATH="iter_refine_qasper_flan_t5_qags_scores.json"
QG_MODEL_PATH="lmqg/t5-large-squad-qg"

nohup python3 metrics.py \
--model_path $MODEL_PATH \
--data_path $DATA_PATH \
--prediction_path $PREDICTION_PATH \
--save_path $SAVE_PATH \
--max_new_tokens 100 \
--num_beams 2 \
--n_questions 20 \
--qg_model_path $QG_MODEL_PATH \
--from_refine "True" \
> logs/metrics_iter_refine_qasper_flan_t5_20230201.log 2>&1 &
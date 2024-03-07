#!/bin/bash

MODEL_PATH="/mnt/data/zekai/flan-t5-large-squad2"
DATA_PATH="/path/to/data"
PREDICTION_PATH="/path/to/prediction"
SAVE_PATH="/path/to/saved/scores"
QG_MODEL_PATH="lmqg/t5-large-squad-qg"

python3 metrics.py \
--model_path $MODEL_PATH \
--data_path $DATA_PATH \
--prediction_path $PREDICTION_PATH \
--save_path $SAVE_PATH \
--max_new_tokens 100 \
--num_beams 2 \
--n_questions 20 \
--qg_model_path $QG_MODEL_PATH \
--from_refine "True"

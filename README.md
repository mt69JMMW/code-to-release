# ISQA: Informative Factuality Feedback for Scientic Summarization

This is the repo for ACL 2024 submission *ISQA: Informative Factuality Feedback for Scientic Summarization*.

## Getting Started

Download the repo:

```bash
git clone https://github.com/mt69JMMW/code-to-release.git
cd code-to-release
```

Setup the environment

```bash
pip install -r requirements.txt
```

**Datasets will be released soon**.

## ISQA

### Fine-tune Feedback Model

To fine-tune a customized feedback model, run

```bash
TOT_CUDA="0,1,2,3"
CUDAs=(${TOT_CUDA//,/ })
CUDA_NUM=${#CUDAs[@]}
PORT="12345"

DATA_PATH="/path/to/your/data"
OUTPUT_PATH="/path/to/saved/weights"
MODEL_PATH="/.path/to/model"

CUDA_VISIBLE_DEVICES=${TOT_CUDA} torchrun --nproc_per_node=$CUDA_NUM --master_port=$PORT finetune.py \
--data_path $DATA_PATH \
--output_path $OUTPUT_PATH \
--model_path $MODEL_PATH \
--eval_steps 200 \
--save_steps 200 \
```

This is encapsulated in `scripts/finetune.sh`

### Baseline

To get zero-shot summarization results on the dataset, run

```bash
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
```

This is encapsulated in `scripts/baseline.sh`

### Iterrative Refinement on ISQA

To employ ISQA feedback for ehancing the summarization factuality, please run

```bash
DATA_PATH="/path/to/your/data"
BASE_MODEL_PATH="/path/to/your/base/llm"
FEEDBACK_MODEL_PATH="/path/to/your/feedback/llm"
LORA_PATH="/path/to/your/feedback/model/lora/weights"
OUTPUT_PATH="/path/to/your/output"

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
```

This is encapsulated in `scripts/iter_refine.sh`

### Evaluation

To evaluate the factuality of either baseline or refined summaries, run

```bash
MODEL_PATH="sjrhuschlee/flan-t5-large-squad2"
DATA_PATH="/path/to/your/data"
PREDICTION_PATH="/path/to/your/output"
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
--from_refine "True" # "False" for baseline
```

This is encapsulated in `scripts/metric.sh`


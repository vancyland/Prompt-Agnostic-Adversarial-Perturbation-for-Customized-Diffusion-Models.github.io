
export MODEL_PATH="./stable-diffusion/stable-diffusion-v1-5"

export PERSON_DIR="data/n000050"
export CLEAN_ADV_DIR="$PERSON_DIR/set_B"
export OUTPUT_DIR="outputs/$PERSON_DIR"
export DREAMBOOTH_OUTPUT_DIR="outputs/$PERSON_DIR"
export CLASS_DIR="data/class-person"

accelerate launch attack/papv1.py \
  --pretrained_model_name_or_path=$MODEL_PATH  \
  --enable_xformers_memory_efficient_attention \
  --instance_data_dir_for_train=$CLEAN_ADV_DIR \
  --instance_data_dir_for_adversarial=$CLEAN_ADV_DIR \
  --instance_prompt="a photo of sks person" \
  --class_data_dir=$CLASS_DIR \
  --num_class_images=200 \
  --class_prompt="a photo of person" \
  --output_dir=$OUTPUT_DIR \
  --center_crop \
  --with_prior_preservation \
  --prior_loss_weight=1.0 \
  --resolution=512 \
  --train_text_encoder \
  --train_batch_size=4 \
  --max_train_steps=5 \
  --max_adv_train_steps=10 \
  --checkpointing_iterations=4 \
  --learning_rate=5e-7 \
  --pgd_alpha=5e-3 \
  --pgd_eps=5e-2 \
  --mixed_precision=bf16

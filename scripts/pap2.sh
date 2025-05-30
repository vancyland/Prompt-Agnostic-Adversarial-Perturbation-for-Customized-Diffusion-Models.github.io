export MODEL_PATH="./stable-diffusion/stable-diffusion-v1-5"

export PERSON_DIR="data/n000050"

export MODEL="Hessen"

export CLEAN_TRAIN_DIR="$PERSON_DIR/set_A"
export CLEAN_ADV_DIR="$PERSON_DIR/set_B"
#export OUTPUT_DIR="outputs/$EXPERIMENT_NAME/$PERSON_DIR/$MODEL"
export OUTPUT_DIR="outputs/$MODEL/$PERSON_DIR"
export DREAMBOOTH_OUTPUT_DIR="outputs/DreamboothMoel/$MODEL/$PERSON_DIR"

#export OUTPUT_DIR="outputs/pgd/n000050"
export CLASS_DIR="data/class-person"

export images_folder="$PERSON_DIR" \
export images_folder2="$DREAMBOOTH_OUTPUT_DIR/checkpoint-1000/dreambooth"


# ------------------------- Train ASPL on set B -------------------------
mkdir -p $OUTPUT_DIR
cp -r $CLEAN_TRAIN_DIR $OUTPUT_DIR/image_clean
cp -r $CLEAN_ADV_DIR $OUTPUT_DIR/image_before_addding_noise

python attacks/aspl.py \
  --pretrained_model_name_or_path=$MODEL_PATH  \
  --enable_xformers_memory_efficient_attention \
  --instance_data_dir_for_train=$CLEAN_TRAIN_DIR \
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
  --max_train_steps=20 \
  --max_f_train_steps=0 \
  --max_adv_train_steps=6 \
  --checkpointing_iterations=10 \
  --learning_rate=5e-7 \
  --pgd_alpha=5e-3 \
  --pgd_eps=5e-2 \
  --mixed_precision=bf16



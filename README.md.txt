Environment setup
cd PAP-codes
conda create -n pap python=3.9  
conda activate pap 
pip install -r requirements.txt 

How to run
1.Go to the HuggingFace website at https://huggingface.co/runwayml/stable-diffusion-v1-5/tree/main and follow the instructions to download the model weights. Place the downloaded weights in the directory ".\codes\stable-diffusion\stable-diffusion-v1-5".
2.Upload your own data or use a public dataset. Modify the "PERSON_DIR" in the "pap.sh" file to the parent path of your images and CLEAN_ADV_DIR as the path of your images. Also, modify the "instance_prompt" to provide a rough description of your images. Finally, run the "pap.sh" file to generate adversarial examples.
3.Run "dreambooth.sh" to fine-tune the generated adversarial examples. Choose inference prompts related to your images and modify the INSTANCE_DIR, observing the customized synthesized images under different prompts.
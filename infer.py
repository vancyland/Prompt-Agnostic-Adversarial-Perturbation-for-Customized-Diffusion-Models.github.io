import argparse
import os
import torch
from diffusers import StableDiffusionPipeline

parser = argparse.ArgumentParser(description="Inference")
parser.add_argument(
    "--model_path",
    type=str,
    default="",
    #required=True,
    help="Path to pretrained model or model identifier from huggingface.co/models.",
)
parser.add_argument(
    "--output_dir",
    type=str,
    default="./test-infer/",
    help="The output directory where predictions are saved",
)

args = parser.parse_args()

if __name__ == "__main__":
    os.makedirs(args.output_dir, exist_ok=True)

    prompts = ["a sks painting",
               "a photo of person in the style of sks painting",
               "a photo of lion in the style of sks painting",
               "a sks painting of tree",
               "a photo of sunflower in the style of sks painting",
               "a photo of a modern building in the style of sks painting",
               "a photo of dog in the style of sks painting",
               "a photo of robot mechine in the style of sks painting",
               "a sks painting of a starry night",
               "a photo of the Mona Lisa in the style of sks painting"
               ]
        # create & load model
    pipe = StableDiffusionPipeline.from_pretrained(
        args.model_path,
        torch_dtype=torch.float16,
        safety_checker=None,
        local_files_only=True,
    ).to("cuda")

    for prompt in prompts:
        print(">>>>>>", prompt)
        norm_prompt = prompt.lower().replace(",", "").replace(" ", "_")
        out_path = f"{args.output_dir}/{norm_prompt}"
        os.makedirs(out_path, exist_ok=True)
        for i in range(1):
            images = pipe([prompt] * 8, num_inference_steps=100, guidance_scale=7.5).images
            for idx, image in enumerate(images):
                image.save(f"{out_path}/{i}_{idx}.png")
    del pipe
    torch.cuda.empty_cache()


# Official PyTorch implementation of "PAP：Prompt-Agnostic Adversarial Perturbation for Customized Diffusion Models"  (NIPS'24)
<a href="https://vancyland.github.io/PAP.github.io/"></a>
<a href="https://www.arxiv.org/abs/2408.10571"></a>


<div align="center">
  
  <a href="https://github.com/vancyland" target="_blank">Cong Wan</a> &emsp;
  <a href="https://scholar.google.com.hk/citations?user=9VCIiVcAAAAJ&hl=zh-CN" target="_blank">Yuhang He</a> &emsp;
  <a href="https://scholar.google.com.hk/citations?hl=zh-CN&user=DnNdGckAAAAJ" target="_blank">Xiang Song</a> &emsp;
  <a href="https://scholar.google.com.hk/citations?user=x2xdU7gAAAAJ&hl=zh-CN" target="_blank">Yihong Gong</a>
  <br> <br>
  
  <a > Xi'an Jiaotong University</a>
</div>
<br>

<div align="center">
    <img width="1000" alt="pipe" src="assets/fig1.2.png"/>
</div>






> **Abstract**: Diffusion models have revolutionized customized text-to-image generation, allowing for efficient synthesis of photos from personal data with textual descriptions. However, these advancements bring forth risks including privacy breaches and unauthorized replication of artworks. Previous researches primarily center around using “prompt-specific methods” to generate adversarial examples to protect personal images, yet the effectiveness of existing methods is hindered by constrained adaptability to different prompts.
In this paper, we introduce a Prompt-Agnostic Adversarial Perturbation (PAP) method for customized diffusion models. PAP first models the prompt distribution using a Laplace Approximation, and then produces prompt-agnostic perturbations by maximizing a disturbance expectation based on the modeled distribution.
This approach effectively tackles the prompt-agnostic attacks, leading to improved defense stability.
Extensive experiments in face privacy and artistic style protection, demonstrate the superior generalization of PAP in comparison to existing techniques. 



Details of algorithms and experimental results can be found in [our following paper](https://www.arxiv.org/abs/2408.10571):
```bibtex
@article{wan2024prompt,
  title={Prompt-Agnostic Adversarial Perturbation for Customized Diffusion Models},
  author={Wan, Cong and He, Yuhang and Song, Xiang and Gong, Yihong},
  journal={arXiv preprint arXiv:2408.10571},
  year={2024},
}
```
The project page can be found at: https://vancyland.github.io/PAP.github.io/


##### Table of contents
1. [Environment setup](#environment-setup)
2. [How to run](#how-to-run)



## Environment setup

Our code relies on the [diffusers](https://github.com/huggingface/diffusers) library from Hugging Face 🤗 and Anti-DB(https://github.com/VinAIResearch/Anti-DreamBooth).

Install dependencies:
```shell
cd PAP
conda create -n PAP python=3.9  
conda activate PAP  
pip install -r requirements.txt  
```

Pretrained checkpoints of different Stable Diffusion versions can be **downloaded** from provided links in the table below:
<table style="width:100%">
  <tr>
    <th>Version</th>
    <th>Link</th>
  </tr>
  <tr>
    <td>2.1</td>
    <td><a href="https://huggingface.co/stabilityai/stable-diffusion-2-1-base">stable-diffusion-2-1-base</a></td>
  </tr>
  <tr>
    <td>1.5</td>
    <td><a href="https://huggingface.co/runwayml/stable-diffusion-v1-5">stable-diffusion-v1-5</a></td>
  </tr>
  <tr>
    <td>1.4</td>
    <td><a href="https://huggingface.co/CompVis/stable-diffusion-v1-4">stable-diffusion-v1-4</a></td>
  </tr>
</table>

Please put them in `./stable-diffusion/`. 

## How to run

To defense Stable Diffusion version 1.5 (default) with PAP, you can run
```bash
bash scripts/PAP.sh
```

Inference: generates examples with multiple-prompts
```
python infer.py --model_path <path to DREAMBOOTH model>/checkpoint-1000 --output_dir ./test-infer/
```

Thanks Anti-DB(https://github.com/VinAIResearch/Anti-DreamBooth) for their open-source. Our codes are mainly built on them.














#!/usr/bin/env bash

# echo hello from start script
# apt-get update
# apt-get install ffmpeg libsm6 libxext6  -y
# git clone https://github.com/CompVis/stable-diffusion.git
# cd ~/stable-diffusion/
# conda env create -f environment.yaml
# conda activate ldm
# curl https://storage.googleapis.com/vast-sd/sd-v1-4.ckpt > sd-v1-4.ckpt



wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.ckpt
git clone https://github.com/huggingface/diffusers

pip install git+https://github.com/huggingface/diffusers
pip install -U -r diffusers/examples/dreambooth/requirements.txt
pip install OmegaConf
pip install werkzeug==2.0.0
pip install markupsafe==2.0.1
pip install pytorch_lightning==1.7.7

mkdir model_diffs
python /root/diffusers/scripts/convert_original_stable_diffusion_to_diffusers.py --checkpoint_path /root/model/v1-5-pruned.ckpt --dump_path /root/model_diffs > t.txt 2>&1

mkdir custom_model


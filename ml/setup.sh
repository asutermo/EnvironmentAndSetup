#!/bin/sh

export CUDA_MAJOR=11
export CUDA_MINOR=7
export CUDA_VERSION=117
export CUDA_MAKE="cuda11x"

export LD_LIBRARY_PATH="/home/$USER/anaconda3/lib:$LD_LIBRARY_PATH"

# Setup a much faster solver for Anaconda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba

conda env create -f environment.yml
conda activate diffusion-experiments

export PATH="/usr/local/cuda-$CUDA_MAJOR.$CUDA_MINOR/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-$CUDA_MAJOR.$CUDA_MINOR/lib64:$LD_LIBRARY_PATH"

git clone https://github.com/timdettmers/bitsandbytes.git
cd bitsandbytes

# CUDA_VERSIONS in {110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 120}
# make argument in {cuda110, cuda11x, cuda12x}
# if you do not know what CUDA you have, try looking at the output of: python -m bitsandbytes
make $CUDA_MAKE
python setup.py install
cd ..

git clone https://github.com/huggingface/diffusers
cd diffusers
pip install -e .
cd ..

git clone https://github.com/KohakuBlueleaf/LyCORIS
cd LyCORIS
pip install -e .

cd ..
accelerate config default
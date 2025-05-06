#!/bin/bash

cd ~

# https://docs.conda.io/projects/conda/en/24.9.x/user-guide/install/linux.html
# https://conda-forge.org/download/
# https://github.com/conda-forge/miniforge?tab=readme-ov-file#install
# https://stackoverflow.com/questions/60532678/what-is-the-difference-between-miniconda-and-miniforge

# https://github.com/conda-forge/miniforge/releases/tag/24.11.0-0
# curl -L -o forge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
curl -L -o forge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/download/24.11.0-0/Miniforge3-Linux-x86_64.sh

# MAMBA IS DEPRECATED; MAMBA already included; PyPy is DEPRECATED
# https://conda-forge.org/news/2024/07/29/sunsetting-mambaforge/
# https://conda-forge.org/news/2024/08/14/sunsetting-pypy/
# curl -L -o forge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/download/24.11.0-0/Miniforge-pypy3-Linux-x86_64.sh
# curl -L -o forge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/download/24.11.0-0/Mambaforge-Linux-x86_64.sh
# curl -L -o forge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/download/24.11.0-0/Mambaforge-pypy3-Linux-x86_64.sh

bash forge3-Linux-x86_64.sh

rm forge3-Linux-x86_64.sh

# https://dev.to/worldlinetech/a-guide-to-nodejs-notebooks-410c
# conda install -c conda-forge jupyter
conda activate base
# conda install -c conda-forge jupyter ipykernel
conda install nodejs
npm install -g ijavascript
ijsinstall

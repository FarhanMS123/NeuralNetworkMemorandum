#!/bin/bash

cd ~

# https://docs.conda.io/projects/conda/en/24.9.x/user-guide/install/linux.html
# https://conda-forge.org/download/
# https://github.com/conda-forge/miniforge?tab=readme-ov-file#install
# https://stackoverflow.com/questions/60532678/what-is-the-difference-between-miniconda-and-miniforge
curl -L -o Miniforge3-Linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh

rm Miniforge3-Linux-x86_64.sh
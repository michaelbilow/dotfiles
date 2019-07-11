#!/bin/bash

installBilow() {
    filename="$1.sh"
    curl -fsSL "https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install/${filename}" -o "$filename"
    sudo sh $filename
    rm $filename
}

# Install tensorflow python
PYTHON_VERSION=3.6
env
rm -rf $conda_dir/envs/tf
conda create -n tf -y python=$PYTHON_VERSION

conda install -n tf -y \
  tensorflow-gpu \
  numpy \
  pandas \
  scipy \
  scikit-learn \
  openpyxl \
  xlrd \
  jupyter \
  plotly \
  matplotlib \
  beautifulsoup4 \
  h5py 


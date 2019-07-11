#!/bin/bash
$machine=$1
conda_dir=$HOME/miniconda
curl https://repo.continuum.io/miniconda/Miniconda3-latest-$machine-x86_64.sh > miniconda.sh
bash miniconda.sh -b -p $conda_dir
rm miniconda.sh
$conda_dir/bin/conda init
conda update -n base -c defaults -y conda
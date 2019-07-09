#!/bin/bash

# Install conda and anaconda python
if [[ -z $(which conda) ]]
then 
    conda_dir=$HOME/miniconda
    curl https://repo.continuum.io/miniconda/Miniconda3-latest-$machine-x86_64.sh > miniconda.sh
    bash miniconda.sh -b -p $conda_dir
    rm miniconda.sh
    $conda_dir/bin/conda init
else 
    conda_dir=$(dirname $(dirname $(which conda)))
fi

source $conda_dir/etc/profile.d/conda.sh

conda update -n base -y -c defaults conda

# Install work python
PYTHON_VERSION=3.6
rm -rf $conda_dir/envs/work
conda create -n work -y python=$PYTHON_VERSION
conda activate work

conda install -y \
  numpy pandas scipy scikit-learn \
  openpyxl xlrd jupyter \
  plotly matplotlib \
  beautifulsoup4 h5py 

conda install -c conda-forge -y \
  jupyter_console \
  chartify ipywidgets \
  ipywebrtc pythreejs ipyleaflet \
  bqplot qgrid fire \
  voila cookiecutter geopandas \
  fiona shapely jaydebeapi altair \
  vega_datasets nodejs pyarrow
  
pip install -U cookiecutter

pip install -U --pre jupyterlab # need jupyterlab >=1.0.0


jupyter labextension install \
     @jupyter-widgets/jupyterlab-manager \
     @jupyter-widgets/jupyterlab-sidecar \
     @jupyterlab/geojson-extension \
     @jupyterlab/latex \
     @jupyterlab/plotly-extension \
     @jupyterlab/toc \
     @jupyterlab/vega2-extension \
     @jupyterlab/vega3-extension \
     jupyterlab_bokeh \
     jupyter-leaflet \
     qgrid

conda deactivate

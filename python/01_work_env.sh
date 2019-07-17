# Install work python
PYTHON_VERSION=3.6
rm -rf $conda_dir/envs/work
$conda_dir/bin/conda create -n work -y python=$PYTHON_VERSION

$conda_dir/bin/conda install -n work -y \
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
  h5py \
  dask

$conda_dir/bin/conda install -n work -c conda-forge -y \
  jupyter_console \
  jupyterlab \
  chartify \
  ipywidgets \
  ipywebrtc \
  pythreejs \
  ipyleaflet \
  bqplot \
  qgrid \
  fire \
  voila \
  geopandas \
  fiona \
  shapely \
  jaydebeapi \
  altair \
  vega_datasets \
  nodejs \
  pyarrow \
  boto3
  
$conda_dir/envs/work/bin/pip install -U cookiecutter

$conda_dir/envs/work/bin/jupyter labextension install \
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

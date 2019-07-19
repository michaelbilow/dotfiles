export condaDir="/opt/conda"

export basicCondaDeps=$(cat <<EOF
    numpy \
    pandas \
    scipy \
    scikit-learn \
    openpyxl \
    xlrd \
    beautifulsoup4 \
    h5py \
    dask \
    jupyter_console \
    jupyterlab \
    jupyter \
    matplotlib \
    plotly
EOF
)

export basicCondaForgeDeps=$(cat <<EOF
    nodejs \
    pyarrow \
    boto3 \
    chartify
EOF
)

export workJupyterLabextensions=$(cat <<EOF
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
EOF
)

export workCondaForgeDeps=$(cat <<EOF
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
    cookiecutter
EOF
)

export tensorflowCondaDeps=$(cat <<EOF
    tensorflow-gpu
EOF
)

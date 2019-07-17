# Install tensorflow python
condaDir=$1
hasNvidia=$3
if [[ $hasNvidia == "y" ]]
then
    PYTHON_VERSION=3.6
    rm -rf $condaDir/envs/tf
    $condaDir/bin/conda create -n tf -y python=$PYTHON_VERSION

    $condaDir/bin/conda install -n tf -y \
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
fi

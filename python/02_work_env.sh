# Install work python
PYTHON_VERSION=3.6
rm -rf $condaDir/envs/work
$condaDir/bin/conda create -n work -y python=$PYTHON_VERSION

$condaDir/bin/conda install -n work -y \
    $basicPythonDeps

$condaDir/bin/conda install -n work -c conda-forge -y \
    $workCondaForgeDeps

$condaDir/envs/work/bin/jupyter labextension install \
    $workJupyterLabextensions



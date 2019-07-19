# Install work python
PYTHON_VERSION=3.6
envName=work
rm -rf $condaDir/envs/$envName
$condaDir/bin/conda create -n $envName -y python=$PYTHON_VERSION

$condaDir/bin/conda install -n $envName -y \
    $basicCondaDeps

$condaDir/bin/conda install -n $envName -c conda-forge -y \
    $basicCondaForgeDeps \
    $workCondaForgeDeps

$condaDir/envs/$envName/bin/jupyter labextension install \
    $workJupyterLabextensions



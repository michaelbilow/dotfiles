if [[ $hasNvidia == "y" ]]
then
    PYTHON_VERSION=3.6
    envName=tf
    rm -rf $condaDir/envs/$envName
    $condaDir/bin/conda create -n $envName -y python=$PYTHON_VERSION

    $condaDir/bin/conda install -n $envName -y \
        $basicCondaDeps \
        $tensorflowCondaDeps
    
    $condaDir/bin/conda install -n $envName -c conda-forge -y \
        $basicCondaForgeDeps
fi

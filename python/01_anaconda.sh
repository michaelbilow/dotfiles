condaUrl="https://repo.continuum.io/miniconda/Miniconda3-latest-${distro}-x86_64.sh"
curl -fsSL $condaUrl > miniconda.sh
rm -rf $condaDir
bash miniconda.sh -b -p $condaDir
rm miniconda.sh
$condaDir/bin/conda init
$condaDir/bin/conda update -n base -c defaults -y conda

condaDir="$homedir/miniconda"
echo $condaDir
curl -fsSL https://repo.continuum.io/miniconda/Miniconda3-latest-$distro-x86_64.sh > miniconda.sh
bash miniconda.sh -b -p $condaDir
rm miniconda.sh
$condaDir/bin/conda init
$condaDir/bin/conda update -n base -c defaults -y conda

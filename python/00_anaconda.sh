conda_dir="$homedir/miniconda"
curl -fsSL https://repo.continuum.io/miniconda/Miniconda3-latest-$distro-x86_64.sh > miniconda.sh
bash miniconda.sh -b -p $conda_dir
rm miniconda.sh
$conda_dir/bin/conda init
$conda_dir/bin/conda update -n base -c defaults -y conda

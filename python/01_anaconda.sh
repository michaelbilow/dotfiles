conda_dir=$1
distro=$2
conda_url="https://repo.continuum.io/miniconda/Miniconda3-latest-${distro}-x86_64.sh"
echo $conda_url
curl -fsSL $conda_url > miniconda.sh
bash miniconda.sh -b -p $conda_dir
rm miniconda.sh
$conda_dir/bin/conda init
$conda_dir/bin/conda update -n base -c defaults -y conda

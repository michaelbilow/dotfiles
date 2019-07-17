conda_dir="${homedir}/miniconda"
conda_url="https://repo.continuum.io/miniconda/Miniconda3-latest-${distro}-x86_64.sh"
curl -fsSL $conda_url > miniconda.sh
rm -rf $conda_dir
bash miniconda.sh -b -p $conda_dir
rm miniconda.sh
$conda_dir/bin/conda init
$conda_dir/bin/conda update -n base -c defaults -y conda

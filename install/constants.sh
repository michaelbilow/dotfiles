unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export machine=$machine
export conda_dir=$HOME/miniconda

export linuxAndMac=$(cat <<EOF
    gcc \
    vim \
    curl \
    wget \
    git \
    ripgrep \
    less
EOF)

export linuxOnly=$(cat <<EOF
    dkms \
    build-essential \
    linux-headers-generic \
    ca-certificates \
    gnupg-agent \
    apt-transport-https \
    software-properties-common \
    openjdk-8-jdk \
    swig \
    xclip \
    xsel
EOF)

export macOnly=$(cat<<EOF
EOF)

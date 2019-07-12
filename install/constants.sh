unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export machine=$machine
export conda_dir=$HOME/miniconda

export linuxAndMac=<<EOF
    gcc \
    vim \
    curl \
    wget \
    git \
    ripgrep \
    less
EOF

export linuxOnly=<<EOF
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
EOF

export macOnly=<<EOF
EOF

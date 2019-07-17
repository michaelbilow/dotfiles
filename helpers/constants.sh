unameOut="$(uname -a | tr [:upper:] [:lower:] | tr -s ' ' | tr ' ' '_')"
case "${unameOut}" in
    *ubuntu*)    machine=ubuntu;;
    *linux*)     machine=linux;;
    *darwin*)    machine=mac;;
    *)           machine="UNKNOWN:${unameOut}"
esac

if [[ $machine == "linux" ]]
then
    if [[ ! $( command -v apt-get ) ]]
    then
        echo "This script only works for ubuntu linux"
        exit 1;
    else
        machine=ubuntu
    fi
fi

if [[ $machine == "ubuntu" ]]
then
    nvidia=$(lspci | tr '[:upper:]' '[:lower:]' | grep nvidia)
else
    nvidia=""
fi

case "$nvidia" in
    *nvidia*)   hasNvidia=y;;
    *)          hasNvidia=n
esac

if [[ $machine == "ubuntu" ]]
then 
    distro="Linux"
elif [[ $machine == "mac" ]]
then
    distro="MacOSX"
else
    exit 1
fi

export distro=$distro
export machine=$machine
export hasNvidia=$hasNvidia
export installLogfile="/tmp/$(date +%Y%m%d%H%M%S)_install.log"
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

export linuxAndMac=$(cat <<EOF
    gcc \
    vim \
    curl \
    wget \
    git \
    less \
    magic-wormhole \
    tmux \
    jq \
    gnupg \
    nodejs \
    npm
EOF
)

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
    xsel \
    sbt \
    systemd \
    keychain
EOF
)

export macOnly=$(cat <<EOF
    ripgrep \
    scala
EOF
)

export ubuntuApps=$(cat <<EOF
    slack \
    spotify \
    intellij-idea-community \
    aws-cli
EOF
)

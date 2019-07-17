unameOut="$(uname -v | tr [:upper:] [:lower:] | tr -s ' ' | tr ' ' '_')"
case "${unameOut}" in
    *linux*)     machine=ubuntu;;
    *darwin*)    machine=mac;;
    *)           machine="UNKNOWN:${unameOut}"
esac

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

export machine=$machine
export hasNvidia=$hasNvidia

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
    nodejs
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
    systemd
EOF
)

export macOnly=$(cat <<EOF
    ripgrep \
    scala
EOF
)

export ubuntuApps=$(cat <<EOF
    slack
    spotify
    intellij-idea-community
    aws-cli 
)

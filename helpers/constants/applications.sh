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
    aws-cli
EOF
)

export ubuntuDesktopApps=$(cat <<EOF
    slack \
    spotify \
    intellij-idea-community
EOF
)

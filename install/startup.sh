# Determine machine type

unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=MacOSX;;
        *)          machine="UNKNOWN:${unameOut}"
esac

linuxAndMac=<<EOF
    gcc \
    vim \
    curl \
    wget \
    git \
    ripgrep
EOF

linuxOnly=<<EOF
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

macOnly=<<EOF
EOF

installXCode () {
    xcode-select -p 1> /dev/null

    if [[ $? -ne 0 ]]
    then
        xcode-select --install
    fi
}

installBrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installDocker() {
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $(whomai)
    rm get-docker.sh
}

installBilow() {
    filename="$1.sh"
    curl -fsSL "https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install/${filename}" -o "$filename"
    sudo sh $filename
    rm $filename
}



# Install XCode Developer Tools and other mac dependencies
if [[ "$machine" = "MacOSX" ]]
then
    installXCode
    installBrew
    brew install 
        $linuxAndMac \
        $macOnly
    echo "Install Docker from https://hub.docker.com/editions/community/docker-ce-desktop-mac"
fi

# Install Linux dependencies
if [[ "$machine" = "Linux" ]] 
then
    sudo apt-get update -y

    sudo apt-get install -y \
        $linuxAndMac \
        $linuxOnly
    
    installDocker
fi

installBilow anaconda
installBilow work_env
installBilow tensorflow_env


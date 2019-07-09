# Determine machine type

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Install XCode Developer Tools if on Mac
if [[ "$machine" = "MacOSX" ]]
then
  xcode-select -p 1> /dev/null
  if [[ $? -ne 0 ]]
  then
    xcode-select --install
  fi
fi

# Install gcc if Linux
if [[ "$machine" = "Linux" ]] 
then
  sudo apt-get update -y
  sudo apt-get install -y gcc \
    vim \
    dkms \
    build-essential \
    linux-headers-generic \
    ca-certificates \
    gnupg-agent \
    curl \
    apt-transport-https \
    software-properties-common \
    openjdk-8-jdk \
    git \
    swig
fi


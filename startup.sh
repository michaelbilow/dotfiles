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
    git
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



# Install XCode Developer Tools and other mac dependencies
if [[ "$machine" = "MacOSX" ]]
then
  xcode-select -p 1> /dev/null
  
  if [[ $? -ne 0 ]]
  then
    xcode-select --install
  fi
  
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  brew install $linuxAndMac \
    $macOnly
fi

# Install Linux dependencies
if [[ "$machine" = "Linux" ]] 
then
  sudo apt-get update -y
  sudo apt-get install -y \
    $linuxAndMac \
    $linuxOnly
fi


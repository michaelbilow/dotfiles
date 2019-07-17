#!/bin/bash
set -veuo pipefail

# Determine machine type

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ $machine = "MacOSX" ]]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install \
        curl \
        unzip
else 
    apt-get update
    apt-get install -y \
        sudo \
        curl \
        gnupg \
        apt-utils \
        dialog \
        unzip
fi

dotfilesPath=/tmp/dotfiles
dotfilesZipPath="${dotfilesPath}.zip"
dotfilesUrl=https://github.com/michaelbilow/dotfiles/archive/master.zip

curl -fsSL $dotfilesUrl > $dotfilesZipPath
unzip $dotfilesZipPath -d $dotfilesPath
sudo bash -H $dotfilesPath/install.sh
sudo reboot

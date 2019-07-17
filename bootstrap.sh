#!/bin/bash
set -veuo pipefail

# Determine machine type

unameOut="$(uname -v | tr [:upper:] [:lower:] | tr -s ' ' | tr ' ' '_')"
case "${unameOut}" in
    *linux*)     machine=ubuntu;;
    *darwin*)    machine=mac;;
    *)           machine="UNKNOWN:${unameOut}"
esac


if [[ $machine = "mac" ]]
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

dotfilesPath="/tmp/dotfiles-master"
dotfilesZipPath="$dotfilesPath.zip"
dotfilesUrl=https://github.com/michaelbilow/dotfiles/archive/master.zip

curl -fsSL $dotfilesUrl > $dotfilesZipPath
unzip $dotfilesZipPath
sudo bash -H $dotfilesPath/install.sh
sudo reboot

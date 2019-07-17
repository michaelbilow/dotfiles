#!/bin/bash
set -veuo pipefail

# Determine machine type

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

if [[ $machine != "mac" && $machine != "ubuntu" ]]
then
    echo "Scripts only work for mac and ubuntu"
    exit 1
fi


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
        unzip \ 
        pciutils
fi

dotfilesPath="/tmp/dotfiles-master"
dotfilesZipPath="$dotfilesPath.zip"
dotfilesUrl=https://github.com/michaelbilow/dotfiles/archive/master.zip

curl -fsSL $dotfilesUrl > $dotfilesZipPath
unzip $dotfilesZipPath -d /tmp
sudo bash -H $dotfilesPath/install.sh
sudo reboot

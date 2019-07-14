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
        curl
else 
    apt-get update
    apt-get install -y \
        sudo \
        curl \
        gnupg \
        apt-utils \
        dialog
fi

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"
functionsPath=/tmp/functions.sh
constantsPath=/tmp/constants.sh
curl -fsSL "${bilowGithub}/functions.sh" > $functionsPath
curl -fsSL "${bilowGithub}/constants.sh" > $constantsPath
source $functionsPath
installBilow startup
if [[ ${1:-} = "-i" ]]
then
    installBilow interactive
fi
rm $functionsPath
rm $constantsPath

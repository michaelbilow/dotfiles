#!/bin/bash
set -ve

# Determine machine type

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export machine=$machine

if [[ $machine == "MacOSX" ]]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install curl
else 
    apt-get update && apt-get install -y sudo curl
fi

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"
functionsPath=/tmp/functions.sh
curl -fsSL "${bilowGithub}/bootstrap/functions.sh" -o $functionsPath
source $functionsPath

installBilow startup
rm $functionsPath
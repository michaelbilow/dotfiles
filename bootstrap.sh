#!/bin/bash
set -v

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

export bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"
curl -fsSL "https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install/bootstrap/functions.sh" -o /tmp/functions.sh
source /tmp/functions.sh

installBilow startup

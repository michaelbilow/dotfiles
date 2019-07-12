#!/bin/bash
set -ve

# Determine machine type

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ $machine = "MacOSX" ]]
then
    if [[ ! $(command -v brew) ]]
    then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    if [[! $(command -v curl) ]]
    then 
        brew install curl
    fi
else 
    apt-get update
    if [[ ! ($(command -v sudo) && $(command -v curl)) ]]
    then
        apt-get install -y sudo curl
    fi
fi

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"
functionsPath=/tmp/functions.sh
curl -fsSL "${bilowGithub}/bootstrap/functions.sh" > $functionsPath
source $functionsPath

installBilow startup
rm $functionsPath
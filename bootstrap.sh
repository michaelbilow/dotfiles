#!/bin/bash
set -v

# Determine machine type

unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=MacOSX;;
        *)          machine="UNKNOWN:${unameOut}"
esac

export $machine

if [[ $machine == "MacOSX" ]]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install curl
else 
    apt-get update && apt-get install sudo curl
fi

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

getBilow() {
    filename="$1.sh"
    curl -fsSL "${bilowGithub}/${filename}" -o $filename
    echo $filename
}

catBilow() {
    filename="$1.sh"
    curl "${bilowGithub}/${filename}"
}

installBilow() {
    filename=$(getBilow $1)
    shift
    chmod +x $filename
    sudo ./${filename} $@
    rm $filename
}

sourceBilow() {
    filename=$(getBilow $1)
    source $filename
    rm $filename
}

export -f getBilow
export -f catBilow
export -f installBilow
export -f sourceBilow

installBilow startup

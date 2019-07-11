#!/bin/bash

# Determine machine type

unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=MacOSX;;
        *)          machine="UNKNOWN:${unameOut}"
esac

export $machine

getBilow() {
    filename="$1.sh"
    curl -fsSL "https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install/${filename}" -o "/tmp/$filename"
    echo $filename
}

installBilow() {
    filename=$(getBilow shift)
    sudo sh $filename $@
    rm $filename
}

sourceBilow() {
    filename=$(getBilow $1)
    source $filename
    rm $filename
}

sourceBilow tools
installBilow startup
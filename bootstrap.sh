#!/bin/bash

# Determine machine type

unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=MacOSX;;
        *)          machine="UNKNOWN:${unameOut}"
esac

export $machine

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

getBilow() {
    filename="$1.sh"
    curl -fsSL "${bilowGithub}/${filename}" -o "/tmp/$filename"
    echo $filename
}

catBilow() {
    filename="$1.sh"
    curl "${bilowGithub}/${filename}"
}

installBilow() {
    filename=$1
    shift
    sudo sh $filename $@
    rm $filename
}

sourceBilow() {
    filename=$(getBilow $1)
    source $filename
    rm $filename
}

installBilow startup

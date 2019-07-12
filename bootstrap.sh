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
    inputFilename="$1.sh"
    outputFilename="/tmp/$filename"
    curl -fsSL "${bilowGithub}/${inputFilename}" -o $outputFilename
    echo $outputFilename
}

catBilow() {
    filename="$1.sh"
    curl "${bilowGithub}/${filename}"
}

installBilow() {
    filename=$(getBilow $1)
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

bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

getBilow() {
    filename="$1.sh"
    curl -fsSL "${bilowGithub}/${filename}" > $filename
    echo $filename
}

catBilow() {
    filename="$1.sh"
    curl "${bilowGithub}/${filename}"
}

installBilow() {
    filename=$(getBilow $1)
    sed -i "1s;^;source /tmp/functions.sh\nsource /tmp/constants.sh\n;" $filename
    shift
    chmod +x $filename
    sudo bash ${filename} $@
    rm $filename
}

constantsPath=/tmp/constants.sh

if [[ ! -f $constantsPath ]]
then
    mv $(getBilow constants) $constantsPath
fi

source $constantsPath

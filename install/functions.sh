bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

getBilow() {
    filename="$1.sh"
    echo $(curl -fsSL "${bilowGithub}/${filename}" -O)
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

if [[ ! -f constants.sh ]]
then
    mv $(getBilow constants) /tmp/
fi

source /tmp/constants.sh

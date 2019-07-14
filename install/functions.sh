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
    sed -i "1s;^;source /tmp/functions.sh\nsource /tmp/constants.sh\ninvertText \"\\n\\nStarting \$0 from $BASH_SOURCE\\n\\n\"\n;" $filename
    sed -e "\$a\ninvertText \"\\n\\nFinished \$0, returning to $BASH_SOURCE\\\n\\n"\n" $filename
    shift
    sudo bash ${filename} $@
    rm $filename
}

invertText() {
    echo -e "\e[7m$1\e[27m"
}

askYesNo() {
    read -p "$1 (y/N) "
    echo $REPLY | tr '[:upper:]' '[:lower:]' | head -c 1
}

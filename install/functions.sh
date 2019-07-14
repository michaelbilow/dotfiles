# Install Utilities
bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

getBilow() {
    filename="$1.sh"
    curl -fsSL "${bilowGithub}/${filename}" > $filename
    returncode=$?
    if [[ $returncode -ne 0 ]]
    then
        rm $filename
        log "$filename does not exist!"
        exit $returncode
    fi
    echo $filename
}

catBilow() {
    filename=$(getBilow $1)
    cat $filename
    rm $filename
}

installBilow() {
    filename=$(getBilow $1)
    addHeaderAndFooter $filename
    shift
    sudo bash ${filename} $@
    rm $filename
}

# Helper Utilities

invertText() {
    echo -e "\e[7m$1\e[27m"
}

log () {
    echo $1 >> $installLog
}

invertTextAndLog () {
    invertText $1
    log $1
}

askYesNo() {
    read -p "$1 (y/N) "
    echo $REPLY | tr '[:upper:]' '[:lower:]' | head -c 1
}

addHeaderAndFooter() {
    filename=$1
    HEADER="source /tmp/constants.sh\nsource /tmp/functions.sh\ninvertText \"\\n\\nStarting \$0 from $BASH_SOURCE\\n\\n\"\n;"
    FOOTER="\ninvertText \"\\n\\nFinished \$0, returning to $BASH_SOURCE\\n\\n\"\n"
    sed -i "1s;^;$HEADER" $filename
    sed -e "\$a$FOOTER" $filename
}

# Install Utilities

installFolder() {
    folderName=$1
    shift
    ls -d $folderName | xargs -O -I filename installBilow filename $@
}

installBilow() {
    filename=$1
    parentScript=$(getParentScript)
    shift
    invertTextAndLog "Starting $filename from $parentScript"
    sudo bash -H ${filename} $@
    invertTextAndLog "Finished $filename, returning to $parentScript"
}

# Helper Utilities

invertText() {
    echo -e "\e[7m$@\e[27m"
}

log () {
    echo "$@" >> $installLogfile
}

invertTextAndLog () {
    invertText $@
    log $@
}

askYesNo() {
    read -p "$@ (y/N) "
    echo $REPLY | tr '[:upper:]' '[:lower:]' | head -c 1
}

getParentScript() {
    echo $0
}

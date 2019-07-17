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

# Install Utilities

installBilow() {
    filename=$1
    parentFolder=$(basename $(dirname $filename))
    childScript=$(basename $filename)
    shift
    invertTextAndLog "Starting $childScript from $parentFolder"
    sudo bash -H ${filename} $@
    invertTextAndLog "Finished $childScript, returning to $parentFolder"
}

export -f installBilow
export -f askYesNo
export -f invertTextAndLog
export -f invertText
export -f log

installFolder() {
    folderName="$(dirname $(dirname $BASH_SOURCE))/$1"
    shift
    ls -d $folderName/* | xargs -I filename bash -c "installBilow filename $@"
}

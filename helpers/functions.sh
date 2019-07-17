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

installFile() {
    filename=$1
    parentFolder=$(basename $(dirname $filename))
    childScript=$(basename $filename)
    invertTextAndLog "Starting $childScript from $parentFolder install"
    sudo -H bash $@
    invertTextAndLog "Finished $childScript, returning to $parentFolder install"
}

installFolder() {
    folderName="$(dirname $BASH_SOURCE)/$1"
    shift
    for filename in $(ls -d $folderName/*)
    do
        installFile filename $@"
    done
}

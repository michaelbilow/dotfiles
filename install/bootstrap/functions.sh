bilowGithub="https://raw.githubusercontent.com/michaelbilow/dotfiles/master/install"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOSX;;
    *)          machine="UNKNOWN:${unameOut}"
esac

export machine=$machine
export conda_dir=$HOME/miniconda


getBilow() {
    filename="$1.sh"
    curl -fsSL "${bilowGithub}/${filename}" -o $filename
    echo $filename
}

catBilow() {
    filename="$1.sh"
    curl "${bilowGithub}/${filename}"
}

installBilow() {
    filename=$(getBilow $1)
    sed -i "1s;^;source /tmp/functions.sh\n;" $filename
    shift
    chmod +x $filename
    sudo bash ${filename} $@
    rm $filename
}

sourceBilow() {
    filename=$(getBilow $1)
    source $filename
    rm $filename
}
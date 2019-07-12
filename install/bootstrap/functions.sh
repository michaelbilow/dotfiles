
getBilow() {
    filename="$1.sh"
    echo $bilowGithub >>/dev/stderr
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
    exit;
    source $filename
    rm $filename
}

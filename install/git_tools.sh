mkdir -p $HOME/bin

git_dl () {
    outputPath=$HOME/bin/$2
    curl -sL $1 > $outputPath && chmod +x $outputPath

}
git_dl https://github.com/spencertipping/ni/raw/develop/ni ni

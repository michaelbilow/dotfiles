mkdir -p $HOME/bin
echo "export PATH=\"\$PATH:$HOME/bin\"" >> ~/.bashrc

git_dl () {
    outputPath=$HOME/bin/$2
    curl -sL $1 > $outputPath && chmod +x $outputPath

}
git_dl https://github.com/spencertipping/ni/raw/develop/ni ni

mkdir -p $homeDir/bin
echo "export PATH=\"\$PATH:$homeDir/bin\"" >> ~/.bashrc

git_dl () {
    outputPath=$homeDir/bin/$2
    curl -sL $1 > $outputPath && chmod +x $outputPath

}
git_dl https://github.com/spencertipping/ni/raw/develop/ni ni

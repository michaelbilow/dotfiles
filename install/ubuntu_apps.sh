apps=(
    slack
    spotify
    intellij-idea-community
    aws-cli 
)

if [[ $(command -v snap) ]]
then
    for app in $apps
    do
        sudo snap install --classic $app
    done
fi

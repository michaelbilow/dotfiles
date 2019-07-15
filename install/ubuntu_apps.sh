if [[ $(command -v snap) ]]
then
    for app in $ubuntuApps
    do
        sudo snap install --classic $app
    done
fi

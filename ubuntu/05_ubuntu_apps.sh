if [[ $(command -v snap) ]]
then
    for app in $ubuntuApps
    do
        if [[ ! $(snap list | cut -d ' ' -f1 | grep $app) ]]
        then
            sudo snap install --classic $app
        fi
    done
fi

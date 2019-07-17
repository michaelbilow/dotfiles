source "$(dirname $BASH_SOURCE)/../helpers/constants.sh"
source "$(dirname $BASH_SOURCE)/../helpers/functions.sh"
installLogfile="/tmp/$(date +%Y%m%d%H%M%S)_install.log"

if [[ $machine != "mac" && $machine != ubuntu ]]
then
    echo "Scripts only work for mac and ubuntu"
    exit 1
fi

export homedir=$HOME

installFolder $machine
installFolder bash
installFolder python

addUser="Do you want to add another user?"
while [[ $(askYesNo $addUser) ]]
do
    read -p "Enter the username to add: " newUser
    export homedir="/home/$newUser"
    export 
    installFolder newUser
    installFolder bash
    installFolder python
    sudo chown -R $homedir $newUser:$newUser
done
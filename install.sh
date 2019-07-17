source "$(dirname $BASH_SOURCE)/helpers/constants.sh"
source "$(dirname $BASH_SOURCE)/helpers/functions.sh"
installLogfile="/tmp/$(date +%Y%m%d%H%M%S)_install.log"

export homedir=$HOME

installFolder $machine
installFolder bash
installFolder python
installFolder git_tools
installFolder ssh

addUser="Do you want to add another user?"
while [[ $(askYesNo "$addUser") = "y" ]]
do
    read -p "Enter the username to add: " newUser
    export homedir="/home/$newUser"
    export newUser=$newUser
    installFolder new_user
    installFolder bash
    installFolder python
    sudo chown -R $homedir $newUser:$newUser
done
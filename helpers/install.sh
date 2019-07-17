## Install Script
homedir=$HOME

installFolder $machine
installFolder bash
source ${homedir}/.bash_profile
installFolder python
installFolder git_tools

setupSSH="Do you want to set up SSH access?"
if [[ $(askYesNo "$setupSSH") == "y" ]]
then
    installFolder ssh
fi

addUser="Do you want to add another user?"
while [[ $(askYesNo "$addUser") == "y" ]]
do
    read -p "Enter the username to add: " newUser
    homedir="/home/$newUser"
    installFolder new_user
    installFolder bash 
    installFolder python
    sudo chown -R $homedir $newUser:$newUser
done
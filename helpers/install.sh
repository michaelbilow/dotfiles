## Install Script

export homeDir=$HOME # a flexible home directory variable
export condaDir="${homeDir}/miniconda"

installFolder $machine
installFolder bash
source ${homeDir}/.bash_profile
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
    export homeDir="/home/$newUser"
    export condaDir="${homeDir}/miniconda"
    installFolder new_user
    installFolder bash 
    installFolder python
    sudo chown -R $homeDir $newUser:$newUser
done

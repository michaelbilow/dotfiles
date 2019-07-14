passwordlessSSH="Do you want to set up passwordless ssh from another machine?" 
if [[ $(askYesNo $passwordlessSSH) == "y" ]]
then
    wormhole invite
fi

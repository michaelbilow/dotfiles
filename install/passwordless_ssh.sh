passwordlessSSH="Do you want to set up passwordless ssh from another machine?" 
while [[ $(askYesNo $passwordlessSSH) == "y" ]]
do
    wormhole invite
done
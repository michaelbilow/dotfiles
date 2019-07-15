chmod 755 .ssh
passwordlessSSH="Do you want to set up passwordless ssh from another machine?" 
while [[ $(askYesNo "$passwordlessSSH") == "y" ]]
do
    wormhole ssh invite
done
chmod 640 .ssh

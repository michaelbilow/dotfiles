read -p "Email for ssh/github: " email
ssh-keygen -t rsa -b 4096 -C $email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-keyreg -p 

read -sp "Github password: " ghPass
read -p "Name your new github ssh key: " pwName

ghData=$( jq -n \
         --arg key "$(cat ~/.ssh/id_rsa.pub)" \
         --arg title "$pwname" \
         '{title: $title, key: $key}' )

curl -u "$email:$ghPass" --data $ghData https://api.github.com/user/keys

passwordlessSSH="Do you want to set up passwordless ssh from another machine?" 
if [[ $(askYesNo $passwordlessSSH) == "y" ]]
then
    wormhole invite
fi

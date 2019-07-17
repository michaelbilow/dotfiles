mkdir -p $homeDir/.ssh
chmod 755 $homeDir/.ssh
read -p "Email for ssh key: " email
ssh-keygen -t rsa -b 4096 -C $email -f $homeDir/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add $homeDir/.ssh/id_rsa
chmod 640 $homeDir/.ssh

mkdir -p $HOME/.ssh
chmod 755 $HOME/.ssh
read -p "Email for ssh key: " email
ssh-keygen -t rsa -b 4096 -C $email -f $HOME/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa
chmod 640 $HOME/.ssh

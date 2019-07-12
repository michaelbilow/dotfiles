catBilow bash_prompt_helpers >> ~/.bashrc
catBilow bash_variables.sh >> ~/.bashrc
catBilow bash_aliases.sh >> ~/.bashrc
catBilow bash_profile.sh >> ~/.bash_profile

if [[ $machine = "MacOSX" ]]
then
    catBilow bash_mac.sh >> ~/.bash_profile
else
    pass;
fi

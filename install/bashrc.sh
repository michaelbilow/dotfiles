catBilow bash_prompt_helpers >> ~/.bashrc
catBilow bash_variables >> ~/.bashrc
catBilow bash_aliases >> ~/.bashrc
catBilow bash_profile >> ~/.bash_profile

if [[ $machine = "MacOSX" ]]
then
    catBilow bash_mac >> ~/.bash_profile
fi

source ~/.bash_profile

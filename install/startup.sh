
if [[ $machine = "MacOSX" ]]
then 
    installBilow mac
else
    installBilow ubuntu
fi


installBilow completion
installBilow git_tools
installBilow anaconda

# Things that modify .bashrc/.bash_profile
# in significant ways should
# go above this line.
installBilow bashrc

installBilow work_env
installBilow tensorflow_env


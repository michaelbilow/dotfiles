
if [[ $machine = "MacOSX" ]]
then 
    installBilow mac
else
    installBilow ubuntu
fi

installBilow completion
installBilow bashrc
installBilow git_tools

installBilow anaconda
installBilow work_env
installBilow tensorflow_env


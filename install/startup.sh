
if [[ $machine = "MacOSX" ]]
then 
    installBilow mac
else
    installBilow ubuntu
fi

# installBilow anaconda
# installBilow work_env
# installBilow tensorflow_env

installBilow completion
installBilow bashrc

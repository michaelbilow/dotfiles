
if [[ $machine = "MacOSX" ]]
then 
    echo "mac mac"
    installBilow mac
else
    echo "bun bun"
    installBilow ubuntu
fi

# installBilow anaconda
# installBilow work_env
# installBilow tensorflow_env

installBilow completion
installBilow bashrc

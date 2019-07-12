sourceBilow tools

installBilow $((if [ $machine == "MacOSX" ]; then "mac"; else "ubuntu"; fi))
installBilow anaconda $machine
installBilow work_env
installBilow tensorflow_env
installBilow completion
installBilow bashrc

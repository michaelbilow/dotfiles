sourceBilow tools

installBilow $(($machine=="MacOSX" ? "mac" : "ubuntu"))
installBilow anaconda $machine
installBilow work_env
installBilow tensorflow_env
installBilow completion
installBilow bashrc

installBilow $(($machine=="MacOSX" ? "mac" : "ubuntu"))
installBilow anaconda $machine
installBilow work_env
installBilow tensorflow_env


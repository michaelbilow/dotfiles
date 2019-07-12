installBilow $((if [[ "$machine" = "MacOSX" ]]; then "mac"; else "ubuntu"; fi))
installBilow anaconda
installBilow work_env
installBilow tensorflow_env
installBilow completion
installBilow bashrc

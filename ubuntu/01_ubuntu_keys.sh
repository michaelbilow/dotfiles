# Scala
if [[ ! $(apt-key list | grep "2EE0 EA64 E40A 89B8 4B2D  F734 99E8 2A75 642A C823") ]]
then
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
fi

# Nvidia
if [[ ! $(apt-key list | grep "AE09 FE4B BD22 3A84 B2CC  FCE3 F60F 4B3D 7FA2 AF80") ]]
then
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
    sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
fi

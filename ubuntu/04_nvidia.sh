if [[ ($hasNvidia == "y") ]]
then
    sudo apt-get -o Dpkg::Options::="--force-overwrite" install -y cuda-10-0 cuda-drivers
    echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> $homedir/.bashrc
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> $homedir/.bashrc
    source ~/.bashrc
    sudo ldconfig
fi

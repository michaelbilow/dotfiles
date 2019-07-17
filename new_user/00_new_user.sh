mkdir -p $homedir
sudo adduser --shell /bin/bash $username
sudo usermod -aG docker $username

if [[ ($hasNvidia == "y") ]]
then
    echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> $homedir/.bashrc
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> $homedir/.bashrc
fi

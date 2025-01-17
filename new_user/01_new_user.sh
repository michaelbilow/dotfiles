sudo adduser --gecos "" --shell /bin/bash $currentUser
sudo usermod -aG docker $currentUser

if [[ ($hasNvidia == "y") ]]
then
    echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> $homeDir/.bashrc
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> $homeDir/.bashrc
fi

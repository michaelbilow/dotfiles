mkdir -p $homeDir
sudo adduser -s /bin/bash -G docker $newUser

if [[ ($hasNvidia == "y") ]]
then
    echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> $homeDir/.bashrc
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> $homeDir/.bashrc
fi

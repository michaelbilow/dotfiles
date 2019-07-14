installBilow ubuntu_keys

sudo apt-get update

sudo apt-get install -y \
    $linuxAndMac \
    $linuxOnly

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb
rm ripgrep_11.0.1_amd64.deb

installBilow ubuntu_startup
installBilow docker
installBilow nvidia
installBilow ubuntu_apps

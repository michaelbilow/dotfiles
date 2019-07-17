xcode-select -p 1> /dev/null

if [[ $? -ne 0 ]]
then
    xcode-select --install
fi

# Docker
invertAndLog "Install Docker from https://hub.docker.com/editions/community/docker-ce-desktop-mac"

brew install 
    $linuxAndMac \
    $macOnly

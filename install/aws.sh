# AWS CLI

# Getting credentials from another machine
awsInvite="Do you want to send AWS credentials?"
if [[ $(askYesNo "$awsInvite") == "y" ]]
then
    mkdir -p $HOME/.aws
    cd $HOME/.aws
    echo "wormhole send your credentials from your other machine"
    wormhole receive
    cd -
fi

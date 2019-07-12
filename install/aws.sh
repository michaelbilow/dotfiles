# AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -b $HOME/bin/aws
rm awscli-bundle.zip
rm -r awscli-bundle

# Getting credentials from another machine
awsInvite="Do you want to send AWS credentials?"
if [[ askYesNo $awsInvite ]]
then
    mkdir -p $HOME/.aws
    echo "wormhole send your credentials from your other machine"
    wormhole receive
fi

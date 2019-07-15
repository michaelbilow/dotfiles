githubSSH="Do you want to set up a github token for your ssh key at $HOME/.ssh/id_rsa.pub?"
if [[ $(askYesNo "$githubSSH") == "y" ]]
then
    read -sp "Github password: " ghPass
    read -p "Name your new github ssh key: " pwName

    ghData=$(jq -n \
                --arg key "$(cat $HOME/.ssh/id_rsa.pub)" \
                --arg title "$pwname" \
                '{title: $title, key: $key}' )

    curl --request POST \
        --url https://api.github.com/authorizations \
        --header 'authorization: Basic PASSWORD' \
        --header 'content-type: application/json' \
        --header "x-github-otp: $OTP" \
        --data '{"scopes": ["public_repo"], "note": "test"}'
    curl -u "$email:$ghPass" --data $ghData https://api.github.com/user/keys
fi
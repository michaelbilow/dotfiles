
echo "sorry, not working with 2FA right now"
sleep 5
exit 0
# TODO: Fix!
read -sp "Github password: " ghPass
echo ""
read -p "Name your new github ssh key: " pwName

ghData=$(jq -n \
            --arg key "$(cat $homeDir/.ssh/id_rsa.pub)" \
            --arg title "$pwname" \
            '{title: $title, key: $key}' )

curl --request POST \
    --url https://api.github.com/authorizations \
    --header 'authorization: Basic PASSWORD' \
    --header 'content-type: application/json' \
    --header "x-github-otp: $OTP" \
    --data '{"scopes": ["public_repo"], "note": "test"}'
curl -u "$email:$ghPass" --data $ghData https://api.github.com/user/keys

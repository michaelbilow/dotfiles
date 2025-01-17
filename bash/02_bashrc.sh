cat <<EOF >> $homeDir/.bashrc
source $homeDir/.git-prompt.sh
source $homeDir/.git-completion.bash
export PATH="/usr/local/bin:/usr/local/sbin:$homeDir/bin:\$PATH"
EOF

staticScriptsDir="$(dirname $(dirname $BASH_SOURCE))/static_scripts"
cat "${staticScriptsDir}/bash_prompt_helpers.sh" >> $homeDir/.bashrc
cat "${staticScriptsDir}/bash_variables.sh" >> $homeDir/.bashrc
cat "${staticScriptsDir}/bash_aliases.sh" >> $homeDir/.bash_aliases
cat "${staticScriptsDir}/bash_profile.sh" >> $homeDir/.bash_profile

if [[ $machine = "mac" ]]
then
    cat "${staticScriptsDir}/bash_mac.sh" >> $homeDir/.bashrc
fi

source $homeDir/.bash_profile

staticsScriptsDir="$(dirname $BASH_SOURCE)/static_scripts"
cat "${staticScriptsDir}/bash_prompt_helpers.sh" >> $homedir/.bashrc
cat "${staticScriptsDir}/bash_variables.sh" >> $homedir/.bashrc
cat "${staticScriptsDir}/bash_aliases.sh" >> $homedir/.bash_aliases
cat "${staticScriptsDir}/bash_profile.sh" >> $homedir/.bash_profile

if [[ $machine = "MacOSX" ]]
then
    cat "${staticScriptsDir}/bash_mac.sh" >> $homedir/.bashrc
fi

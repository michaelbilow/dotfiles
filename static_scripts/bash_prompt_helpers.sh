export PS1='\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h \[\033[38;5;214m\]\W \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;153m\]$(__git_ps1 "(%s)")\[$(tput sgr0)\]\[$(tput sgr0)\]\$ '

export HISTSIZE=10000
export HISTFILESIZE=10000

export CLICOLOR=1
export LSCOLORS=EhFxBxDxBxegedabagacad

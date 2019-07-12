alias grep='grep --color=auto'
alias tma='tmux attach-session -t '
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t '

alias epoch='date +%s'
alias tabfirstsort='sort -t " " -k 1 -n'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias whatismyip='curl -s checkip.dyndns.org | grep -Eo [0-9.]+'

alias sha256sum="shasum 256 -a"

alias mvci="mvn clean && mvn install"
alias dcpu="docker-compose -f docker-compose.production.yml up server"
alias gcm="git checkout master"
alias gcmp="git checkout master && git pull"
alias gcd="git checkout develop"
alias gcmmdp="git checkout master && git merge develop && git push"
alias bfg='java -jar bfg.jar'

alias serverplease="python3 -m http.server 8000 >&/dev/null"
alias sbp="source ~/.bash_profile"
alias vbp="vim ~/.bash_profile"

alias spark-shell='spark-shell --master yarn --deploy-mode client --jars /usr/lib/hadoop/lib/hadoop-lzo.jar --num-executors 25'
alias clear_all_docker='docker rm $(docker ps -a -q)'

psgrepkill() {
  ps auxw | grep $1 | xargs -i kill -9 {}
}

if [ -x "$(xclip)" ] 
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

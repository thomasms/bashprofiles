# bash profile for Mac Os X, with docker development

# make the terminal colourful
export PS1="\[\033[1;31m\][\$(date +%H%M)]\[\033[1;34m\][\u@\h:\[\033[1;32m\]\w\[\033[1;34m\]]\[\033[1;31m\]$\[\033[0m\] "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# alias
alias ll='ls -lha'
alias py='python3'
alias top="top -o cpu"
alias gitfullpull='git submodule update --init --recursive'
alias cleandocker='docker rm $(docker ps -a -f status=exited -q)'
alias cleandockerim='docker rmi $(docker images -f dangling=true -q)'

# functions
flattenimage(){
    docker export "$1" | docker import - "$2"
}

ssdiff(){
    colordiff -y -W $COLUMNS $1 $2
}

gitdiff(){
    git difftool -y -x "colordiff -y -W $COLUMNS" "$1" | less -R
}

dircount() {
    ls -l "$1" | grep -c ^d
}

filecount() {
    ls -l "$1" | egrep -c '^-'
}

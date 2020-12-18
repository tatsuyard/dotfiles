alias ls='ls -FG'
alias ll='ls -alFG'
# docker
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dp='docker ps'
alias di='docker images'
# Git
alias gs='git status'
alias gcm='git commit'
alias gcb='git checkout -b'
alias ga='git add'

#
# Goolge Search by Google Chrome
#
google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
            str="$str${str:++}$i"
        done
        opt='search?num=100'
        opt="${opt}&q=${str}"
    fi
    open -a Google\ Chrome http://www.google.co.jp/$opt
} 

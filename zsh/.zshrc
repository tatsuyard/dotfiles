# alias
alias ls='ls --color=auto'
alias ls='ls -G'
alias ll='ls -la'
alias allps='ps aux'
alias so='source'
# historyに日付を表示
alias h='fc -lt '%F %T' 1'

# ghq + peco inc search
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# nano to vim
export EDITOR='vim'
export VISUAL='vim'

# auto cd
setopt auto_cd
# cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
# コマンド打ち間違いを指摘
setopt correct
# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF
# 他のターミナルとヒストリーを共有
setopt share_history

# Prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

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


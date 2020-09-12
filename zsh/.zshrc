# alias
alias ll='ls -la'
alias allps='ps aux'


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

# Prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"


export ZSH=~/.oh-my-zsh

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colored-man-pages colorize copyfile history)

source $ZSH/oh-my-zsh.sh

alias gh='git hist'
source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

function zle-line-init zle-keymap-select {
  PROMPT=`/usr/local/bin/purs prompt -k "$KEYMAP" -r "$?"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
autoload -Uz add-zsh-hook
function _prompt_purs_precmd() {
  /usr/local/bin/purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd

eval "$(rbenv init -)"

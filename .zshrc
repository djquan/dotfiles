export ZSH=~/.oh-my-zsh

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colored-man-pages colorize copyfile history)

source $ZSH/oh-my-zsh.sh

alias gh='git hist'

BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"

[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]
source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

autoload -U promptinit && promptinit
prompt pure

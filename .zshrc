export ZSH=~/.oh-my-zsh

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colored-man-pages colorize copyfile history rbenv)

source $ZSH/oh-my-zsh.sh

alias irb='pry'
alias top='htop'

BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"

eval "$(rbenv init -)"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

autoload -U promptinit && promptinit
prompt pure

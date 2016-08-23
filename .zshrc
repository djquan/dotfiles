export ZSH=~/.oh-my-zsh

ZSH_THEME="pure"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colored-man-pages colorize copyfile history rbenv)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export NVM_DIR=~/.nvm
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export RUST_SRC_PATH=/usr/local/src/rust/src
export RBENV_VERSION='2.3.1'

alias irb='pry'
alias top='htop'

BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"

eval "$(rbenv init -)"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  


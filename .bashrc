export EDITOR=vim
export NVM_DIR=~/.nvm

export PATH=$PATH:usr/local/bin:~/bin:/~/bin:/usr/bin:/usr/sbin:/sbin:/bin
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$NODE_PATH
export PATH="$PATH:$HOME/bazel/output"

stty -ixon

alias irb='pry'
alias top='htop'
alias l='ls -lahGp'

# Git alias
alias gd='git diff'
alias gdc='git diff --cached'
alias gt='git status'
alias ga='git add'
alias gcmsg='git commit -m'
alias gp='git push'
alias gpull='git pull --rebase'

if ! hash pbcopy 2>/dev/null ; then
  alias pbcopy='xclip -selection clipboard'
fi

[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion # for RVM completion

GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
source ~/.git_prompt.sh

c_red='\[\e[31m\]'
c_clear='\[\e[0m\]'
c_blue='\[\e[34m\]'
c_yellow='\[\e[33m\]'

export TERM=xterm-256color
export PROMPT_COMMAND='__git_ps1 "[$c_yellow\u@\h$c_clear] [$c_blue\w$c_clear]" " $ ";'

BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

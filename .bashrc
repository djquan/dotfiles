export EDITOR=vim
export GOPATH=$HOME/Dropbox/code/go
export GOROOT="/usr/local/Cellar/go/1.3/libexec"
export NVM_DIR=~/.nvm

export PATH=$PATH:usr/local/bin:~/bin:/~/bin:/usr/bin:/usr/sbin:/sbin:/bin
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$NODE_PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias gotime='cd $GOPATH/src/github.com/djquan/'
alias vague='cd ~/bt/dev-box && vagrant up && vagrant ssh -- -A'
alias warp='afplay ~/bt/system-scripts/pairing_stations/warp_pipe.wav; ssh warp1'
alias irb='pry'
alias top='htop'
alias l='ls -lahG'

# Git alias
alias gd='git diff'
alias gdc='git diff --cached'
alias gt='git status'
alias ga='git add'
alias gcmsg='git commit -m'
alias gp='git push'
alias gpull='git pull --rebase'

if hash brew 2>/dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
    . $(brew --prefix)/etc/bash_completion.d
  fi
  if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/git-completion.bash;
  fi # for Git completion
  source $(brew --prefix nvm)/nvm.sh
fi

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

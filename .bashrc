# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

source /etc/bash_completion.d/git-prompt

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='\n$(if [[ $? == 0 ]]; then echo "\[\e[1;92m\]:)"; else echo "\[\e[1;91m\]:("; fi)\[\e[0m\] $(echo "\[\e[35m\][\u@\h] \[\e[1;94m\]$PWD \[\e[35m\]")$(__git_ps1) ${hasjobs:+\[\e[93m\](\j)}  \[\e[0m\]\n\[\e[91m\]❤\[\e[0m\]  '

LS_COLORS="ow=01;36;40" && export LS_COLORS

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR='vim'
export GO_PATH="$HOME/go"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GO_PATH/bin:$PATH"
export PATH="/opt/cmake/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export RBENV_VERSION='2.5.1'
export skip_global_compinit=1

eval "$(~/.rbenv/bin/rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

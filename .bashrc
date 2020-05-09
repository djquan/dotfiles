source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export EDITOR='vim'
export GOPATH="$HOME/Code/go"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/opt/cmake/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/11/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export skip_global_compinit=1

export ERL_AFLAGS="-kernel shell_history enabled"
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

if [ -f /etc/bash_completion.d/git-prompt ]; then
  source /etc/bash_completion.d/git-prompt
fi

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  source /usr/share/git/completion/git-prompt.sh
fi


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true


HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='\n$(if [[ $? == 0 ]]; then echo "😃"; else echo "😦"; fi)\[\e[0m\] $(echo "\[\e[1;94m\]$(dirs)\[\e[92m\]") (\u@\h)\[\e[0m\]\[\e[35m\]$(__git_ps1) \[\e[0m\]${hasjobs:+\[\e[93m\](\j)}\[\e[0m\]\n\[\e[92m\]->\[\e[0m\] '

LS_COLORS="ow=01;36;40" && export LS_COLORS

[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases

. ~/.asdf/plugins/java/set-java-home.bash

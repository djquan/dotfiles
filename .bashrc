# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

PS1='$(if [[ $? == 0 ]]; then echo "\[\e[32m\]:)"; else echo "\[\e[31m\]:("; fi)\[\e[0m\] $PWD \n$ '

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
# export PATH="$HOME/.rbenv/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export RBENV_VERSION='2.5.0'
export skip_global_compinit=1

# eval "$(~/.rbenv/bin/rbenv init -)"

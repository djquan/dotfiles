# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"
export EDITOR=vim
setopt noflowcontrol
export GOPATH=$HOME/Dropbox/code/go
export GOROOT="/usr/local/Cellar/go/1.3/libexec"
source $(brew --prefix nvm)/nvm.sh
stty start undef
stty stop undef
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gem dquan)
LISTMAX=999

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
# Customize to your needs...
export PATH=$PATH:usr/local/bin:~/bin:/~/bin:/usr/bin:/usr/sbin:/sbin:/bin
PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias :cd='cd'
alias irb='pry'
alias sickbeard='python ~/bin/my-sickbeard-install/sickbeard.py'
alias top='htop'

pbpush () {
  pbpaste  | ssh $1 'pbcopy'
}

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$NODE_PATH
export PATH=$PATH:~/npm/bin

## Work Laptop Aliases
alias gotime='cd $GOPATH/src/github.com/djquan/'
alias vague='cd ~/bt/dev-box && vagrant up && vagrant ssh -- -A'
alias warp='afplay ~/bt/system-scripts/pairing_stations/warp_pipe.wav; ssh warp1'

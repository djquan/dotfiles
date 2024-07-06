autoload -U colors && colors

source $HOME/.aliases
. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="$HOME/bin:$PATH"

eval "$(starship init zsh)"

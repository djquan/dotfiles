autoload -U colors && colors

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $HOME/.aliases

export PATH="$HOME/bin:$PATH"

eval "$(mise activate zsh)"

# Add Go bin to PATH
export PATH="$(go env GOPATH)/bin:$PATH"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit

eval $(ssh-agent -s) > /dev/null
ssh-add &> /dev/null
source <(fzf --zsh)

eval "$(zoxide init zsh)"
export QT_QPA_PLATFORM="xcb"
export EDITOR="nvim"

command -v starship > /dev/null && eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"

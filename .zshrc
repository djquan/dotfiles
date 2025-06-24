autoload -U colors && colors

source $HOME/.aliases


export PATH="/Users/dan/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="$HOME/bin:$PATH"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Add Go bin to PATH
export PATH="$(go env GOPATH)/bin:$PATH"

fpath+=("/opt/homebrew/opt/asdf/share/zsh/site-functions")

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

command -v starship > /dev/null && eval "$(starship init zsh)"

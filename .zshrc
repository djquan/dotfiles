autoload -U colors && colors

source $HOME/.aliases


export PATH="/Users/dan/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="$HOME/bin:$PATH"

[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

# Add Go bin to PATH
export PATH="$(go env GOPATH)/bin:$PATH"

command -v starship > /dev/null && eval "$(starship init zsh)"

autoload -U colors && colors

source $HOME/.aliases

[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

export PATH="/Users/dan/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="$HOME/bin:$PATH"

command -v starship > /dev/null && eval "$(starship init zsh)"

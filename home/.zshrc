autoload -U colors && colors

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source $HOME/.aliases

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Editor and pager
export EDITOR="nvim"
export PAGER="less"
export MANPAGER="nvim +Man!"

# Mise (runtime version manager)
command -v mise &>/dev/null && eval "$(mise activate zsh)"

# Go bin path
command -v go &>/dev/null && export PATH="$(go env GOPATH)/bin:$PATH"

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit

# SSH (use macOS Keychain)
ssh-add -l &>/dev/null || ssh-add --apple-use-keychain &>/dev/null

# FZF
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
    export FZF_DEFAULT_OPTS="
        --color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374
        --color=fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934
        --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934
        --layout=reverse --height=40% --border"
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || cat {}'"
    export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} 2>/dev/null || ls -la {}'"
fi

# Zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Starship prompt
if command -v starship &>/dev/null; then
    export STARSHIP_CONFIG="$HOME/.config/starship.toml"
    eval "$(starship init zsh)"
fi

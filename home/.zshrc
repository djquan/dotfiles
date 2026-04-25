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

# FZF (use fd if available for faster file finding)
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
    if command -v fd &>/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi
    # Monokai Pro
    export FZF_DEFAULT_OPTS="
        --color=bg+:#5b595c,bg:#2d2a2e,spinner:#fc9867,hl:#ff6188
        --color=fg:#fcfcfa,header:#ff6188,info:#ab9df2,pointer:#fc9867
        --color=marker:#a9dc76,fg+:#fcfcfa,prompt:#ab9df2,hl+:#ff6188
        --color=selected-bg:#5b595c
        --layout=reverse --height=40% --border"
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || cat {}'"
    export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} 2>/dev/null || ls -la {}'"
fi

# Bat theme
export BAT_THEME="Monokai Extended"

# Zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
#
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bindkey -e

# Starship prompt
if command -v starship &>/dev/null; then
    export STARSHIP_CONFIG="$HOME/.config/starship.toml"
    eval "$(starship init zsh)"
fi

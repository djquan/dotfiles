#!/usr/bin/env zsh
set -euo pipefail

DOTFILES="${0:A:h}"

#
#  ┌─────────────────────────────────────────────────────────────────┐
#  │                         CONFIGURATION                          │
#  └─────────────────────────────────────────────────────────────────┘
#
#  Directory symlinks: source -> target
#
typeset -A DIR_LINKS=(
    "$DOTFILES/nvim"     "$HOME/.config/nvim"
    "$DOTFILES/ghostty"  "$HOME/.config/ghostty"
    "$DOTFILES/btop"     "$HOME/.config/btop"
)

#  Config file symlinks (files that go in ~/.config/)
#
typeset -A CONFIG_FILES=(
    "$DOTFILES/home/.config/starship.toml"  "$HOME/.config/starship.toml"
    "$DOTFILES/.tmux.conf"                  "$HOME/.tmux.conf"
)

#  Claude Code symlinks (selective, not the whole directory)
#  ~/.claude may contain other runtime data we don't want to track
#
typeset -A CLAUDE_LINKS=(
    "$DOTFILES/claude/CLAUDE.md"       "$HOME/.claude/CLAUDE.md"
    "$DOTFILES/claude/settings.json"   "$HOME/.claude/settings.json"
    "$DOTFILES/claude/commands"        "$HOME/.claude/commands"
    "$DOTFILES/claude/scripts"         "$HOME/.claude/scripts"
    "$DOTFILES/claude/skills"          "$HOME/.claude/skills"
)

#  Required tools (installed via Homebrew)
BREW_PACKAGES=(
    mise
    neovim
    delta
    fzf
    zoxide
    starship
    eza
    gh
    bat
    ripgrep
    fd
    jq
    lazygit
    tmux
)

#  Files to skip when linking home directory
SKIP_FILES=(.DS_Store)

#
#  ┌─────────────────────────────────────────────────────────────────┐
#  │                           HELPERS                              │
#  └─────────────────────────────────────────────────────────────────┘
#
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
RESET='\033[0m'

info()    { print -P "${GREEN}[✓]${RESET} $1" }
warn()    { print -P "${YELLOW}[!]${RESET} $1" }
error()   { print -P "${RED}[✗]${RESET} $1" }

prompt_backup() {
    local target="$1"
    local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"

    echo ""
    warn "Conflict: $target already exists"
    echo "    1) Backup to ${backup:t} and replace"
    echo "    2) Skip"
    echo "    3) Overwrite without backup"
    read -r "choice?    Choice [1/2/3]: "

    case "$choice" in
        1)
            mv "$target" "$backup"
            info "Backed up to $backup"
            return 0
            ;;
        2)
            warn "Skipped $target"
            return 1
            ;;
        3)
            rm -rf "$target"
            return 0
            ;;
        *)
            warn "Invalid choice, skipping"
            return 1
            ;;
    esac
}

create_symlink() {
    local src="$1"
    local dest="$2"

    mkdir -p "${dest:h}"

    # Already correctly linked (resolve to absolute path for comparison)
    if [[ -L "$dest" && "${dest:A}" == "${src:A}" ]]; then
        info "Already linked: $dest"
        return 0
    fi

    if [[ -e "$dest" || -L "$dest" ]]; then
        prompt_backup "$dest" || return 0
    fi

    ln -s "$src" "$dest"
    info "Linked: $dest -> $src"
}

#
#  ┌─────────────────────────────────────────────────────────────────┐
#  │                        INSTALLATION                            │
#  └─────────────────────────────────────────────────────────────────┘
#
ensure_homebrew_path() {
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
}

install_homebrew() {
    ensure_homebrew_path

    if command -v brew &>/dev/null; then
        info "Homebrew already installed"
        return 0
    fi

    warn "Homebrew not found. Install it? [y/N]"
    read -r "choice?    "
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ensure_homebrew_path
        info "Homebrew installed"
    else
        error "Homebrew required for package installation"
        return 1
    fi
}

install_packages() {
    local missing=()

    for pkg in "${BREW_PACKAGES[@]}"; do
        if ! brew list "$pkg" &>/dev/null; then
            missing+=("$pkg")
        fi
    done

    if [[ ${#missing[@]} -eq 0 ]]; then
        info "All packages already installed"
        return 0
    fi

    echo ""
    warn "Missing packages: ${missing[*]}"
    read -r "choice?    Install them? [Y/n]: "
    if [[ ! "$choice" =~ ^[Nn]$ ]]; then
        brew install "${missing[@]}"
        info "Packages installed"
    else
        warn "Skipped package installation"
    fi
}

link_home_files() {
    echo ""
    info "Linking home directory files..."
    for file in "$DOTFILES"/home/.*(.N); do
        local filename="${file:t}"
        if (( ${SKIP_FILES[(Ie)$filename]} )); then
            continue
        fi
        create_symlink "$file" "$HOME/$filename"
    done
}

link_config_dirs() {
    echo ""
    info "Linking config directories..."
    for src dest in "${(@kv)DIR_LINKS}"; do
        create_symlink "$src" "$dest"
    done
}

link_config_files() {
    echo ""
    info "Linking config files..."
    for src dest in "${(@kv)CONFIG_FILES}"; do
        create_symlink "$src" "$dest"
    done
}

link_claude_config() {
    echo ""
    info "Linking Claude Code config..."
    mkdir -p "$HOME/.claude"
    for src dest in "${(@kv)CLAUDE_LINKS}"; do
        create_symlink "$src" "$dest"
    done
}

install_claude_code() {
    if command -v claude &>/dev/null; then
        info "Claude Code already installed"
        return 0
    fi

    echo ""
    warn "Claude Code not found. Install it? [Y/n]"
    read -r "choice?    "
    if [[ ! "$choice" =~ ^[Nn]$ ]]; then
        curl -fsSL https://claude.ai/install.sh | bash
        info "Claude Code installed"
    else
        warn "Skipped Claude Code installation"
    fi
}

main() {
    echo ""
    echo "┌─────────────────────────────────────────┐"
    echo "│         Dotfiles Installation           │"
    echo "└─────────────────────────────────────────┘"
    echo ""

    install_homebrew
    install_packages
    install_claude_code
    link_home_files
    link_config_dirs
    link_config_files
    link_claude_config

    echo ""
    info "Done! You may need to restart your shell."
}

main "$@"

# dotfiles

Personal configuration for shell, Neovim, Ghostty, btop, and coding-agent workflows.

## Structure

```
dotfiles/
├── .agents/       # Codex project skills
├── home/          # Shell configs (~/.zshrc, ~/.aliases, ~/.gitconfig, etc.)
├── nvim/          # LazyVim-based Neovim config
├── ghostty/       # Ghostty terminal config
└── btop/          # btop system monitor config
```

## Installation

```bash
git clone git@github.com:djquan/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:
- Install Homebrew (if missing)
- Install required packages: mise, neovim, delta, fzf, zoxide, starship, eza, gh
- Symlink configs to their expected locations
- Prompt before overwriting existing files

## Tools

| Tool | Purpose |
|------|---------|
| [mise](https://mise.jdx.dev/) | Runtime version management |
| [LazyVim](https://www.lazyvim.org/) | Neovim distribution |
| [Ghostty](https://ghostty.org/) | Terminal emulator |
| [delta](https://github.com/dandavison/delta) | Git diff viewer |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart cd |
| [starship](https://starship.rs/) | Shell prompt |
| [eza](https://github.com/eza-community/eza) | Modern ls |

## Language Versions

Managed via mise in `home/.tool-versions`:
- Go, Ruby, Node.js, Python, Rust

Update to latest versions with the Codex skill `$update-tool-versions`.

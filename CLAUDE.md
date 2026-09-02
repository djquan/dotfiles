# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository containing configuration for shell, Neovim, Ghostty terminal, and Claude Code. Uses a modular directory structure where each tool's config lives in its own folder.

## Structure

```
dotfiles/
├── .claude/       # Repo-scoped Claude Code skills
├── home/          # Shell configs (~/.zshrc, ~/.aliases, ~/.gitconfig, etc.)
├── nvim/          # LazyVim-based Neovim config (symlink to ~/.config/nvim)
├── ghostty/       # Ghostty terminal config
├── btop/          # btop system monitor config
└── claude/        # Claude Code config (symlinked piecewise into ~/.claude)
```

## Key Tools in Use

- **mise** (formerly rtx) for runtime version management (see `home/.tool-versions`)
- **LazyVim** as the Neovim base distribution
- **delta** for git diff formatting
- **fzf** for fuzzy finding
- **zoxide** for smart directory navigation
- **starship** for shell prompt
- **eza** as `ls` replacement

## Installation Notes

These configs are designed to be symlinked to their expected locations:
- `nvim/` → `~/.config/nvim`
- `ghostty/` → `~/.config/ghostty`
- `btop/` → `~/.config/btop`
- Files in `home/` → `~/` (e.g., `home/.zshrc` → `~/.zshrc`)
- `claude/` is linked selectively (`CLAUDE.md`, `settings.json`, `commands/`, `scripts/`, `skills/`) rather than as a whole directory, since `~/.claude` also holds untracked runtime data

## Neovim Config

See `nvim/CLAUDE.md` for detailed Neovim-specific guidance. Key points:
- Built on LazyVim with minimal customizations
- Plugins defined in `nvim/lua/plugins/*.lua`
- Monokai Pro Dark colorscheme, Ctrl-hjkl for split navigation

## Theme Adoption Checklist

When updating the color theme, keep these files in sync:
- `nvim/lua/plugins/core.lua` sets the active Neovim colorscheme name
- `nvim/colors/monokai_pro_dark.lua` defines the Neovim palette, highlight groups, and terminal ANSI colors
- `ghostty/config` sets the Ghostty terminal theme
- `btop/btop.conf` selects the active btop theme file
- `btop/themes/monokai_pro_dark.theme` defines the btop palette

If the theme name changes, also update any repo docs that mention the old theme so the configuration and documentation don't drift.

## Agent Workflows

- Repo-scoped skills live under `.claude/skills/`; they apply only when working in this repository.
- Global Claude Code config lives under `claude/`: personal `CLAUDE.md`, `settings.json`, `commands/`, `skills/`, and the `scripts/context-bar.sh` statusline. These are symlinked into `~/.claude` and apply everywhere.
- Use the `update-tool-versions` skill to update `home/.tool-versions`.

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration that extends the LazyVim distribution with custom plugins and settings. LazyVim provides a pre-configured setup with sensible defaults, and this config adds minimal customizations on top.

## Key Commands

### Plugin Management
- `:Lazy` - Open the lazy.nvim plugin manager UI
- `:Lazy sync` - Update all plugins and clean unused ones
- `:Lazy update` - Update plugins to latest versions
- `:Lazy install` - Install any missing plugins
- `:Lazy clean` - Remove plugins no longer in config

### Development
- `:LspInfo` - Show active language servers
- `:Mason` - Open Mason UI to install/manage LSPs, formatters, linters
- `:ConformInfo` - Show active formatters for current buffer
- `<leader>gg` - Open LazyGit (if in a git repository)

### Tmux Navigation
This config includes vim-tmux-navigator, enabling seamless pane navigation:
- `Ctrl-h` - Navigate left (between vim splits and tmux panes)
- `Ctrl-j` - Navigate down
- `Ctrl-k` - Navigate up
- `Ctrl-l` - Navigate right

## Architecture

### Directory Structure
```
lua/
├── config/      # Core configuration modules
│   ├── lazy.lua # Plugin manager bootstrap and setup
│   └── ...      # autocmds, keymaps, options
└── plugins/     # Plugin specifications
    └── *.lua    # Each file can return plugin specs
```

### Plugin System
- Built on lazy.nvim with LazyVim as the base distribution
- Plugins are defined in `lua/plugins/*.lua` files
- Each plugin file should return a table of plugin specifications
- LazyVim handles most common plugins; only add customizations here

### Language Support
LazyVim extras enabled for enhanced language support:
- `lang.go` - Go development (gopls, gofumpt, etc.)
- `lang.json` - JSON with SchemaStore integration
- `lang.markdown` - Markdown preview and editing

### Current Customizations
1. **Colorscheme**: Tokyo Night (night style) set as default
2. **Tmux Integration**: vim-tmux-navigator for seamless navigation
3. **Formatter Config**: Stylua configured with 2-space indentation

## Adding New Plugins

Create a new file in `lua/plugins/` (e.g., `lua/plugins/my-plugins.lua`):

```lua
return {
  {
    "plugin/repo",
    event = "VeryLazy", -- or specific events
    config = function()
      -- plugin configuration
    end,
  },
}
```

## Modifying LazyVim Defaults

To override LazyVim plugin configurations, use the same plugin name:

```lua
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      -- override default options
    },
  },
}
```

## Important Files

- `init.lua` - Entry point, loads LazyVim
- `lazyvim.json` - LazyVim extras configuration
- `lazy-lock.json` - Plugin version locks (auto-managed)
- `lua/config/lazy.lua` - Plugin manager configuration
- `lua/plugins/core.lua` - Active plugin customizations
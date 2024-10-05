local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme_dirs = { '~/dotfiles/wezterm-themes' }
config.color_scheme = 'tokyonight_night'
config.default_prog = { '/bin/zsh', '-l', '-c', 'tmux new -A -s dev' }
config.initial_rows = 60
config.initial_cols = 180
config.window_close_confirmation = 'NeverPrompt'
config.font_size = 13.0
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.enable_tab_bar = false

return config

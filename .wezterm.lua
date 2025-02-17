local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.color_scheme = 'Monokai (base16)'
config.default_prog = { '/bin/zsh', '-l', '-c', 'tmux new -A -s dev' }

return config

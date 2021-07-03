local options = vim.o
local global = vim.g
local cmd = vim.cmd

options.relativenumber=true
options.number=true
options.shell="/bin/bash"
options.clipboard="unnamed"
options.showmode=true
options.hidden=true
options.ignorecase=true
options.smartcase=true
options.hlsearch=true
options.wrap=true
options.linebreak=true
options.title=true
options.tabstop=2
options.softtabstop=2
options.shiftwidth=2
options.expandtab=true
options.cursorline=true
options.completeopt="menuone,noselect"
options.updatetime=100
options.autowrite=true
options.background="dark"
options.undodir="~/.vim/undodir"
options.undofile=true
options.foldmethod="expr"
options.foldexpr="nvim_treesitter#foldexpr()"
options.foldlevel=99
options.termguicolors=true

global.nobackup=true
global.nohlsearch=true
global.noswapfile=true
global.nowritebackup=true

cmd("syntax on")
cmd("colorscheme gruvbox")

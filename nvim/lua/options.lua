local options = vim.o
local global = vim.g
local cmd = vim.cmd
local set_global=vim.api.nvim_set_var

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
cmd("set undodir=\"~/.vim/undodir\"") -- lua options do not expand home dir
cmd('let test#strategy = "vimux"')
cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
cmd('autocmd BufWritePost plugins.lua PackerCompile')

set_global('ale_enabled', 1)
set_global('ale_lint_on_text_changed', 'normal')
set_global('ale_lint_on_insert_leave', 1)

local projectionist_heuristics = {}
local go_heuristics = {}
go_heuristics['*.go'] = { alternate = '{}_test.go', type = 'source' }
go_heuristics['*_test.go'] = { alternate = '{}.go', type = 'test' }
projectionist_heuristics["*.go"] = go_heuristics

set_global('projectionist_heuristics', projectionist_heuristics)

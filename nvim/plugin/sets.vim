set relativenumber
set number
set shell=/bin/bash
set clipboard=unnamed
set showmode
set hidden
set ignorecase
set smartcase
set hlsearch
set wrap
set linebreak
set nohlsearch
set title
set nobackup
set nowritebackup
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cursorline
set completeopt=menuone,noselect
set updatetime=100
set autowrite
set background=dark
set noswapfile
set undodir=~/.vim/undodir
set undofile
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

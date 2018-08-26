if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
set relativenumber 
set number  
set shell=/bin/bash
set clipboard=unnamed

call plug#begin()

" My Plugins
Plug 'kien/ctrlp.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'dag/vim-fish'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
" Matchit plugin 
runtime macros/matchit.vim
set showmode
set mouse=a
set ttimeoutlen=100
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden 
set autoindent
set wildmenu
set wildmode=list:longest

set history=200
set ignorecase
set smartcase

set ruler

set incsearch
set hlsearch

set scrolloff=3
set wrap
set linebreak

set title

set nobackup
set nowritebackup
" set directory=$HOME/.vim/tmp//,.  

set tabstop=2
set softtabstop=2 
set shiftwidth=2
set expandtab

set laststatus=2
set cursorline

"Replace & with &&; see tip 92 in Practical Vim"
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"Turns off highlighting for the most recent search "
nnoremap <Leader>l :<C-u>nohlsearch<CR><C-l> 

set vb t_vb=     " no visual bell & flash "
"tab switching
map <C-t> gt

" adds dot command to visual mode "
vnoremap . :norm.<CR>

"Easy expansion of file path"
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"Reloads source file on save
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif

"Leader - v to open sourcefile
nmap <Leader>v :vsp $MYVIMRC<CR>

let g:ctrlp_prompt_mappings = { 'PrtClearCache()':['<c-r>'] }
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1

set nocompatible
" set shell=/bin/zsh
set relativenumber 
set number  
set shell=/bin/bash
syntax enable
filetype plugin indent on
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Townk/vim-autoclose'
Bundle 'godlygeek/tabular'
Bundle 'mattn/emmet-vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'vim-ruby/vim-ruby'
Bundle 'bling/vim-airline'
Bundle 'pangloss/vim-javascript'
Bundle 'jgdavey/vim-turbux'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'

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

au BufNewFile,BufRead *.ejs set filetype=html

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

set statusline=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\    

set laststatus=2
set cursorline

"Replace & with &&; see tip 92 in Practical Vim"
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"Turns off highlighting for the most recent search "
nnoremap <Leader>l :<C-u>nohlsearch<CR><C-l> 

colorscheme solarized
set background=dark
set vb t_vb=     " no visual bell & flash "

"tab switching
map <C-t> gt

" adds dot command to visual mode "
vnoremap . :norm.<CR>

"Easy expansion of file path"
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"run a ruby file
map <Leader>b :w<CR>:!ruby %<CR>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"Reloads source file on save
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

"Leader - v to open sourcefile
nmap <Leader>v :vsp $MYVIMRC<CR>

"tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let g:ctrlp_prompt_mappings = { 'PrtClearCache()':['<c-r>'] }

map <C-N> :NERDTreeToggle<CR>

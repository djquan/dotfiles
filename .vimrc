set nocompatible
set relativenumber 
set number  
set shell=/bin/bash
set clipboard=unnamed

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" My Plugins
Plugin 'epmatsw/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'godlygeek/tabular'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'vim-ruby/vim-ruby'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'jgdavey/vim-turbux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'benmills/vimux-golang'
Plugin 'jnwhiteh/vim-golang'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'


call vundle#end() 
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

colorscheme base16-monokai
set background=dark
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
  autocmd FileType go autocmd BufWritePre <buffer> Fmt
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType javascript autocmd BufWritePre <buffer> call JsBeautify()
endif

map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>

"Leader - v to open sourcefile
nmap <Leader>v :vsp $MYVIMRC<CR>

"tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let g:ctrlp_prompt_mappings = { 'PrtClearCache()':['<c-r>'] }

map <C-N> :NERDTreeToggle<CR>
map <Leader>b :CtrlPBuffer<CR>

map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>


" opens quickfix after git grepping
autocmd QuickFixCmdPost *grep* cwindow


nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

set nocompatible
set relativenumber 
set number  
set shell=/bin/zsh
set clipboard=unnamed

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
call plug#begin()

" My Plugins
Plug 'epmatsw/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'vim-ruby/vim-ruby'
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'jgdavey/vim-turbux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
Plug 'jnwhiteh/vim-golang'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'elixir-lang/vim-elixir'
Plug 'spiegela/vimix'
Plug 'ekalinin/Dockerfile.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'chriskempson/base16-vim'

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

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir
au BufNewFile,BufRead *.eex set filetype=eelixir

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

let g:vimix_map_keys = 1

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
  autocmd BufRead,BufNewFile Dockerfile* setf Dockerfile
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

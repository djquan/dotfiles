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
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'Townk/vim-autoclose'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'maralla/completor.vim'
Plug 'janko-m/vim-test'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
call plug#end()

set showmode
set mouse=a
set hidden 
set ignorecase
set smartcase
set hlsearch
set wrap
set linebreak
set title
set nobackup
set nowritebackup
set tabstop=2
set softtabstop=2 
set shiftwidth=2
set expandtab
set cursorline

nnoremap & :&&<CR>
xnoremap & :&&<CR>

set vb t_vb=     " no visual bell & flash "
map <C-t> gt

vnoremap . :norm.<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"Reloads source file on save
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif

"Leader - v to open sourcefile
nmap <Leader>v :vsp ~/.vimrc<CR>

let g:ctrlp_prompt_mappings = { 'PrtClearCache()':['<c-r>'] }
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-monokai

nmap <Leader>nt :NERDTreeToggle<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "dispatch"

nmap <Leader>ut : UndotreeToggle<CR>

map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>


let g:ale_enabled = 1                     " Disable linting by default
let g:ale_lint_on_text_changed = 'normal' " Only lint while in normal mode
let g:ale_lint_on_insert_leave = 1        " Automatically lint when leaving insert mode

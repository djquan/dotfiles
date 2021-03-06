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
set showmode
set mouse=a
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
set completeopt-=preview
set completeopt=longest,menuone
set updatetime=100
set autowrite
set background=dark
set noswapfile
set undodir=~/.vim/undodir
set undofile
set vb t_vb=     " no visual bell & flash "

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_Co=256
  set termguicolors
endif

call plug#begin()
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-dispatch'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'Townk/vim-autoclose'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'w0rp/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'janko-m/vim-test'
  Plug 'mbbill/undotree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'vim-ruby/vim-ruby'
  Plug 'rust-lang/rust.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  Plug 'slashmili/alchemist.vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'ruby-formatter/rufo-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'gruvbox-community/gruvbox'
  Plug 'preservim/vimux'
  Plug 'rizzatti/dash.vim'
call plug#end()

syntax on
colorscheme gruvbox

nnoremap & :&&<CR>
xnoremap & :&&<CR>

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
nmap <Leader>v :e ~/.vimrc<CR>

let g:ctrlp_prompt_mappings = { 'PrtClearCache()':['<c-r>'] }
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1

nmap <Leader>nt :NERDTreeToggle<cr>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tt :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

let test#strategy = "vimux"

nmap <Leader>ut : UndotreeToggle<CR>

map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>

let g:airline_powerline_fonts = 1

let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:mix_format_on_save = 1

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

nnoremap <leader>at :ALEToggle<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>gR <Plug>(go-referrers)
autocmd FileType go nmap <leader>gC <Plug>(go-callers)
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gd :GoDecls<cr>
autocmd FileType go nmap <leader>gD :GoDeclsDir<cr>
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
let g:go_rename_command = "gopls"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_fail_silently = 1

let g:dispatch_no_maps = 1

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1
let g:pymode_python = 'python3'

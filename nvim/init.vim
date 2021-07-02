set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'Townk/vim-autoclose'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'w0rp/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'edkolev/tmuxline.vim'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'janko-m/vim-test'
  Plug 'mbbill/undotree'
  Plug 'airblade/vim-gitgutter'
  Plug 'gruvbox-community/gruvbox'
  Plug 'preservim/vimux'
  Plug 'rizzatti/dash.vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

syntax on
colorscheme gruvbox

vnoremap . :norm.<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Leader - v to open sourcefile
nmap <Leader>v :e ~/.config/nvim/init.vim<CR>

map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>

let g:airline_powerline_fonts = 1

nmap <Leader>ut : UndotreeToggle<CR>

return require('packer').startup(function(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sensible'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'christoomey/vim-tmux-navigator'
  use 'w0rp/ale'
  use 'edkolev/tmuxline.vim'
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'janko-m/vim-test'
  use 'mbbill/undotree'
  use 'airblade/vim-gitgutter'
  use 'gruvbox-community/gruvbox'
  use 'preservim/vimux'
  use 'rizzatti/dash.vim'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  use 'mboughaba/i3config.vim'
end)

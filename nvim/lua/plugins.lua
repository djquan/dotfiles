local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- treesitter & neovim specific
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'RRethy/nvim-treesitter-endwise'
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'tami5/lspsaga.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sensible'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'

  use 'christoomey/vim-tmux-navigator'
  use 'w0rp/ale'
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'vim-test/vim-test'
  use 'mbbill/undotree'
  use 'airblade/vim-gitgutter'
  use 'preservim/vimux'
  use 'rizzatti/dash.vim'
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  use 'sebdah/vim-delve'

  -- languages
  use 'vim-ruby/vim-ruby'
  use 'ray-x/go.nvim'

  if Packer_bootstrap then
    require('packer').sync()
  end
end)

local plugins = {
  -- tpope
  "tpope/vim-sensible",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-sensible",
  "tpope/vim-fugitive",
  "tpope/vim-projectionist",
  "tpope/vim-rails",
  "tpope/vim-rake",
  "tpope/vim-bundler",
  "tpope/vim-endwise",
  "tpope/vim-commentary",

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "neovim/nvim-lspconfig",

  -- theme
  "loctvl842/monokai-pro.nvim",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  'christoomey/vim-tmux-navigator',

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',


  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',

  'w0rp/ale',
  'Xuyuanp/nerdtree-git-plugin',
  'vim-test/vim-test',
  'mbbill/undotree',
  'airblade/vim-gitgutter',
  'preservim/vimux',
  'rafamadriz/friendly-snippets',

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  -- languages
  'vim-ruby/vim-ruby',
  'ray-x/go.nvim',
  'sebdah/vim-delve',
  'udalov/kotlin-vim',
}

require("lazy").setup(plugins)


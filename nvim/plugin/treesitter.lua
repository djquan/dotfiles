require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua", "ruby", "elixir", "go", "ruby", "rust"},
  endwise = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {"ruby"}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "<M-k>",
      scope_incremental = "grc",
      node_decremental = "<M-j>",
    },
  },
}

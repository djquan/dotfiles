return {
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-vitest",
        "rustaceanvim.neotest",
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },
}

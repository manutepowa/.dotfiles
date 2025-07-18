return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>kr", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
    { "<leader>ki", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request", ft = "http" },
    { "<leader>kn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request", ft = "http" },
    { "<leader>kp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request", ft = "http" },
    { "<leader>kq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window", ft = "http" },
    { "<leader>kS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats", ft = "http" },
    { "<leader>kv", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body", ft = "http" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = false,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
    ui = {
      default_view = "headers_body",
    },
  },
}

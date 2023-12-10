return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>e",
      "<cmd>lua require('oil').open_float()<cr>",
    },
  },
  opts = {
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<Tab>"] = "actions.select",
      ["q"] = "actions.close",
      ["<A-w>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
    }
  },
}

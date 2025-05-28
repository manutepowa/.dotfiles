-- This file contains the configuration for disabling specific Neovim plugins.

return {
  {
    "gbprod/yanky.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "folke/persistence.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 700, -- milisegundos
    },
  },
  {
    "folke/edgy.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },
  {
    "mfussenegger/nvim-lint",
    enabled = false,
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.ai",
    enabled = false,
  },
}

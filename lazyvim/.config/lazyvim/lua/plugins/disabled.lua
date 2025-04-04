-- This file contains the configuration for disabling specific Neovim plugins.

return {
  { "MagicDuck/grug-far.nvim", enabled = false },
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
    enabled = false, -- Disable this plugin
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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {},
      words = { enabled = false },
      indent = {
        indent = {
          char = "┊",
          hl = "SnacksIndentDark",
        },
        animate = {
          enabled = false,
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          char = "┊",
          only_current = true, -- only show scope in the current window
          hl = "SnacksIndentScopeDark", ---@type string|string[] hl group for scopes
        },
        chunk = {
          enabled = false,
        },
      },
      scroll = { enabled = false },
      input = { enabled = false },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
}

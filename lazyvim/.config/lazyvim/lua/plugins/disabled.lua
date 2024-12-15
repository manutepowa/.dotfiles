-- This file contains the configuration for disabling specific Neovim plugins.

return {
  { "MagicDuck/grug-far.nvim", enabled = false },
  {
    "gbprod/yanky.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "folke/persistence.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    "folke/noice.nvim",
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
      words = { enabled = false },
      indent = { enabled = false },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    enabled = false,
  },
  {
    "bhagwan/fzf-lua",
    enabled = false,
  },
}

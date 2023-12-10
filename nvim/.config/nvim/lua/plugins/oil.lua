return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
  init = function()
    vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>')
  end,
}

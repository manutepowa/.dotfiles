return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  lazy = false,
  opts = {
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<Tab>"] = "actions.select",
      ["q"] = "actions.close",
      ["<A-w>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
    },
    view_options = {
      show_hidden = true,
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>")
  end,
}

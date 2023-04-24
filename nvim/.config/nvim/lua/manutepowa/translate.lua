require("translate").setup({
  default = {
    command = "translate_shell",
    -- output = "floating",
    -- parse_after = "no_handle",
    -- parse_before = "trim,natural",
  },
  -- preset = {
  --   output = {
  --     insert = {
  --       base = "top",
  --       off = -1,
  --     },
  --   },
  -- },
})


vim.api.nvim_set_keymap("v", "<leader>t", "<cmd>Translate ES<cr>", { silent = true, noremap = true })

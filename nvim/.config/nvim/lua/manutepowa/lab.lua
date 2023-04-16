require('lab').setup {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = false,
  }
}

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>lr", ":Lab code run<cr>", opts)
vim.keymap.set("n", "<leader>ls", ":Lab code stop<cr>", opts)
vim.keymap.set("n", "<leader>lp", ":Lab code panel<cr>", opts)

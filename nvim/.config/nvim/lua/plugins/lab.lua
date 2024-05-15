return {
  '0x100101/lab.nvim',
  build = 'cd js && npm ci',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('lab').setup {
      code_runner = {
        enabled = true,
      },
      quick_data = {
        enabled = false,
      }
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>cr", ":Lab code run<cr>", opts)
    vim.keymap.set("n", "<leader>cs", ":Lab code stop<cr>", opts)
    vim.keymap.set("n", "<leader>cp", ":Lab code panel<cr>", opts)
  end
}

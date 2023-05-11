return {
  'uga-rosa/translate.nvim',
  event = { "VeryLazy" },
  config = function()
    require("translate").setup({
      default = {
        command = "translate_shell",
      },
    })


    vim.api.nvim_set_keymap("v", "<leader>t", "<cmd>Translate ES<cr>", { silent = true, noremap = true })
  end
}

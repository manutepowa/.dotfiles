require("translate").setup({
  default = {
        command = "translate_shell",
        output = "floating",
        parse_after = "no_handle",
        parse_before = "trim",
    },
    preset = {
        output = {
            split = {
                min_size = 8
            }
        }
    }
})

vim.api.nvim_set_keymap("x", "<leader>t", ":Translate ES<cr>", {noremap = true, silent = true})

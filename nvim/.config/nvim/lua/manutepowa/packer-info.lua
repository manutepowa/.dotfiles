require 'package-info'.setup{
    colors = {
        up_to_date = "#3C4048",
        outdated = "#FFF",
        -- outdated = "#d19a66",
    },
    icons = {
        enable = true,
        style = {
            up_to_date = "|   ",
            outdated = "|   ",
        },
    },
    autostart = true,
    hide_up_to_date = false,
    hide_unstable_versions = false,
}

-- Show package versions
vim.api.nvim_set_keymap(
    "n",
    "<leader>ns",
    "<cmd>lua require('package-info').show({ force = true })<cr>",
    { silent = true, noremap = true }
)

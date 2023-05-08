return {
    'LunarVim/darkplus.nvim',
    config = function ()
        local colorscheme = "darkplus"

        vim.g.onedarker_italic_keywords = false

        vim.g.onedarker_italic_functions = false

        vim.g.onedarker_italic_comments = true

        vim.g.onedarker_italic_loops = false

        vim.g.onedarker_italic_conditionals = false
    end
}
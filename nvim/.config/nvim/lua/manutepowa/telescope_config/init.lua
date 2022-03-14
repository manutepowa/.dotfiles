local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')



telescope.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = "$ ",
        use_less = true,
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        winblend = 0,
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require("telescope.sorters").get_generic_sorter,
        file_previewer   = previewers.vim_buffer_cat.new,
        grep_previewer   = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<A-j>"] = "move_selection_next",
                ["<A-k>"] = "move_selection_previous",
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
        layout_config = {
          horizontal = { width = 0.95 },
          preview_width = 0.4
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension 'fzy_native'

local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

telescope.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = "$ ",
        use_less = false,
        set_env = { ['COLORTERM'] = 'truecolor' },

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

telescope.load_extension('fzy_native')

-- local M = {}

-- M.search_config = function()
-- 	require("telescope.builtin").git_files({
-- 		prompt_title = "< dotfiles >",
-- 		cwd = "$HOME/.dotfiles",
-- 	})
-- end

-- M.project_files = function()
--   local opts = {} -- define here if you want to define something
--   local ok = pcall(require'telescope.builtin'.git_files, opts)
--   if not ok then require'telescope.builtin'.find_files(opts) end
-- end

-- M.branches = function()
--     require'telescope.builtin'.git_branches({ attach_mappings = function(_, map)
--       map('i', '<c-j>', actions.git_create_branch)
--       map('n', '<c-j>', actions.git_create_branch)
--       return true
--     end})
-- end

-- M.laravel_artisan = require('alpha.telescope_laravel').artisan
-- M.project_find = require('alpha.telescope_projectionist').find

-- M.grep_string = function ()
--     vim.ui.input("Grep for > ", function (input)
--         if input == nil then
--             return
--         end
--         require('telescope.builtin').grep_string({ search = input})
--     end)
-- end

-- return M
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'xiyaowong/telescope-emoji.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-tree/nvim-web-devicons' },
    {
      "folke/todo-comments.nvim",
      lazy = true,
      opts = {
        signs = false,
        highlight = {
          after = "empty",
        }
      },
    }
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({hidden = true}))<cr>",
    },
    {
      "<leader>''",
      "<cmd>Telescope help_tags theme=ivy<cr>",
    },
    {
      "<leader>fg",
      "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>",
    },
    { '<Leader>fh', ':Telescope oldfiles theme=ivy<cr>' },
    { '<Leader>fG', ':Telescope grep_string theme=ivy<cr>' },
    { '<Leader>fb', ':Telescope buffers theme=ivy<cr>' },
    -- todocomments keymaps
    { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX theme=ivy<cr>",                                        desc = "Todo" },
    { "<leader>fr", "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>", desc = "Resume" },
    { "<leader>fe", "<cmd>Telescope emoji theme=ivy<cr>",                                                        desc = "Emoji list" },
    -- Notes
    { "<leader>fn", "<cmd>SimpleNoteList<cr>",                                                                   desc = "List notes" },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup {
      defaults = vim.tbl_deep_extend(require('telescope.themes').get_ivy(), {
        file_ignore_patterns = { "^.git/" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--fixed-strings"
        },
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        -- layout_strategy = "vertical",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<A-j>"] = "move_selection_next",
            ["<A-k>"] = "move_selection_previous",
            -- ["<C-x>"] = false,
            ["<C-q>"] = actions.send_to_qflist,
            ["<A-BS>"] = function() vim.cmd('normal vbd') end,
          },
        },
        layout_config = {
          height = 0.99,
          width = 0.95,
          preview_cutoff = 1,
          -- preview_height = 0.5,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
      }),
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        emoji = {
          action = function(emoji)
            vim.fn.setreg("+", emoji.value)
            print([[Copied ]] .. emoji.value)

            -- insert emoji when picked
            -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        }
      }
    }

    require('telescope').load_extension('fzf')
    require("telescope").load_extension("emoji")
  end
}

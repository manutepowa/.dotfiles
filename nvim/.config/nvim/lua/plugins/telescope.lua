return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-tree/nvim-web-devicons' },
    {
      "folke/todo-comments.nvim",
      lazy = true,
      config = true,
    }
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, hidden = true})<cr>",
      silent = true
    },
    { '<Leader>fg', ':Telescope live_grep<cr>' },
    { '<Leader>fh', ':Telescope oldfiles<cr>' },
    { "<Leader>''", ':Telescope help_tags<cr>' },
    { '<Leader>fG', ':Telescope grep_string<cr>' },
    { '<Leader>fb', ':Telescope buffers<cr>' },
    { '<Leader>fg', ':Telescope live_grep<cr>' },
    -- todocomments keymaps
    { "<leader>td", "<cmd>TodoTrouble<cr>",      desc = "Todo (Trouble)" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>",    desc = "Todo" },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
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
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }

    require('telescope').load_extension('fzf')
    -- -- Telescope
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "<leader>ff",
    --   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, hidden = true})<cr>"
    --   ,
    --   { silent = true }
    -- )
  end
}

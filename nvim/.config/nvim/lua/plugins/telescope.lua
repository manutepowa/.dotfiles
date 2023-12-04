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
      silent = true
    },
    {
      "<leader>''",
      "<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy())<cr>",
      silent = true
    },
    {
      "<leader>fg",
      "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>",
      silent = true
    },
    { '<Leader>fh', ':Telescope oldfiles<cr>' },
    { '<Leader>fG', ':Telescope grep_string<cr>' },
    { '<Leader>fb', ':Telescope buffers<cr>' },
    -- todocomments keymaps
    { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", desc = "Todo" },
    { "<leader>fr", "<cmd>Telescope resume<cr>",                desc = "Todo" },
    { "<leader>fm", "<cmd>Telescope emoji<cr>",                 desc = "Emoji list" },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    local filetype_hook = function(filepath, bufnr, opts)
      local is_image = function(filepath)
        local image_extensions = { "png", "jpg" } -- Supported image formats
        local split_path = vim.split(filepath:lower(), ".", { plain = true })
        local extension = split_path[#split_path]
        return vim.tbl_contains(image_extensions, extension)
      end
      if not is_image(filepath) then
        return true
      end
      local ui = require "image.ui"
      local options = require "image.options"
      local dimensions = require "image.dimensions"
      local api = require "image.api"
      local config = require "image.config"
      local user_opts = {
        render = {
          foreground_color = true,
          background_color = true,
        },
      }
      local global_opts = vim.tbl_deep_extend("force", config.DEFAULT_OPTS, user_opts)

      local ascii_width, ascii_height, horizontal_padding, vertical_padding, img_width, img_height =
          dimensions.calculate_ascii_width_height(opts.winid, filepath, global_opts)
      options.set_options_before_render(bufnr)
      ui.buf_clear(bufnr)
      local label = ui.create_label(
        filepath,
        ascii_width,
        horizontal_padding,
        global_opts.render.show_image_dimensions,
        img_width,
        img_height
      )

      api.get_ascii_data_sync(filepath, ascii_width, ascii_height, global_opts, function(ascii_data)
        ui.buf_insert_data_with_padding(bufnr, ascii_data, horizontal_padding, vertical_padding, label, global_opts)

        options.set_options_after_render(bufnr)
      end)
      return false
    end

    telescope.setup {
      defaults = {
        file_ignore_patterns = { "^.git/" },
        preview = {
          filetype_hook = filetype_hook,
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
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
        },
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}

            vim.fn.setreg("+", emoji.value)
            print([[Press pppp]] .. emoji.value)

            -- insert emoji when picked
            -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        }
      }
    }

    require('telescope').load_extension('fzf')
    require("telescope").load_extension("emoji")

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

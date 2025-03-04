return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "xiyaowong/telescope-emoji.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-tree/nvim-web-devicons" },
      {
        "folke/todo-comments.nvim",
        lazy = true,
        opts = {
          signs = false,
          highlight = {
            after = "empty",
          },
        },
      },
    },
    keys = {
      {
        "<leader>gs",
        false,
      },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>",
      },
      {
        "<leader>''",
        "<cmd>Telescope help_tags<cr>",
      },
      {
        "<leader>fg",
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
      },
      { "<Leader>fh", ":Telescope oldfiles<cr>" },
      { "<Leader>fG", ":Telescope grep_string<cr>" },
      { "<Leader>fb", ":Telescope buffers<cr>" },
      -- todocomments keymaps
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", desc = "Todo" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Resume" },
      { "<leader>fe", "<cmd>Telescope emoji<cr>", desc = "Emoji list" },
      -- Notes
      { "<leader>fn", "<cmd>SimpleNoteList<cr>", desc = "List notes" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = vim.tbl_deep_extend("force", {
          file_ignore_patterns = { "^.git/" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--fixed-strings",
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
              ["<A-BS>"] = function()
                vim.cmd("normal vbd")
              end,
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
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        }, require("telescope.themes").get_ivy()),
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          emoji = {
            action = function(emoji)
              vim.fn.setreg("+", emoji.value)
              print([[Copied ]] .. emoji.value)

              -- insert emoji when picked
              -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
          },
        },
      })

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("emoji")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      -- Quickfix
      config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
      config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
      config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
      config.defaults.keymap.fzf["ctrl-x"] = "jump"
      config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
      config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
      config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
      config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

      -- Trouble
      if LazyVim.has("trouble.nvim") then
        config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
      end

      -- Toggle root dir / cwd
      config.defaults.actions.files["ctrl-r"] = function(_, ctx)
        local o = vim.deepcopy(ctx.__call_opts)
        o.root = o.root == false
        o.cwd = nil
        o.buf = ctx.__CTX.bufnr
        LazyVim.pick.open(ctx.__INFO.cmd, o)
      end
      config.defaults.actions.files["alt-c"] = config.defaults.actions.files["ctrl-r"]
      config.set_action_helpstr(config.defaults.actions.files["ctrl-r"], "toggle-root-dir")

      local img_previewer ---@type string[]?
      for _, v in ipairs({
        { cmd = "ueberzug", args = {} },
        { cmd = "chafa", args = { "{file}", "--format=symbols" } },
        { cmd = "viu", args = { "-b" } },
      }) do
        if vim.fn.executable(v.cmd) == 1 then
          img_previewer = vim.list_extend({ v.cmd }, v.args)
          break
        end
      end

      return {
        "default-title",
        prompt = "  ",
        fzf_colors = {
          ["fg"] = { "fg", "TelescopeNormal" },
          ["bg"] = { "bg", "TelescopeNormal" },
          ["hl"] = { "fg", "TelescopeMatching" },
          ["fg+"] = { "fg", "TelescopeSelection" },
          ["bg+"] = { "bg", "TelescopeSelection" },
          ["hl+"] = { "fg", "TelescopeMatching" },
          ["info"] = { "fg", "TelescopeMultiSelection" },
          ["border"] = { "bg", "TelescopeBorder" },
          ["gutter"] = "-1",
          ["query"] = { "fg", "TelescopePromptNormal" },
          ["prompt"] = { "fg", "TelescopePromptPrefix" },
          ["pointer"] = { "fg", "TelescopeSelectionCaret" },
          ["marker"] = { "fg", "TelescopeSelectionCaret" },
          ["header"] = { "fg", "TelescopeTitle" },
        },
        defaults = {
          prompt = "  ",
          fzf_opts = {
            ["--no-scrollbar"] = true,
            ["--header"] = " ",
          },
          winopts = {
            -- Emula el estilo "ivy" de Telescope
            height = 0.8, -- Altura reducida como en ivy
            width = 1.0, -- Ancho completo como en ivy
            row = 1.0, -- Posición en la parte inferior
            col = 0.5, -- Posición en la parte izquierda
            preview = {
              -- vertical = "up:60%", -- Vista previa arriba
              layout = "vertical", -- Disposición vertical
            },
            border = "none", -- Bordes minimalistas
          },
          formatter = "path.filename_first",
          -- formatter = "path.dirname_first",
        },
        previewers = {
          builtin = {
            extensions = {
              ["png"] = img_previewer,
              ["jpg"] = img_previewer,
              ["jpeg"] = img_previewer,
              ["gif"] = img_previewer,
              ["webp"] = img_previewer,
            },
            ueberzug_scaler = "fit_contain",
          },
        },

        files = {
          cwd_prompt = false,
          color_icons = true,
          fzf_opts = {
            ["--header"] = " ",
          },
        },
        lsp = {},
      }
    end,
    config = function(_, opts)
      if opts[1] == "default-title" then
        -- use the same prompt for all pickers for profile `default-title` and
        -- profiles that use `default-title` as base profile
        local function fix(t)
          t.prompt = t.prompt ~= nil and " " or nil
          for _, v in pairs(t) do
            if type(v) == "table" then
              fix(v)
            end
          end
          return t
        end
        opts = vim.tbl_deep_extend("force", fix(require("fzf-lua.profiles.default-title")), opts)
        opts[1] = nil
      end
      require("fzf-lua").setup(opts)
    end,
    init = function()
      LazyVim.on_very_lazy(function()
        vim.ui.select = function(...)
          require("lazy").load({ plugins = { "fzf-lua" } })
          local opts = LazyVim.opts("fzf-lua") or {}
          require("fzf-lua").register_ui_select(opts.ui_select or nil)
          return vim.ui.select(...)
        end
      end)
    end,
    dependencies = {
      {
        "folke/todo-comments.nvim",
        lazy = true,
        opts = {
          signs = false,
          highlight = {
            after = "empty",
          },
        },
      },
      { "nvim-tree/nvim-web-devicons" },
    },
    keys = {
      -- { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
      -- { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
      -- {
      --   "<leader>,",
      --   "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      --   desc = "Switch Buffer",
      -- },
      { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fh", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fg", LazyVim.pick("grep_project"), desc = "Grep (cwd)" },
      { "<leader>fG", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
      { "<leader>''", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
      { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume" },
      { "<leader>ft", "<cmd>TodoFzfLua keywords=TODO,FIX<CR>", desc = "Todo" },
      { "<leader>fn", LazyVim.pick("files", { cwd = "~/.dotfiles/notes/notes", search = "builtin" }), desc = "Notes" },
      {
        "<leader>gs",
        false,
      },
      -- { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      -- { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      -- find
      -- { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      -- { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      -- { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
      -- { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      -- git
      -- { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
      -- search
      -- { '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
      -- { "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
      -- { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
      -- { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      -- { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      -- { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
      -- { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
      -- { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
      -- { "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
      -- { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      -- { "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
      -- { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
      -- { "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
      -- { "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
      -- { "<leader>sw", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
      -- { "<leader>sW", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
      -- { "<leader>sw", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
      -- { "<leader>sW", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
      -- { "<leader>uC", LazyVim.pick("colorschemes"), desc = "Colorscheme with Preview" },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("fzf-lua").lsp_document_symbols({
      --       regex_filter = symbols_filter,
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      -- {
      --   "<leader>sS",
      --   function()
      --     require("fzf-lua").lsp_live_workspace_symbols({
      --       regex_filter = symbols_filter,
      --     })
      --   end,
      --   desc = "Goto Symbol (Workspace)",
      -- },
    },
  },
}

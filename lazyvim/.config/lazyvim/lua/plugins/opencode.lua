return {
  {
    "NickvanDyke/opencode.nvim",
    lazy = false,
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      local Terminal = require("toggleterm.terminal").Terminal

      local width_ratio = 0.9
      local height_ratio = 0.9

      local opencode_term = Terminal:new({
        cmd = "opencode --port",
        direction = "float",
        hidden = true,
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * width_ratio),
          height = math.floor(vim.o.lines * height_ratio),
          row = math.floor((vim.o.lines - (vim.o.lines * height_ratio)) / 2),
          col = math.floor((vim.o.columns - (vim.o.columns * width_ratio)) / 2),
        },
      })
      vim.g.opencode_opts = {
        provider = {
          start = function()
            if not opencode_term:is_open() then
              opencode_term:spawn()
            end
          end,

          toggle = function()
            opencode_term:toggle()
          end,

          show = function()
            if not opencode_term:is_open() then
              opencode_term:open()
            else
              opencode_term:focus()
            end
          end,
        },
      }

      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set("n", "<A-S-k>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "opencode half page up" })
      vim.keymap.set("n", "<A-S-j>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "opencode half page down" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n" }, "<leader>oa", function()
        require("opencode").prompt("@buffer")
      end, { desc = "Add to opencode" })
      vim.keymap.set({ "v" }, "<leader>oa", function()
        require("opencode").prompt("@this")
      end, { desc = "Add to opencode" })
      vim.keymap.set({ "n", "t" }, "<A-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })
      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })

      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:*", -- Optionally filter event types
        callback = function(args)
          ---@type opencode.cli.client.Event
          local event = args.data.event
          ---@type number
          local port = args.data.port

          -- See the available event types and their properties
          -- vim.notify(vim.inspect(event))

          -- Do something useful
          if event.type == "session.idle" then
            vim.notify("opencode finished")
          end
        end,
      })
    end,
  },
  -- {
  --   "sudo-tee/opencode.nvim",
  --   lazy = false,
  --   enabled = false, -- Set to true to enable this plugin
  --   config = function()
  --     require("opencode").setup({
  --       preferred_picker = "snacks", -- 'telescope', 'fzf', 'mini.pick', 'snacks', if nil, it will use the best available picker. Note mini.pick does not support multiple selections
  --       preferred_completion = "nvim-cmp", -- 'blink', 'nvim-cmp','vim_complete' if nil, it will use the best available completion
  --       default_global_keymaps = false, -- Disable default global keymaps since we're defining our own
  --       default_mode = "build", -- 'build' or 'plan' or any custom configured
  --       keymap_prefix = "<leader>o", -- Default keymap prefix for global keymaps
  --       keymap = {
  --         editor = {
  --           ["<A-.>"] = { "toggle" }, -- Open opencode. Close if opened (maintaining your original mapping)
  --           ["<leader>oi"] = { "open_input" }, -- Opens and focuses on input window on insert mode
  --           ["<leader>oI"] = { "open_input_new_session" }, -- Opens and focuses on input window on insert mode. Creates a new session
  --           ["<leader>oo"] = { "open_output" }, -- Opens and focuses on output window
  --           ["<leader>ot"] = { "toggle_focus" }, -- Toggle focus between opencode and last window
  --           ["<leader>oq"] = { "close" }, -- Close UI windows
  --           ["<leader>os"] = { "select_session" }, -- Select and load a opencode session
  --           ["<leader>op"] = { "configure_provider" }, -- Quick provider and model switch from predefined list
  --           ["<leader>od"] = { "diff_open" }, -- Opens a diff tab of a modified file since the last opencode prompt
  --           ["<leader>o]"] = { "diff_next" }, -- Navigate to next file diff
  --           ["<leader>o["] = { "diff_prev" }, -- Navigate to previous file diff
  --           ["<leader>oc"] = { "diff_close" }, -- Close diff view tab and return to normal editing
  --           ["<leader>ora"] = { "diff_revert_all_last_prompt" }, -- Revert all file changes since the last opencode prompt
  --           ["<leader>ort"] = { "diff_revert_this_last_prompt" }, -- Revert current file changes since the last opencode prompt
  --           ["<leader>orA"] = { "diff_revert_all" }, -- Revert all file changes since the last opencode session
  --           ["<leader>orT"] = { "diff_revert_this" }, -- Revert current file changes since the last opencode session
  --           ["<leader>orr"] = { "diff_restore_snapshot_file" }, -- Restore a file to a restore point
  --           ["<leader>orR"] = { "diff_restore_snapshot_all" }, -- Restore all files to a restore point
  --           ["<leader>ox"] = { "swap_position" }, -- Swap Opencode pane left/right
  --           ["<leader>opa"] = { "permission_accept" }, -- Accept permission request once
  --           ["<leader>opA"] = { "permission_accept_all" }, -- Accept all (for current tool)
  --           ["<leader>opd"] = { "permission_deny" }, -- Deny permission request once
  --         },
  --         input_window = {
  --           ["<cr>"] = {
  --             "submit_input_prompt",
  --             mode = "n",
  --           },
  --           ["<m-cr>"] = { -- To disable conflict with normal Enter key behavior in insert mode
  --             "submit_input_prompt",
  --             mode = { "i", "n" },
  --           },
  --           ["q"] = { "close" }, -- Close UI windows
  --           ["<esc>"] = { "cancel", mode = { "n", "i" } }, -- Cancel opencode while it is running
  --           ["~"] = { "mention_file", mode = "i" }, -- Pick a file and add to context. See File Mentions section
  --           ["@"] = { "mention", mode = "i" }, -- Insert mention (file/agent)
  --           ["/"] = { "slash_commands", mode = "i" }, -- Pick a command to run in the input window
  --           ["<tab>"] = { "switch_mode", mode = { "n", "i" } }, -- Switch between modes
  --           ["<up>"] = { "prev_prompt_history", mode = { "n", "i" } }, -- Navigate to previous prompt in history
  --           ["<down>"] = { "next_prompt_history", mode = { "n", "i" } }, -- Navigate to next prompt in history
  --           ["<M-n>"] = { "switch_mode", mode = { "n", "i" } }, -- Switch between modes (maintaining your original switch_mode mapping)
  --         },
  --         output_window = {
  --           ["<esc>"] = { "close" }, -- Close UI windows
  --           ["<C-c>"] = { "cancel" }, -- Cancel opencode while it is running
  --           ["]]"] = { "next_message" }, -- Navigate to next message in the conversation
  --           ["[["] = { "prev_message" }, -- Navigate to previous message in the conversation
  --           ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
  --           ["<C-i>"] = { "focus_input" }, -- Focus on input window and enter insert mode at the end of the input from the output window
  --           ["<leader>oS"] = { "select_child_session" }, -- Select and load a child session
  --           ["<leader>oD"] = { "debug_message" }, -- Open raw message in new buffer for debugging
  --           ["<leader>oO"] = { "debug_output" }, -- Open raw output in new buffer for debugging
  --           ["<leader>ods"] = { "debug_session" }, -- Open raw session in new buffer for debugging
  --         },
  --         permission = {
  --           accept = "a", -- Accept permission request once (only available when there is a pending permission request)
  --           accept_all = "A", -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
  --           deny = "d", -- Deny permission request once (only available when there is a pending permission request)
  --         },
  --       },
  --       ui = {
  --         position = "right",
  --         window_width = 0.70, -- Window width as ratio of total width
  --         display_model = true, -- Display model name on top winbar
  --         display_context_size = true,
  --         window_highlight = "Normal:OpencodeBackground,FloatBorder:OpencodeBorder", -- Highlight group for the opencode window
  --         icons = {
  --           preset = "nerdfonts", -- 'emoji' | 'ascii'. Choose UI icon style (default: 'emoji')
  --           overrides = {}, -- Optional per-key overrides, see section below
  --         },
  --         output = {
  --           tools = {
  --             show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
  --           },
  --         },
  --         input = {
  --           text = {
  --             wrap = true, -- Wraps text inside input window
  --           },
  --         },
  --       },
  --     })
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
}

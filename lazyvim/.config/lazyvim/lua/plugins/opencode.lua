return {
  "sudo-tee/opencode.nvim",
  lazy = false,
  config = function()
    require("opencode").setup({
      keymap = {
        global = {
          toggle = "<leader>oa", -- Open opencode. Close if opened
          open_input = "<leader>oi", -- Opens and focuses on input window on insert mode
          open_input_new_session = "<leader>oI", -- Opens and focuses on input window on insert mode. Creates a new session
          open_output = "<leader>oo", -- Opens and focuses on output window
          toggle_focus = "<leader>ot", -- Toggle focus between opencode and last window
          close = "<leader>oq", -- Close UI windows
          select_session = "<leader>os", -- Select and load a opencode session
          configure_provider = "<leader>op", -- Quick provider and model switch from predefined list
          diff_open = "<leader>od", -- Opens a diff tab of a modified file since the last opencode prompt
          diff_next = "<leader>o]", -- Navigate to next file diff
          diff_prev = "<leader>o[", -- Navigate to previous file diff
          diff_close = "<leader>oc", -- Close diff view tab and return to normal editing
          diff_revert_all_last_prompt = "<leader>ora", -- Revert all file changes since the last opencode prompt
          diff_revert_this_last_prompt = "<leader>ort", -- Revert current file changes since the last opencode prompt
          diff_revert_all = "<leader>orA", -- Revert all file changes since the last opencode session
          diff_revert_this = "<leader>orT", -- Revert current file changes since the last opencode session
          swap_position = "<leader>ox", -- Swap Opencode pane left/right
        },
        window = {
          submit_insert = "<C-s>",
          switch_mode = "<M-n>", -- Switch between modes (build/plan)
        },
      },
      ui = {
        fullscreen = false, -- Start in fullscreen mode (default: false)
        position = "right",
        window_width = 0.60, -- Window width as ratio of total width
        display_model = true, -- Display model name on top winbar
        display_context_size = true,
        window_highlight = "Normal:OpencodeBackground,FloatBorder:OpencodeBorder", -- Highlight group for the opencode window
        icons = {
          preset = "text", -- 'emoji' | 'ascii'. Choose UI icon style (default: 'emoji')
          overrides = {}, -- Optional per-key overrides, see section below
        },
        output = {
          tools = {
            show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
          },
        },
        input = {
          text = {
            wrap = true, -- Wraps text inside input window
          },
        },
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

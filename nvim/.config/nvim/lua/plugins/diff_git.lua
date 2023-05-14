return {
  'sindrets/diffview.nvim',
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local cb = require('diffview.config').diffview_callback
    require('diffview').setup {
      diff_binaries = false,               -- Show diffs for binaries
      enhanced_diff_hl = false,            -- See ':h diffview-config-enhanced_diff_hl'
      git_cmd = { "git" },                 -- The git executable followed by default args.
      use_icons = true,                    -- Requires nvim-web-devicons
      file_panel = {
        listing_style = "tree",            -- One of 'list' or 'tree'
        tree_options = {
          flatten_dirs = true,             -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
          hg = {
            single_file = {},
            multi_file = {},
          },
        },
      },
      key_bindings = {
        disable_defaults = true,                    -- Disable the default key bindings
        view = {
          ["<tab>"]      = cb("select_next_entry"), -- Open the diff for the next file
          ["<s-tab>"]    = cb("select_prev_entry"), -- Open the diff for the previous file
          ["gf"]         = cb("goto_file"),         -- Open the file in a new split in previous tabpage
          ["<C-w><C-f>"] = cb("goto_file_split"),   -- Open the file in a new split
          ["<C-w>gf"]    = cb("goto_file_tab"),     -- Open the file in a new tabpage
          ["<leader>e"]  = cb("focus_files"),       -- Bring focus to the files panel
          ["<A-e>"]      = cb("toggle_files"),      -- Toggle the files panel.
        },
        file_panel = {
          ["j"]             = cb("next_entry"),   -- Bring the cursor to the next file entry
          ["<down>"]        = cb("next_entry"),
          ["k"]             = cb("prev_entry"),   -- Bring the cursor to the previous file entry.
          ["<up>"]          = cb("prev_entry"),
          ["<tab>"]         = cb("select_entry"), -- Open the diff for the selected entry.
          ["o"]             = cb("select_entry"),
          ["<2-LeftMouse>"] = cb("select_entry"),
          ["-"]             = cb("toggle_stage_entry"),  -- Stage / unstage the selected entry.
          ["S"]             = cb("stage_all"),           -- Stage all entries.
          ["U"]             = cb("unstage_all"),         -- Unstage all entries.
          ["X"]             = cb("restore_entry"),       -- Restore entry to the state on the left side.
          ["R"]             = cb("refresh_files"),       -- Update stats and entries in the file list.
          ["gf"]            = cb("goto_file"),
          ["i"]             = cb("listing_style"),       -- Toggle between 'list' and 'tree' views
          ["f"]             = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
          ["<leader>e"]     = cb("focus_files"),
          ["<A-e>"]         = cb("toggle_files"),
        },
        file_history_panel = {
          ["g!"]            = cb("options"),          -- Open the option panel
          ["<C-A-d>"]       = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
          ["y"]             = cb("copy_hash"),        -- Copy the commit hash of the entry under the cursor
          ["zR"]            = cb("open_all_folds"),
          ["zM"]            = cb("close_all_folds"),
          ["j"]             = cb("next_entry"),
          ["<down>"]        = cb("next_entry"),
          ["k"]             = cb("prev_entry"),
          ["<up>"]          = cb("prev_entry"),
          ["<tab>"]         = cb("select_entry"),
          ["o"]             = cb("select_entry"),
          ["<2-LeftMouse>"] = cb("select_entry"),
          ["gf"]            = cb("goto_file"),
        },
        option_panel = {
          ["<tab>"] = cb("select"),
          ["q"] = cb("close"),
        },
      },
    }
  end
}

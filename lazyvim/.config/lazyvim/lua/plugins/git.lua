local icons = require("config.icons")
local solid_bar = icons.git.solid_bar
local dashed_bar = icons.git.dashed_bar

return {
  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = "",
        commit = "",
        merge_commit_end = "",
        commit_end = "",
        -- Advanced symbols
        GVER = "",
        GHOR = "",
        GCLD = "",
        GCRD = "╭",
        GCLU = "",
        GCRU = "",
        GLRU = "",
        GLRD = "",
        GLUD = "",
        GRUD = "",
        GFORKU = "",
        GFORKD = "",
        GRUDCD = "",
        GRUDCU = "",
        GLUDCD = "",
        GLUDCU = "",
        GLRDCL = "",
        GLRDCR = "",
        GLRUCL = "",
        GLRUCR = "",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          vim.notify("CodeDiff " .. commit.hash)
          vim.cmd(":CodeDiff " .. commit.hash)
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify("CodeDiff " .. from.hash .. "..." .. to.hash)
          vim.cmd(":CodeDiff " .. from.hash .. "..." .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = solid_bar },
        untracked = { text = solid_bar },
        change = { text = solid_bar },
        delete = { text = solid_bar },
        topdelete = { text = solid_bar },
        changedelete = { text = solid_bar },
      },
      signs_staged = {
        add = { text = dashed_bar },
        untracked = { text = dashed_bar },
        change = { text = dashed_bar },
        delete = { text = dashed_bar },
        topdelete = { text = dashed_bar },
        changedelete = { text = dashed_bar },
      },
      preview_config = { border = "rounded" },
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = false,
      },
    },
    keys = {
      { "<leader>ght", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Current Line Blame" },
    },
  },
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      diff = {
        layout = "inline", -- Diff layout: "side-by-side" (two panes) or "inline" (single pane with virtual lines)
      },
      explorer = {
        position = "left", -- "left" or "bottom"
        width = 30, -- Width when position is "left" (columns)
        indent_markers = false, -- Show indent markers in tree view (│, ├, └)
        initial_focus = "explorer", -- Initial focus: "explorer", "original", or "modified"
        view_mode = "tree", -- "list" or "tree"
        file_filter = {
          ignore = { ".git/**", ".jj/**" }, -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
        },
        focus_on_select = true, -- Jump to modified pane after selecting a file (default: stay in explorer)
      },
      keymaps = {
        view = {
          quit = "q",
          toggle_layout = "t",
        },
        explorer = {
          select = "<Tab>", -- Open diff for selected file
        },
        history = {
          select = "<Tab>", -- Select commit/file or toggle expand
          toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
        },
      },
    },
    keys = {
      { "<leader>dd", ":CodeDiff<CR>", desc = "CodeDiff" },
      { "<leader>df", ":CodeDiff history %<CR>", desc = "CodeDiff history file" },
      { "<leader>dh", ":CodeDiff history<CR>", desc = "CodeDiff history" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    init = function()
      require("git-conflict").setup({
        default_mappings = false,
        disable_diagnostics = true,
      })
    end,
    keys = {
      { "<leader>gcc", ":GitConflictChooseOurs<cr>" },
      { "<leader>gci", ":GitConflictChooseTheirs<cr>" },
      { "<leader>gcb", ":GitConflictChooseBoth<cr>" },
      { "<leader>gcl", ":GitConflictListQf<cr>" },
      { "]x", ":GitConflictNextConflict<cr>" },
      { "[x", ":GitConflictPrevConflict<cr>" },
    },
  },
}

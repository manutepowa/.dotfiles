return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  enabled = function()
    -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
    return not vim.g.disable_obsidian
  end,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>nn", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New note" },
    { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open note" },
    { "<leader>ns", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },
    { "<leader>nf", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link" },
    { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks" },
    { "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "Show tags" },
    { "<leader>ng", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>nw", "<cmd>ObsidianWorkspace<cr>", desc = "Switch workspace" },
    { "<leader>nd", "<cmd>ObsidianDailies<cr>", desc = "Daily notes" },
    { "<leader>nT", "<cmd>ObsidianTemplate<cr>", desc = "Insert template" },
    { "<leader>nl", "<cmd>ObsidianLinks<cr>", desc = "Collect all links" },
    { "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
    { "<leader>np", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image" },
    { "<leader>nc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle checkbox" },
  },
  opts = {
    workspaces = {
      {
        name = "notes", -- Name of the workspace
        path = os.getenv("HOME") .. "/.dotfiles/obsidian", -- Path to the notes directory
        overrides = {
          -- Override the default file extension for notes
          disable_frontmatter = true, -- Disable frontmatter for this workspace
        },
      },
    },
    completition = {
      cmp = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
    -- Optional, define your own callbacks to further customize behavior.
    callbacks = {
      -- Runs anytime you enter the buffer for a note.
      enter_note = function(client, note)
        -- Setup keymaps for obsidian notes
        vim.keymap.set("n", "gf", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = note.bufnr, desc = "Toggle checkbox" })

        vim.keymap.set("n", "<cr>", function()
          return require("obsidian").util.smart_action()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
      end,
    },

    -- Settings for templates
    templates = {
      subdir = "templates", -- Subdirectory for templates
      date_format = "%Y-%m-%d-%a", -- Date format for templates
      gtime_format = "%H:%M", -- Time format for templates
      tags = "", -- Default tags for templates
    },

    -- Use title as filename instead of ID
    note_id_func = function(title)
      if title ~= nil then
        -- Convert title to filename: remove special chars, replace spaces with hyphens
        return title:gsub("[^A-Za-z0-9 ]", ""):gsub(" ", "-"):lower()
      else
        -- Fallback to timestamp if no title
        return tostring(os.time())
      end
    end,
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    {
      "folke/todo-comments.nvim",
      optional = true,
      keys = {
        {
          "<leader>ft",
          function()
            Snacks.picker.todo_comments()
          end,
          desc = "Todo",
        },
      },
    },
  },
  opts = {
    bigfile = { enabled = true },
    statuscolumn = { enabled = true },
    image = { enabled = true },
    words = { enabled = false },
    indent = {
      indent = {
        char = "┊",
        hl = "SnacksIndentDark",
      },
      animate = {
        enabled = false,
      },
      scope = {
        enabled = true, -- enable highlighting the current scope
        char = "┊",
        only_current = true, -- only show scope in the current window
        hl = "SnacksIndentScopeDark", ---@type string|string[] hl group for scopes
      },
      chunk = {
        enabled = false,
      },
    },
    scroll = { enabled = false },
    input = { enabled = false },
    picker = {
      layout = {
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.8,
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "left",
          { win = "input", height = 1, border = "bottom" },
          {
            box = "vertical",
            { win = "list", border = "" },
            { win = "preview", title = "{preview}", width = 0, height = 0.7, border = "top" },
          },
        },
      },
      win = {
        -- input window
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<A-j>"] = { "list_down", mode = { "i", "n" } },
            ["<A-k>"] = { "list_up", mode = { "i", "n" } },
            ["<leader>x"] = "layout_bottom",
          },
        },
        b = {
          minipairs_disable = true,
        },
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
          truncate = 1000, -- truncate the file path to (roughly) this length
          filename_only = false, -- only show the filename
          icon_width = 2, -- width of the icon (in characters)
          git_status_hl = true, -- use the git status highlight group for the filename
        },
      },
    },
  },
  keys = {
    {
      "<leader>gs",
      "",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({
          hidden = true,
        })
      end,
      desc = "Find Files",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>fG",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>''",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
  },
}

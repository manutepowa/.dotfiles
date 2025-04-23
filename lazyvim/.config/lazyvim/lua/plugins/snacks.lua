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
    bufdelete = { enabled = true },
    statuscolumn = { enabled = false },
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
    },
    image = {
      enabled = false,
      img_dirs = { "httpdocs/public" },
      convert = {
        notify = false, -- show a notification on error
      },
      doc = {
        -- Personally I set this to false, I don't want to render all the
        -- images in the file, only when I hover over them
        -- render the image inline in the buffer
        -- if your env doesn't support unicode placeholders, this will be disabled
        -- takes precedence over `opts.float` on supported terminals
        inline = false,
        -- render the image in a floating window
        -- only used if `opts.inline` is disabled
        float = true,
        -- Sets the size of the image
        max_width = vim.g.neovim_mode == "skitty" and 20 or 40,
        max_height = vim.g.neovim_mode == "skitty" and 10 or 10,
        -- max_width = 60,
        -- max_height = 30,
        -- Apparently, all the images that you preview in neovim are converted
        -- to .png and they're cached, original image remains the same, but
        -- the preview you see is a png converted version of that image
        --
        -- Where are the cached images stored?
        -- This path is found in the docs
        -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
        -- For me returns `~/.cache/neobean/snacks/image`
        -- Go 1 dir above and check `sudo du -sh ./* | sort -hr | head -n 5`
      },
    },
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
      ui_select = true,
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
            ["<A-S-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<A-S-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<A-S-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["<A-S-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
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
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fK",
      function()
        Snacks.picker.keymaps({ mode = "n" })
      end,
      desc = "Keymaps (Normal)",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fM",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>i",
      function()
        Snacks.image.hover()
      end,
      desc = "Image",
    },
  },
}

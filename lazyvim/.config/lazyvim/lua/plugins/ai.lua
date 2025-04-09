return {
  {
    "yetone/avante.nvim",
    version = "v0.0.23",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "echasnovski/mini.icons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        enabled = false,
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    event = "VeryLazy",
    lazy = false,
    build = "make",
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o-mini",
        timeout = 15000, -- Timeout reducido a 15 segundos
        temperature = 0, -- Ajuste de temperatura para más variabilidad
        max_tokens = 4096, -- Reducir el número máximo de tokens
        ["local"] = false,
      },
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.0-flash",
        timeout = 15000,
        temperature = 0.2,
        max_tokens = 4096,
        ["local"] = false,
      },
      copilot = {
        model = "claude-3.5-sonnet",
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      hints = { enabled = false },
      windows = {
        position = "right", -- the position of the sidebar
        width = 55, -- default % based on available width
        input = {
          prefix = "➜ ",
          height = 4, -- Height of the input window in vertical layout
        },
        sidebar_header = {
          enabled = true, -- true, false to enable/disable the header
          align = "center", -- left, center, right for title
          rounded = false,
        },
        edit = {
          start_insert = true, -- Start insert mode when opening the edit window
        },
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
      },
      mappings = {
        -- ask = "<leader>ai",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        diff = {
          ours = "co",
          theirs = "ct",
          both = "cb",
          next = "]x",
          prev = "[x",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        toggle = {
          debug = "<leader>ad",
          hint = "<leader>ah",
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "v3.10.1",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      system_prompt = "Responde siempre en el mismo idioma que se te pregunte.",
      -- model = "gemini-2.0-flash-001",
      model = "claude-3.7-sonnet",
      answer_header = "<M3JS />",
      mappings = {
        accept_diff = {
          normal = "<Tab>",
        },
      },
      auto_insert_mode = true,
    },
    keys = {
      { "<leader>ci", "<cmd>CopilotChat<CR>", mode = { "n", "v" } },
      { "<leader>cl", "<cmd>CopilotChatReset<CR>", mode = { "n", "v" } },
      -- { "<C-l>", "", mode = { "n", "v" } },
    },
  },
}

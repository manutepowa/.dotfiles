return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
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
          file_types = { "markdown", "Avante", "codecompanion", "copilot-chat" },
          completions = {
            lsp = {
              enabled = true,
            },
          },
        },
        ft = { "markdown", "Avante", "codecompanion", "copilot-chat" },
      },
    },
    event = "VeryLazy",
    lazy = false,
    build = "make",
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4", -- or "gpt-4.1"
        },
      },
      cursor_applying_provider = "copilot",
      auto_suggestions_provider = "copilot",
      behaviour = {
        enable_cursor_planning_mode = true,
        auto_suggestions = false, -- Experimental stage
        auto_set_keymaps = false,
      },
      web_search_engine = {
        provider = "tavily",
        proxy = nil,
        -- providers = {
        --   tavily = {
        --     api_key_name = "TAVILY_API_KEY",
        --     extra_request_body = {
        --       include_answer = "basic",
        --     },
        --   },
        -- },
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        if not hub then
          return "You are a helpful AI assistant."
        end
        return hub:get_active_servers_prompt()
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      hints = { enabled = false },
      windows = {
        -- wrap = true, -- similar to vim.o.wrap
        width = 50, -- default % based on available width
        input = {
          prefix = "➜ ",
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
        -- list_opener = "copen",
        override_timeoutlen = 500,
      },
      mappings = {
        -- ask = "<leader>ai",
        -- edit = "<leader>ae",
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
    keys = {
      { "<leader>ai", "<cmd>AvanteAsk<CR>", mode = { "n", "v" }, desc = "Avante AI" },
      { "<leader>at", "<cmd>AvanteStop<CR>", mode = { "n" }, desc = "Avante Stop" },
      { "<leader>ae", "<cmd>AvanteEdit<CR>", mode = { "v" }, desc = "Avante Stop" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      system_prompt = "Responde siempre en el mismo idioma que se te pregunte.",
      -- model = "gemini-2.0-flash-001",
      model = "claude-sonnet-4",
      answer_header = "<M3JS />",
      mappings = {
        accept_diff = {
          normal = "<Tab>",
        },
      },
      context = { "buffer" },
      auto_insert_mode = true,
    },
    keys = {
      { "<leader>ci", "<cmd>CopilotChat<CR>", mode = { "n", "v" } },
      { "<leader>cl", "<cmd>CopilotChatReset<CR>", mode = { "n", "v" } },
      { "<leader>ct", "<cmd>CopilotChatStop<CR>", mode = { "n", "v" } },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "echasnovski/mini.diff",
        config = function()
          local diff = require("mini.diff")
          diff.setup({
            -- Disabled by default
            source = diff.gen_source.none(),
          })
        end,
      },
    },
    init = function()
      require("config.fidget-spinner"):init()
    end,
    opts = {
      display = {
        diff = {
          provider = "mini_diff",
        },
        chat = {
          start_in_insert_mode = true,
          icons = {
            pinned_buffer = " ",
            watched_buffer = "👀 ",
          },
          window = {
            width = 0.5, -- width of the window
            opts = {
              number = false,
              concealcursor = "n",
              conceallevel = 2,
            },
          },
        },
      },
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return "CodeCompanion (" .. adapter.formatted_name .. ")"
            end,
            user = "Me",
          },
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "snacks",
              },
            },
            ["buffer"] = {
              opts = {
                provider = "snacks",
              },
            },
          },
          adapter = "claude4", -- Default adapter for chat
          keymaps = {
            stop = {
              modes = {
                n = "<leader>ct",
              },
              index = 4,
              callback = "keymaps.stop",
              description = "Stop Request",
            },
            clear = {
              modes = {
                n = "<leader>cl",
              },
              index = 6,
              callback = "keymaps.clear",
              description = "Clear Chat",
            },
          },
          tools = {
            ["web_search"] = {
              callback = "strategies.chat.agents.tools.web_search",
              description = "Search the web for information",
              opts = {
                adapter = "tavily",
                -- opts = {
                --   search_depth = "basic",
                --   topic = "general",
                -- chunks_per_source = 3,
                -- max_results = 5,
                -- },
              },
            },
          },
        },
        inline = {
          adapter = "gpt41",
        },
      },
      adapters = {
        gpt4o = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "gpt-4o",
              },
            },
          })
        end,
        gpt41 = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "gpt-4.1",
              },
            },
          })
        end,
        claude4 = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-sonnet-4",
              },
            },
          })
        end,
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "CodeCompanion chat",
      },
      {
        "<leader>cC",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "CodeCompanion chat",
      },
      {
        "<leader>ca",
        "<cmd>CodeCompanionActions<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "CodeCompanion add to chat",
      },
      {
        "<leader>ce",
        "<cmd>CodeCompanion<cr>",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        desc = "CodeCompanion add to chat",
      },
    },
  },
}

return {
  {
    "saghen/blink.cmp",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
      "rafamadriz/friendly-snippets",
      "rcarriga/cmp-dap",
      "moyiz/blink-emoji.nvim",
      "ray-x/cmp-sql",
      {
        "saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
      },
    },
    opts = {
      snippets = {
        expand = function(snippet)
          return LazyVim.cmp.expand(snippet)
        end,
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<A-k>"] = { "select_prev", "fallback" },
        ["<A-j>"] = { "show", "select_next", "fallback" },
        ["<C-e>"] = {},
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<CR>"] = { "accept_and_enter", "fallback" },
          ["<A-k>"] = { "select_prev", "fallback" },
          ["<A-j>"] = { "select_next", "fallback" },
        },
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = {},
          },
          list = {
            selection = {
              -- When `true`, will automatically select the first item in the completion list
              preselect = false,
              -- When `true`, inserts the completion item automatically when selecting it
              auto_insert = true,
            },
          },
          -- Whether to automatically show the window when new completion items are available
          menu = { auto_show = true },
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        ghost_text = { enabled = true },
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        menu = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          -- nvim-cmp style menu
          draw = {
            gap = 1,
            treesitter = { "lsp" },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local icons = require("config.icons")
                  local kind_icons = icons.kind

                  return kind_icons[ctx.kind] or ""
                end,
              },
            },
          },
          auto_show = function()
            local fileType = {
              "copilot-chat",
              "DressingInput",
            }

            -- Desactivar en los tipos de archivo especificados
            for _, ft in ipairs(fileType) do
              if vim.bo.filetype == ft then
                return false
              end
            end

            -- Mantener el comportamiento normal para otros buffers
            return true
          end,
        },
      },
      signature = {
        enabled = true,
        window = {
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          border = "rounded",
          scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
          treesitter_highlighting = true,
          show_documentation = true,
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji", "sql", "dap", "avante" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert emoji (default) or complete its name
          },
          sql = {
            name = "sql",
            module = "blink.compat.source",
            score_offset = -3,
            should_show_items = function()
              return vim.tbl_contains({ "sql" }, vim.o.filetype)
            end,
          },
          dap = { name = "dap", module = "blink.compat.source" },
          path = {
            -- Path sources triggered by "/" interfere with CopilotChat commands
            enabled = function()
              return vim.bo.filetype ~= "copilot-chat"
            end,
          },
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
            score_offset = 100,
            enabled = true,
          },
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = {
      "sources.default",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    -- load cmp on InsertEnter
    event = { "UIEnter" },
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        print("Snippets not loaded")
        return
      end

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      luasnip.filetype_extend("javascript", { "html" })
      luasnip.filetype_extend("javascriptreact", { "html" })
      luasnip.filetype_extend("typescript", { "html" })
      luasnip.filetype_extend("typescriptreact", { "html" })
      require("luasnip/loaders/from_vscode").lazy_load()

      local icons = require("config.icons")
      local kind_icons = icons.kind
      local compare = require("cmp.config.compare")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        end,
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<A-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
          ["<A-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif not cmp.visible() then
              cmp.mapping(cmp.complete(), { "i", "c", "s" })
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind]
            vim_item.menu = ({
              nvim_lsp = "",
              luasnip = "",
              buffer = "",
              nvim_lua = "",
              path = "",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = {
          { name = "nvim_lsp", keyword_length = 1 },
          { name = "nvim_lua", keyword_length = 1 },
          { name = "luasnip", keyword_length = 1 },
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.locality,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },

        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          }),
        },
      })

      -- cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
      --   sources = cmp.config.sources({
      --     { name = "dap" },
      --   }, {
      --     { name = "buffer" },
      --   }),
      -- })
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {},
          },
        }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      --     vim.cmd [[
      --   highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
      --   highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
      -- ]]
    end,
  },
}

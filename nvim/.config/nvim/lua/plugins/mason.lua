return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local status_ok, mason = pcall(require, "mason")
    if not status_ok then
      return
    end

    local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not status_ok_1 then
      return
    end

    local servers = {
      "lua_ls",
      "astro",
      "tailwindcss",
      "cssls",
      "cssmodules_ls",
      "html",
      "jsonls",
      "dockerls",
      "ts_ls",
      "eslint",
      "intelephense",
      "rust_analyzer",
      "svelte",
    }

    local settings = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    mason.setup(settings)
    mason_lspconfig.setup {
      ensure_installed = servers,
      automatic_installation = true,
    }

    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status_ok then
      return
    end

    local opts = {}

    for _, server in pairs(servers) do
      opts = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("config.lsp.handlers").capabilities,
      }

      server = vim.split(server, "@")[1]

      if server == "lua_ls" then
        local sumneko_opts = require("config.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
      end

      if server == "tailwindcss" then
        local ts_ls = require("config.lsp.settings.tailwindcss")
        opts = vim.tbl_deep_extend("force", ts_ls, opts)
      end

      if server == "ts_ls" then
        -- server = "ts_ls"
        --   require("typescript").setup({
        --     -- disable_commands = false, -- prevent the plugin from creating Vim commands
        --     debug = false,     -- enable debug logging for commands
        --     go_to_source_definition = {
        --       fallback = true, -- fall back to standard LSP definition on failure
        --     },
        --     server = {
        --       -- pass options to lspconfig's setup method
        --       on_attach = opts.on_attach,
        --       capabilities = opts.capabilities,
        --       settings = {
        --         typescript = {
        --           inlayHints = {
        --             includeInlayEnumMemberValueHints = true,
        --             includeInlayFunctionLikeReturnTypeHints = true,
        --             includeInlayFunctionParameterTypeHints = false,
        --             includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        --             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --             includeInlayPropertyDeclarationTypeHints = true,
        --             includeInlayVariableTypeHints = true,
        --           },
        --         },
        --       },
        --     },
        --   })
      end

      if server == "jsonls" then
        lspconfig.jsonls.setup {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        }
      end

      lspconfig[server].setup(opts)
    end
  end
}

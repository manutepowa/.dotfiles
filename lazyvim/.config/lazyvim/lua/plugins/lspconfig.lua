local servers = {
  "ts_ls",
  "lua_ls",
  "tailwindcss",
  "intelephense",
  "astro",
  "cssls",
  "dockerls",
  "eslint",
  "jsonls",
  "biome",
  "twiggy_language_server",
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
        -- stylua: ignore
        vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
  },
  config = function()
    -- Global LSP configuration for all servers
    vim.lsp.config("*", {
      root_markers = { ".git", ".hg", ".svn", "package.json", "pyproject.toml", "go.mod" },
      capabilities = require("config.lsphandler").capabilities,
    })
    -- Server-specific configurations
    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          preferences = {
            importModuleSpecifierPreference = "relative",
          },
        },
      },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })

    vim.lsp.config("eslint", {
      settings = {
        packageManager = "npm",
      },
    })

    vim.lsp.config("biome", {
      settings = {
        biome = {
          lint = {
            enable = true,
          },
          format = {
            enable = true,
          },
        },
      },
    })

    vim.lsp.config("intelephense", {
      settings = {
        intelephense = {
          files = {
            maxSize = 5000000,
          },
        },
      },
    })

    vim.lsp.config("tailwindcss", {
      settings = {
        tailwindCSS = {
          includeLanguages = {
            javascript = "javascript",
            javascriptreact = "javascriptreact",
            typescript = "typescript",
            typescriptreact = "typescriptreact",
            html = "html",
            css = "css",
            astro = "astro",
          },
        },
      },
    })

    vim.lsp.config("astro", {
      settings = {
        astro = {
          typescript = {
            diagnostics = {
              strict = true,
            },
          },
        },
      },
    })

    vim.lsp.config("cssls", {
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })

    vim.lsp.config("dockerls", {
      settings = {
        docker = {
          languageserver = {
            docker = {
              diagnostics = {
                deprecatedMaintainerInstruction = "warning",
              },
            },
          },
        },
      },
    })

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json",
            },
          },
        },
      },
    })

    vim.lsp.config("twiggy_language_server", {
      settings = {
        twiggy = {
          diagnostics = {
            enable = true,
          },
        },
      },
    })

    -- Set up custom on_attach for all servers
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          require("config.lsphandler").on_attach(client, args.buf)
        end
      end,
    })

    -- Enable all servers for their respective filetypes
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}

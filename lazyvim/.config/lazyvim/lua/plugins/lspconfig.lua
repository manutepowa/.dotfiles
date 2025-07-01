local servers = {
  "ts_ls",
  "lua_ls",
  "tailwindcss",
  "intelephense",
  "astro",
  "cssls",
  "dockerls",
  "jsonls",
  "biome",
  "twiggy_language_server",
}

local serversToInstall = {
  ts_ls = {},
  lua_ls = {},
  tailwindcss = {},
  intelephense = {},
  astro = {},
  cssls = {},
  dockerls = {},
  jsonls = {},
  biome = {},
  twiggy_language_server = {},
}

return {
  "neovim/nvim-lspconfig",
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
  servers = serversToInstall,
  config = function(_)
    local lspconfig = require("lspconfig")
    local on_attach = require("config.lsphandler").on_attach
    local capabilities = require("config.lsphandler").capabilities

    -- NEW CONFIG 2.0 --> probar si funciona
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = servers,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      },
    })
  end,
}

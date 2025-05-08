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

local serversToInstall = {
  ts_ls = {},
  lua_ls = {},
  tailwindcss = {},
  intelephense = {},
  astro = {},
  cssls = {},
  dockerls = {},
  eslint = {},
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
    {
      "williamboman/mason-lspconfig.nvim",
      version = "1.*",
    },
    {
      "williamboman/mason.nvim",
      version = "1.*",
    },
  },
  servers = serversToInstall,
  config = function(plugin)
    -- lspconfig
    local pluginServers = plugin.servers or servers

    local opts = {}

    require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(pluginServers), automatic_installation = true })
    require("mason-lspconfig").setup_handlers({
      function(server)
        opts = {
          on_attach = require("config.lsphandler").on_attach,
          capabilities = require("config.lsphandler").capabilities,
        }
        require("lspconfig")[server].setup(opts)
      end,
    })

    -- NEW CONFIG 2.0 --> probar si funciona
    -- require("mason").setup()
    -- require("mason-lspconfig").setup({
    --   ensure_installed = { "lua_ls" },
    --   automatic_enable = true,
    --   handlers = {
    --     function(server_name)
    --       require("lspconfig")[server_name].setup({
    --         on_attach = require("config.lsphandler").on_attach,
    --         capabilities = require("config.lsphandler").capabilities,
    --       })
    --     end,
    --   },
    -- })
  end,
}

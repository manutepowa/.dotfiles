local servers = {
  "lua_ls",
  "tailwindcss",
  "astro",
  "phpantom_lsp",
  "cssls",
  "dockerls",
  "eslint",
  "jsonls",
  "biome",
  "twiggy_language_server",
  "kulala_ls",
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Global LSP configuration for all servers
    vim.lsp.config("*", {
      capabilities = require("config.lsphandler").capabilities,
      on_attach = require("config.lsphandler").on_attach,
    })

    -- phpantom_lsp: keep language features, delegate formatting to conform/php-cs-fixer
    vim.lsp.config("phpantom_lsp", {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        require("config.lsphandler").on_attach(client, bufnr)
      end,
    })

    -- Enable all servers for their respective filetypes
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}

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
      capabilities = require("config.lsphandler").capabilities,
      on_attach = require("config.lsphandler").on_attach,
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

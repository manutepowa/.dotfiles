local servers = {
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
  "kulala_ls",
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("typescript-tools").setup({
          on_attach = require("config.lsphandler").on_attach,
        })
      end,
      keys = {
        { "<leader>toi", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
        { "<leader>tsi", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
        { "<leader>tri", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
        { "<leader>tru", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused Statements" },
        { "<leader>tai", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
        { "<leader>tfa", "<cmd>TSToolsFixAll<cr>", desc = "Fix All Errors" },
        { "<leader>tgd", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
        { "<leader>trf", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
        { "<leader>tfr", "<cmd>TSToolsFileReferences<cr>", desc = "Find File References" },
      },
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

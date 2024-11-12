
local servers = {
  "tsserver",
  "tailwindcss",
  "intelephense",
  "astro",
  "cssls",
  "dockerls",
}


return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
        -- stylua: ignore
        vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
  },
  servers = nil,
    config = function(plugin)
      -- lspconfig
      local servers = plugin.servers or servers

      local opts = {}

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          opts = {
            on_attach = require("config.lsphandler").on_attach,
            capabilities = require("config.lsphandler").capabilities,
          }
          require("lspconfig")[server].setup(opts)
        end,
      })
    end,
}

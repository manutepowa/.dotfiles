return {
  "gbprod/phpactor.nvim",
  opts = {
    install = {
      bin = vim.fn.stdpath("data") .. "/mason/bin/phpactor",
    },
    lspconfig = {
      enabled = true,
      options = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("config.lsp.handlers").capabilities,
      },
    },
  },
  ft = "php",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  }
}

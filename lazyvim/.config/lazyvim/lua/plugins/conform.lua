return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "jq" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      twig = { "djlint" },
    },
  },
}

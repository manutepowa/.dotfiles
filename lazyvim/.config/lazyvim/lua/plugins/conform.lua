-- Función auxiliar para verificar archivos ESLint
local function check_eslint()
  local eslint_files = {
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
  }

  local root = vim.fn.getcwd()
  for _, file in ipairs(eslint_files) do
    if vim.fn.filereadable(root .. "/httpdocs/" .. file) == 1 then
      -- Si existe ESLint, no usar prettier
      return {}
    end
  end

  -- Si no hay ESLint, usar prettier
  return { "prettierd", "prettier" }
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "jq" },
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
      javascript = check_eslint,
      typescript = check_eslint,
      twig = { "djlint" },
    },
  },
}

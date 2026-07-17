local function find_project_file(names)
  local filename = vim.api.nvim_buf_get_name(0)
  local directory = vim.fs.dirname(filename)

  for _, name in ipairs(names) do
    local matches = vim.fs.find(name, {
      path = directory,
      upward = true,
      type = "file",
    })

    if #matches > 0 then
      return matches[1]
    end
  end
end

local function project_formatter()
  if
    find_project_file({
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      ".eslintrc.js",
      ".eslintrc.json",
    })
  then
    return {}
  end

  if find_project_file({
    "biome.json",
    "biome.jsonc",
  }) then
    return { "biome" }
  end

  if
    find_project_file({
      ".prettierrc",
      ".prettierrc.json",
      ".prettierrc.js",
      ".prettierrc.mjs",
      "prettier.config.js",
      "prettier.config.mjs",
    })
  then
    return { "prettierd", "prettier" }
  end

  return {}
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "jq" },
      javascript = project_formatter,
      typescript = project_formatter,
      javascriptreact = project_formatter,
      typescriptreact = project_formatter,
      php = { "php_cs_fixer" },
      markdown = {},
      http = { "kulala" },
    },
    formatters = {
      kulala = {
        command = "kulala-fmt",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
      php_cs_fixer = {
        args = {
          "fix",
          "--config",
          vim.fn.stdpath("config") .. "/.php-cs-fixer.dist.php",
          "$FILENAME",
        },
        stdin = false,
      },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Conform Format File",
    },
  },
}

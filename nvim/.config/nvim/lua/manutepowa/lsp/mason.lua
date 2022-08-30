local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "sumneko_lua",
  "tailwindcss",
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "prismals",
  "tsserver",
  "eslint",
  "intelephense",
  "phpactor",
  "yamlls",
  "rust_analyzer",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}


for _, server in pairs(servers) do
  opts = {
    on_attach = require("manutepowa.lsp.handlers").on_attach,
    capabilities = require("manutepowa.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "sumneko_lua" then
    local sumneko_opts = require("manutepowa.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "tailwindcss" then
    local tsserver = require("manutepowa.lsp.settings.tailwindcss")
    opts = vim.tbl_deep_extend("force", tsserver, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

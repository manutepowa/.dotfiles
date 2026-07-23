local M = {}

local function lsp_keymaps(clientName)
  -- Enable completion triggered by <c-x><c-o>
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { buffer = 0 })
  vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", { buffer = 0 })

  vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = 0 })
  vim.keymap.set("n", "<S-l>", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = 0 })

end

M.on_attach = function(client, bufnr)
  if client.name == "ts_ls" or client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client.name == "biome" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client.name == "astro" then
    client.server_capabilities.documentFormatting = true
  end

  lsp_keymaps(client.name)
  -- lsp_highlight_document(client)
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
--   max_width = width,
--   max_height = height,
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
return M

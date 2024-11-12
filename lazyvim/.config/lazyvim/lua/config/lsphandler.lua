local M = {}

local function lsp_highlight_document(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local function lsp_keymaps(clientName)
  -- if clientName == "intelephense" or clientName == "phpactor" then
  --   vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  -- else
  -- end

  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = 0 })

  -- Enable completion triggered by <c-x><c-o>
  -- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { buffer = 0 })
  vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", { buffer = 0 })

  vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = 0 })
  vim.keymap.set(
    "n",
    "<S-l>",
    '<cmd>lua vim.diagnostic.open_float()<CR>',
    { buffer = 0 }
  )
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end


M.on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = true
  end
  -- print("lsp_on_attach", client.name, client.resolved_capabilities.document_formatting)
  if client.name == "cssls" then
    client.server_capabilities.documentFormattingProvider = true
  end

  if client.name == "intelephense" then
    client.server_capabilities.documentFormattingProvider = true
  end

  if client.name == "astro" then
    client.server_capabilities.documentFormattingProvider = true
  end


  lsp_keymaps(client.name)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
return M

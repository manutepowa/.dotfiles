local M = {}

-- TODO: backfill this to template
M.setup = function()
  local icons = require "config.icons"
  local signs = {

    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      border = "rounded",
      -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  --
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  --   vim.lsp.handlers.signature_help, {
  --     border = "single"
  --   }
  -- )
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentFormattingProvider then
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local function lsp_keymaps(clientName)
  if clientName == "intelephense" or clientName == "phpactor" then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  else
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = 0 })
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { buffer = 0 })
  vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", { buffer = 0 })
  --[[ vim.keymap.set("n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts) ]]
  -- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = 0 })
  -- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = 0 })

  vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = 0 })
  vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', { buffer = 0 })
  vim.keymap.set(
    "n",
    "<S-l>",
    '<cmd>lua vim.diagnostic.open_float()<CR>',
    { buffer = 0 }
  )
  vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', { buffer = 0 })
  vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.setloclist()<CR>", { buffer = 0 })
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

--
-- local function filter(arr, fn)
-- 	if type(arr) ~= "table" then
-- 		return arr
-- 	end
--
-- 	local filtered = {}
-- 	for k, v in pairs(arr) do
-- 		if fn(v, k, arr) then
-- 			table.insert(filtered, v)
-- 		end
-- 	end
--
-- 	return filtered
-- end
--
-- local function filterReactDTS(value)
-- 	return string.match(value.uri, 'react/index.d.ts') == nil
-- end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = true
  end
  -- print("lsp_on_attach", client.name, client.resolved_capabilities.document_formatting)
  if client.name == "cssls" then
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

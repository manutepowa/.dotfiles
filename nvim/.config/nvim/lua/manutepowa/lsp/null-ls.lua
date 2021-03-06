local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    -- diagnostics.php,
    formatting.stylua,
    -- diagnostics.phpstan,
    null_ls.builtins.hover.dictionary
  },
  -- on_attach = function(client)
  --          if client.resolved_capabilities.document_formatting then
  --
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --   end
  -- end,
}

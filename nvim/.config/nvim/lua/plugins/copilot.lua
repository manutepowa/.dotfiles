return {
  'github/copilot.vim',
  lazy = true,
  event = 'InsertEnter',
  init = function()
    vim.g.copilot_filetypes = {
      ['*'] = true,
      ["dap-repl"] = false,
      gitcommit = false,
    }
  end
}

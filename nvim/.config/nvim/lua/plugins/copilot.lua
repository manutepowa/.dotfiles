return {
  'github/copilot.vim',
  lazy = true,
  event = 'InsertEnter',
  init = function()
    vim.g.copilot_filetypes = {
      ['*'] = true,
      gitcommit = false,
    }
  end
}

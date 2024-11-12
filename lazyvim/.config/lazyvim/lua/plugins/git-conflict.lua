return {
  'akinsho/git-conflict.nvim',
  init = function()
    require('git-conflict').setup {
      default_mappings = false,
      disable_diagnostics = true,
    }
  end,
  keys = {
    { '<leader>gcc', ':GitConflictChooseOurs<cr>' },
    { '<leader>gci', ':GitConflictChooseTheirs<cr>' },
    { '<leader>gcb', ':GitConflictChooseBoth<cr>' },
    { '<leader>gcl', ':GitConflictListQf<cr>' },
    { ']x',          ':GitConflictNextConflict<cr>' },
    { '[x',          ':GitConflictPrevConflict<cr>' },
  },
}

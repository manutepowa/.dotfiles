return {
  'NeogitOrg/neogit',
  dependencies = {
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim'
  },
  cmd = 'Neogit',
  keys = {
    { '<Leader>gs', '<cmd>Neogit<CR>', desc = 'Neogit' },
  },
  -- See: https://github.com/TimUntersberger/neogit#configuration
  config = function()
    local icons = require "config.icons"

    require("neogit").setup {
      disable_signs = false,
      -- disable_hint = true,
      disable_context_highlighting = true,
      disable_commit_confirmation = true,
      disable_insert_on_commit = "auto",
      auto_refresh = true,
      disable_builtin_notifications = false,
      -- Change the default way of opening neogit
      kind = "tab",
      -- Change the default way of opening the commit popup
      commit_popup = {
        kind = "split",
      },
      -- Change the default way of opening popups
      popup = {
        kind = "split",
      },
      -- customize displayed signs
      signs = {
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    }
  end
}

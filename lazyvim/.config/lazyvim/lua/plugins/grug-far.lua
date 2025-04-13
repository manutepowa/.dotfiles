return {
  "MagicDuck/grug-far.nvim",
  config = function()
    -- optional setup call to override plugin options
    -- alternatively you can set options with vim.g.grug_far = { ... }
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
      -- be specified
      keymaps = {
        replace = "<leader>r",
        applyNext = "<Tab>",
        close = false, -- Deshabilitar keymap
        nextInput = false,
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "grug-far",
      callback = function()
        local ufo = require("ufo")
        if ufo then
          ufo.detach() -- Desconectar UFO de este buffer
        end
      end,
      desc = "Disable folding in grug-far buffer",
    })
  end,
  keys = {
    {
      "<leader>r",
      mode = "n",
      "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>",
      desc = "Open (Limit to current file)",
    },
    {
      "<leader>r",
      mode = "v",
      "<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<cr>",
      desc = "Search selection",
    },
  },
}

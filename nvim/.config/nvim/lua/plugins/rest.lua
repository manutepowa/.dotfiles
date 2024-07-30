return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  ft = "hurl",
  cmd = 'HurlRunnerAt',
  config = function(config)
    local rest_nvim = require "hurl"

    rest_nvim.setup {
      env_file = {
        '.env',
      },
      -- Show debugging info
      debug = false,
      -- Show notification on run
      show_notification = false,
      -- Show response in popup or split
      mode = "split",
      -- Default formatter
      formatters = {
        json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
        html = {
          'prettier',    -- Make sure you have install prettier in your system, e.g: npm install -g prettier
          '--parser',
          'html',
        },
        xml = {
          'tidy', -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
          '-xml',
          '-i',
          '-q',
        },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "hurl",
      callback = function()
        local buff = tonumber(vim.fn.expand "<abuf>", 10)
        vim.keymap.set(
          "n",
          "<leader>r",
          "<cmd>HurlRunnerAt<CR>",
          { noremap = true, buffer = buff, desc = "Run near http request" }
        )
      end,
    })
  end,
}

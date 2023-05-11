return {
  "NTBBloodbath/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "http",
  config = function(config)
    local rest_nvim = require "rest-nvim"

    rest_nvim.setup {
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      encode_url = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        formatters = {
          vnd = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        }, -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        local buff = tonumber(vim.fn.expand "<abuf>", 10)
        vim.keymap.set(
          "n",
          "<leader>r",
          rest_nvim.run,
          { noremap = true, buffer = buff, desc = "Run near http request" }
        )
        vim.keymap.set("n", "<leader>hr", function()
          rest_nvim.run(true)
        end, { noremap = true, buffer = buff, desc = "Preview http curl" })
      end,
    })
  end,
}

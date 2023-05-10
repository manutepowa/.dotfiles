return {
  "NTBBloodbath/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { '<leader>r', ':lua require("rest-nvim").run()<CR>' },
  },
  config = function(config)
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        formatters = {
          json = "jq",
          vnd = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
      -- Jump to request line on run
      jump_to_request = true,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end,
}
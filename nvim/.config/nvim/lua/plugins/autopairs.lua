return {
  "windwp/nvim-autopairs",
  dependencies = {
    { 'windwp/nvim-ts-autotag' }
  },
  config = function()
    require('nvim-autopairs').setup({
      check_ts = true,
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
      },
      disable_filetype = { 'TelescopePrompt', 'vim' },
      fast_wrap = {},
    })
  end,
}

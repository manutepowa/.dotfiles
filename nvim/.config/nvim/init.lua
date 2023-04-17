-- P = function(v)
--   print(vim.inspect(v))
--   return v
-- end
--
-- RELOAD = function(...)
--   return require("plenary.reload").reload_module(...)
-- end
--
-- R = function(name)
--   RELOAD(name)
--   return require(name)
-- end
--
-- Load impatient
-- local status_ok, impatient = pcall(require, "impatient")
-- if not status_ok then
--     return
-- end
--
-- impatient.enable_profile()
require 'impatient'
require 'plugins'
require 'manutepowa.options'
require 'manutepowa.mappings'
require 'manutepowa.theme'
require 'manutepowa.lualine'
require 'manutepowa.cmp'
require 'manutepowa.lsp'
require 'manutepowa.telescope'
require 'manutepowa.projects'
require 'manutepowa.treesitter'
require 'manutepowa.autopairs'
require 'manutepowa.comment'
require 'manutepowa.gitsigns'
require 'manutepowa.toggleterm'
require 'manutepowa.nvim-tree'
require 'manutepowa.bufferline'
require 'manutepowa.indentline'
require 'manutepowa.dap_config'
require 'manutepowa.translate'
require 'manutepowa.packer-info'
require 'manutepowa.diff_git'
require 'manutepowa.restclient'
require 'manutepowa.lab'
require 'manutepowa.neoai'

-- require 'manutepowa.dadbod'

-- Simple options
require 'colorizer'.setup({
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "css",
    "html",
    "astro",
    "lua",
  },
  user_default_options = {
    rgb_fn = true,
    tailwind = "both",
  },
  buftypes = {
    -- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
    -- Not sure if the window has a `buftype` at all
  },
})

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

-- Load impatient
-- local status_ok, impatient = pcall(require, "impatient")
-- if not status_ok then
--     return
-- end
--
-- impatient.enable_profile()

require 'manutepowa.theme'
require 'manutepowa.lualine'
require 'manutepowa.mappings'
require 'manutepowa.cmp'
require 'manutepowa.lsp'
require 'manutepowa.telescope_config'
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
require 'manutepowa.options'

-- Simple options
require 'colorizer'.setup()

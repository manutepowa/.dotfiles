P = function (v)
    print(vim.inspect(v))
    return v
end

RELOAD = function (...)
    return require("plenary.reload").reload_module(...)
end

R = function (name)
    RELOAD(name)
    return require(name)
end


require 'manutepowa.options'
require 'manutepowa.theme'
require 'manutepowa.lualine'
require 'manutepowa.mappings'
require 'manutepowa.cmp'
require 'manutepowa.lsp'
require 'manutepowa.telescope'
require 'manutepowa.treesitter'
require 'manutepowa.autopairs'
require 'manutepowa.gitsigns'
require 'manutepowa.nvim-tree'
require 'manutepowa.bufferline'
require 'manutepowa.indentline'
require 'manutepowa.alpha'
require 'manutepowa.dap'

-- Simple options
require 'colorizer'.setup()

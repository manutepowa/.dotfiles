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


require('manutepowa._options')
require('manutepowa._mappings')
require('manutepowa._telescope')
require('manutepowa._treesitter')

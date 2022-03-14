local dap = require("dap")
local dapui = require("dapui")

local M = {}

M.stop = function ()
    dap.close()
    dap.repl.close()
    if dapui then
       dapui.close()
    end
end


return M

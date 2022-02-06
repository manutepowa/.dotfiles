local dap = require("dap")
local dapui = require("dapui")

local M = {}

M.stop = function ()
    dap.terminate()
    dapui.close()
    -- dap.clear_breakpoints()
end


return M

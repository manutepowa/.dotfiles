return {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    -- [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

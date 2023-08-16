return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "custom_nvim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
        hint = { enable = true },
        telemetry = { enable = false },
      },
    },
  },
}

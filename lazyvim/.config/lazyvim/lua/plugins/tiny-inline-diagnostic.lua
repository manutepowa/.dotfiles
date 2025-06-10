return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      transparent_bg = false, -- Set the background of the diagnostic to transparent
      transparent_cursorline = false,
      options = {
        show_source = {
          enabled = true,
          if_many = false,
        },

        multilines = {
          -- Enable multiline diagnostic messages
          enabled = true,
          -- Always show messages on all lines for multiline diagnostics
          always_show = false,
        },
        -- Display all diagnostic messages on the cursor line
        show_all_diags_on_cursorline = true,
        overflow = {
          -- Manage how diagnostic messages handle overflow
          -- Options:
          -- "wrap" - Split long messages into multiple lines
          -- "none" - Do not truncate messages
          -- "oneline" - Keep the message on a single line, even if it's long
          mode = "wrap",

          -- Trigger wrapping to occur this many characters earlier when mode == "wrap".
          -- Increase this value appropriately if you notice that the last few characters
          -- of wrapped diagnostics are sometimes obscured.
          padding = 0,
        },
      },
    })
    vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
  end,
}

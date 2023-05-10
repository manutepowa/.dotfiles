return {
  'norcalli/nvim-colorizer.lua',
  event = { "BufWinEnter", "BufRead", "BufReadPost" },
  config = function()
    require "colorizer".setup({
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
        css = true,
        tailwind = "both",
      }
    }, { mode = 'background' })
  end
}

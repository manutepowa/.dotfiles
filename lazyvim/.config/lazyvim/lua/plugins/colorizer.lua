return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufWinEnter", "BufRead", "BufReadPost" },
  opts = {
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
    options = {
      parsers = {
        css = true,
        tailwind = { enable = true },
      },
      display = {
        mode = "virtualtext",
        virtualtext = {
          char = "■",
        },
      },
    },
  },
}

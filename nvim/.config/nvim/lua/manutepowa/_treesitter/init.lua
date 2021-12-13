require'nvim-treesitter.configs'.setup {
    highlight = { enable = false },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters
      max_file_lines = 1000,
    },
    ensure_installed = {
      "json",
      "html",
      "php",
      "javascript",
      "css",
      "scss",
      "typescript"
    }
  }

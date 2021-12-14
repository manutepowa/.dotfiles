require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "json",
      "html",
      "php",
      "javascript",
      "css",
      "scss",
      "typescript",
      "lua"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = false, -- Highlight also non-parentheses delimiters
      max_file_lines = nil,
    },
    autotag = {
      enable = true
    }
  }


local npairs = require("nvim-autopairs")
npairs.setup({
    check_ts = true,
	enable_moveright = true,
})

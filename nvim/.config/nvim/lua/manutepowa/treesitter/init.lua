require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autopairs = {
      enable = true,
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


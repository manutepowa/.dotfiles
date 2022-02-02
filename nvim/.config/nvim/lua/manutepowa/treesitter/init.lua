require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    colors = {
			"Gold",
			"DodgerBlue",
			"Cornsilk",
			"Salmon",
			"LawnGreen",
		},
    disable = { "html" },
    extended_mode = false, -- Highlight also non-parentheses delimiters
    max_file_lines = nil,
  },
  autotag = {
    enable = true
  }
}


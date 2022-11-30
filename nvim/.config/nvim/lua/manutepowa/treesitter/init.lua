require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = function(lang, bufnr) -- Disable in large C++ buffers
      -- disable highlight if file has > 6000 LOC
      return lang == "css" or vim.api.nvim_buf_line_count(bufnr) > 60000
      -- return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 50000
    end,
    -- disable = { "css" }, -- list of language that will be disabled
    -- additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
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
    enable = true,
    disable = { "xml", "markdown" },
  }
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "" },  -- List of parsers to ignore installing
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      highlight = {
        enable = true,                  -- false will disable the whole extension
        disable = function(lang, bufnr) -- Disable in large C++ buffers
          return lang == "css" or vim.api.nvim_buf_line_count(bufnr) > 60000
        end,
      },
      indent = { enable = true, disable = { "python", "css" } },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
        disable = { "xml", "markdown" },
      }
    }
    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}

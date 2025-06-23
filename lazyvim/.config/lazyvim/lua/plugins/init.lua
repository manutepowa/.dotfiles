return {
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = {
      {
        "rafamadriz/friendly-snippets", -- Snippets collection
        config = function()
          local luasnip = require("luasnip")

          require("luasnip.loaders.from_vscode").lazy_load()
          luasnip.filetype_extend("javascript", { "html" })
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescript", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
        end,
      },
    },
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  { "alexghergh/nvim-tmux-navigation" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "tpope/vim-sleuth" },
}

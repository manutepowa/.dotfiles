return {
  'tpope/vim-fugitive',
  {
    'rbong/vim-flog',
    config = function()
      vim.g.flog_default_opts = {
        max_count = 512,
        date = 'short',
      }
      vim.g.flog_use_internal_lua = true
    end
  },
  { 'rhysd/git-messenger.vim' },
  { 'lumiliet/vim-twig' },
  { 'mg979/vim-visual-multi' },

  {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'wellle/targets.vim' },
  { 'antoinemadec/FixCursorHold.nvim' },
  { 'tpope/vim-surround' },
  { 'ryanoasis/vim-devicons' },
  { "tpope/vim-repeat" },
  { "RRethy/vim-illuminate" },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "filipdutescu/renamer.nvim" },
  { "simrat39/symbols-outline.nvim" },
  { "folke/trouble.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "b0o/schemastore.nvim" },
  { 'L3MON4D3/LuaSnip' },
  { "rafamadriz/friendly-snippets" },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "metakirby5/codi.vim" },
  { "moll/vim-bbye" },
  { 'fladson/vim-kitty' },
  { 'christoomey/vim-tmux-navigator' },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- }
}

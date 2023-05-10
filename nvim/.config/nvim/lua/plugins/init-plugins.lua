return {
  'tpope/vim-fugitive',
  {
    'AchmadFathoni/vim-flog',
    config = function()
      vim.g.flog_default_opts = {
        max_count = 512,
        date = 'short',
      }
      vim.g.flog_use_internal_lua = true
    end
  },
  { 'rhysd/git-messenger.vim' },
  { 'github/copilot.vim' },
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
  { 'norcalli/nvim-colorizer.lua' },
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

  { "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui" },
  { "Pocco81/DAPInstall.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  { "metakirby5/codi.vim" },


  { "moll/vim-bbye" },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true
      }
      vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#FFFFFF', bold = true, underline = true })
      vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#FFFFFF', underline = true })
    end
  },
  { 'fladson/vim-kitty' },
  { 'christoomey/vim-tmux-navigator' }
}

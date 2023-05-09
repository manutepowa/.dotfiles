return {
  {'glepnir/lspsaga.nvim'},
  'wbthomason/packer.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'kyazdani42/nvim-web-devicons' }
    }
  },
  { "ahmedkhalf/project.nvim" },
  { 'windwp/nvim-ts-autotag' },
  { 'windwp/nvim-autopairs' },

  { 'uga-rosa/translate.nvim' },
  'tpope/vim-fugitive',
  { 'AchmadFathoni/vim-flog', config = function()
    vim.g.flog_default_opts = {
      max_count = 512,
      date = 'short',
    }
    vim.g.flog_use_internal_lua = true
  end },
  {'rhysd/git-messenger.vim'},
  {'mhartington/oceanic-next'},
  {'lunarvim/darkplus.nvim'},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  }
  {'github/copilot.vim'},
  {'kyazdani42/nvim-web-devicons'},
  { 'akinsho/bufferline.nvim', tag = "*", dependencies = 'kyazdani42/nvim-web-devicons' },
  {'lewis6991/gitsigns.nvim'},
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  {'lumiliet/vim-twig'},
  {'mg979/vim-visual-multi'},

  {'numToStr/Comment.nvim'},
  {'JoosepAlviste/nvim-ts-context-commentstring'},
  {'wellle/targets.vim'},
  {'antoinemadec/FixCursorHold.nvim'},
{'lukas-reineke/indent-blankline.nvim'},
{'tpope/vim-surround'},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  },
  'norcalli/nvim-colorizer.lua'},
  'ryanoasis/vim-devicons'},
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  {"tpope/vim-repeat"},
{"RRethy/vim-illuminate"},
{'hrsh7th/nvim-cmp'},
{'hrsh7th/cmp-buffer'},
{'hrsh7th/cmp-path'},
{'hrsh7th/cmp-cmdline'},
{'saadparwaiz1/cmp_luasnip'},
{"hrsh7th/cmp-nvim-lsp"},
{"hrsh7th/cmp-nvim-lua"},
{"rcarriga/cmp-dap"},
{'onsails/lspkind-nvim'},
{"neovim/nvim-lspconfig"},
{"williamboman/mason.nvim"},
{"williamboman/mason-lspconfig.nvim"},
{"tamago324/nlsp-settings.nvim"},
{"jose-elias-alvarez/null-ls.nvim"},
{"filipdutescu/renamer.nvim"},
{"simrat39/symbols-outline.nvim"},
  { "folke/trouble.nvim" },

{"ray-x/lsp_signature.nvim"},
{"jose-elias-alvarez/typescript.nvim"},
{"b0o/schemastore.nvim"},

{'L3MON4D3/LuaSnip'},
{"rafamadriz/friendly-snippets"},

{"mfussenegger/nvim-dap"},
{"theHamsta/nvim-dap-virtual-text"},
  { "rcarriga/nvim-dap-ui" },
{"Pocco81/DAPInstall.nvim"},

  { "NTBBloodbath/rest.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

{"akinsho/toggleterm.nvim"},

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  { "metakirby5/codi.vim" },
  { '0x100101/lab.nvim', build = 'cd js && npm ci', dependencies = { 'nvim-lua/plenary.nvim' } },

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
  {'fladson/vim-kitty',
  {
    "Bryley/neoai.nvim",
    require = { "MunifTanjim/nui.nvim" },
  }
  { 'christoomey/vim-tmux-navigator' }
}

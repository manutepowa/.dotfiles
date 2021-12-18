vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'kyazdani42/nvim-web-devicons' }
        }
    }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'p00f/nvim-ts-rainbow' }
	use { 'windwp/nvim-ts-autotag' }
	use { 'windwp/nvim-autopairs' }

	-- Vim fugitive
	use 'tpope/vim-fugitive'

	-- Themes
	use 'mhartington/oceanic-next'
	use 'lunarvim/darkplus.nvim'
	-- Copilot
	use 'github/copilot.vim'

	-- Tabs
	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'

	-- Git Lines edited
	use 'lewis6991/gitsigns.nvim'
	-- use 'mhinz/vim-signify'

	-- PHP
	use 'lumiliet/vim-twig'

	-- MultiCursor
	use 'mg979/vim-visual-multi'

	use 'numToStr/Comment.nvim'

	-- Replace delete and change di', ci(
	use 'wellle/targets.vim'

	use 'antoinemadec/FixCursorHold.nvim'
	use 'mattn/emmet-vim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'sheerun/vim-polyglot' -- A collection of language packs for Vim
	use 'tpope/vim-surround' -- Surrounding ysw)
	use 'kyazdani42/nvim-tree.lua'
	use 'vim-airline/vim-airline' -- Status bar
	use 'ap/vim-css-color' -- CSS Color Preview
	use 'ryanoasis/vim-devicons' -- Developer Icons
	use "goolord/alpha-nvim"


	-- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
	use "f3fora/cmp-spell"
  -- Icons CMP
  use 'onsails/lspkind-nvim'

-- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	-- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

end)

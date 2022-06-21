vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'lewis6991/impatient.nvim' }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-telescope/telescope-fzy-native.nvim' },
			{ 'kyazdani42/nvim-web-devicons' }
		}
	}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'p00f/nvim-ts-rainbow' }
	use { 'windwp/nvim-ts-autotag' }
	use { 'windwp/nvim-autopairs' }
	use { 'pantharshit00/vim-prisma' }

	use { 'uga-rosa/translate.nvim' }

	-- Vim fugitive
	use 'tpope/vim-fugitive'
	-- use 'rbong/vim-flog' -- Cambiar por el de abajo cuando mergeen
	use 'AchmadFathoni/vim-flog'
	use 'rhysd/git-messenger.vim'

	-- Themes
	use 'mhartington/oceanic-next'
	use 'lunarvim/darkplus.nvim'
	use 'navarasu/onedark.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Copilot
	-- use 'github/copilot.vim'

	-- Tabs
	use 'kyazdani42/nvim-web-devicons'
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }
	-- Git Lines edited
	use 'lewis6991/gitsigns.nvim'
	use { 'sindrets/diffview.nvim',
		commit = "3ffe4a70c4b434ee933cb869b1706632c4407495",
		requires = 'nvim-lua/plenary.nvim' }
	-- use 'mhinz/vim-signify'

	-- PHP
	use 'lumiliet/vim-twig'

	-- MultiCursor
	use 'mg979/vim-visual-multi'

	use 'numToStr/Comment.nvim'
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Replace delete and change di', ci(
	use 'wellle/targets.vim'

	use 'antoinemadec/FixCursorHold.nvim'
	use 'mattn/emmet-vim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'sheerun/vim-polyglot' -- A collection of language packs for Vim
	use 'tpope/vim-surround' -- Surrounding ysw)
	use 'kyazdani42/nvim-tree.lua'
	use 'fedepujol/move.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'ryanoasis/vim-devicons' -- Developer Icons
	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
	})
	use "tpope/vim-repeat"
	use "RRethy/vim-illuminate"


	-- cmp plugins
	use 'hrsh7th/nvim-cmp' -- The completion plugin
	use 'hrsh7th/cmp-buffer' -- buffer completions
	use 'hrsh7th/cmp-path' -- path completions
	use 'hrsh7th/cmp-cmdline' -- cmdline completions
	use 'saadparwaiz1/cmp_luasnip' -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "rcarriga/cmp-dap"

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
	use "ray-x/lsp_signature.nvim"

	-- snippets
	use 'L3MON4D3/LuaSnip' --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- DAP
	use "mfussenegger/nvim-dap"
	use "theHamsta/nvim-dap-virtual-text"
	use "rcarriga/nvim-dap-ui"
	use "Pocco81/DAPInstall.nvim"

	use { "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" },
		commit = "e5f68db73276c4d4d255f75a77bbe6eff7a476ef" }

	-- Markdown
	use { "ellisonleao/glow.nvim" }

	-- Same that RunJS
	use { "metakirby5/codi.vim" }
end)

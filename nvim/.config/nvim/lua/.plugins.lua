vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

 
end)

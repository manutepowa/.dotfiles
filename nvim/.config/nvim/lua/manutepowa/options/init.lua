local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  -- autoindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 4, -- is one of my fav
  sidescrolloff = 4,
  -- laststatus = 3,                          -- show the last status line
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.opt.shortmess:append "c"
vim.opt.fillchars = vim.opt.fillchars + "diff:╱"

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["lua"] = true,
  ["php"] = true,
}


vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200, on_visual = true }) end, -- Or myvimfun
})

-- MultiCursor
vim.cmd([[
	let g:VM_maps = {}
	let g:VM_maps['Exit']         = '<esc>'           
	let g:VM_maps['Find Under']         = '<S-M-n>'           
	let g:VM_maps['Find Subword Under'] = '<S-M-n>'           
	let g:VM_maps["Add Cursor Down"] = '<S-M-j>'      
	let g:VM_maps["Add Cursor Up"]   = '<S-M-k>'        
]])

-- No comment on new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end
})

-- Change match colors rainbow
vim.cmd [[
  highlight! MatchParen ctermbg=0 guibg=#152f6a
]]

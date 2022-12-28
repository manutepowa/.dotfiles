local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 4,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.opt.shortmess:append "c"
-- vim.opt.fillchars = vim.opt.fillchars + "diff:╱"
-- vim.opt.fillchars = vim.opt.fillchars + 'eob: '

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
vim.g.VM_maps = {
  ['Exit']               = '<esc>',
  ['Find Under']         = '<S-M-n>',
  ['Find Subword Under'] = '<S-M-n>',
  ['Add Cursor Down']    = '<S-M-j>',
  ['Add Cursor Up']      = '<S-M-k>',
  ['Select All']         = '<M-n>',
  ['Visual All']         = '<M-n>'
}

-- codi
vim.cmd([[
  let g:codi#raw = 0
  let g:codi#width = 60
  let g:codi#rightsplit = 1
  let g:codi#rightalign = 0
  let g:codi#virtual_text = 0
  let g:codi#use_buffer_dir = 0
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
  autocmd BufNewFile,BufRead *.theme set syntax=php
  autocmd BufRead,BufNewFile *.mdx set filetype=markdown
]]

vim.filetype.add({
  extension = {
    astro = "astro",
  },
})
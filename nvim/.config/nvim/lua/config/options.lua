vim.g.mapleader = " "

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "",                              -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4,        -- set number column width to 2 {default 4}
  signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
  wrap = false,           -- display lines as one long line
  scrolloff = 4,
  sidescrolloff = 8,
  title = true,
  titleold = vim.split(os.getenv("SHELL") or "", "/")[3],
  foldenable = true,   -- enable fold for nvim-ufo
  foldlevel = 99,      -- set high foldlevel for nvim-ufo
  foldlevelstart = 99, -- start with all code unfolded
}


vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- EditorConfig
vim.g.editorconfig = true

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200, on_visual = true }) end, -- Or myvimfun
})

vim.g.VM_maps = {
  ['Exit']               = '<esc>',
  ['Find Under']         = '<S-M-n>',
  ['Find Subword Under'] = '<S-M-n>',
  ['Select All']         = '<M-n>',
  ['Visual All']         = '<M-n>'
}
vim.keymap.set('n', '<S-M-j>', '<Plug>(VM-Select-Cursor-Down)')
vim.keymap.set('n', '<S-M-k>', '<Plug>(VM-Select-Cursor-Up)')

-- vim.api.nvim_create_autocmd("ModeChanged", {
--   callback = function()
--     local buff = tonumber(vim.fn.expand "<abuf>", 10)
--     local mode = vim.fn.mode()
--     if mode == 'v' then
--       vim.keymap.set('n', '<S-M-j>', '<Plug>(VM-Add-Cursor-Down)')
--       vim.keymap.set('n', '<S-M-k>', '<Plug>(VM-Add-Cursor-Up)')
--     elseif mode == 'n' then
--
--     end
--   end,
-- })

-- vim.g.VM_maps = T

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
  autocmd BufNewFile,BufRead *.rasi set syntax=css
  autocmd BufRead,BufNewFile *.mdx set filetype=markdown
]]


vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "floggraph",
    "fugitive",
    "httpResult",
    "git",
    "NeogitStatus",
    "query",
    "AvanteInput",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

return {
  "mbbill/undotree",
  event = 'VeryLazy',
  cmd = 'UndotreeToggle',
  keys = {
    {
      '<leader>u',
      vim.cmd.UndotreeToggle,
      noremap = true,
      desc = 'Toggle [U]ndotree',
    },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 40
  end,
  config = function()
    vim.api.nvim_create_augroup('UndoTreeMaps', {})
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        local opts = { buffer = true, noremap = true, silent = true }
        vim.keymap.set('n', '<space>', '<Plug>UndotreeFocusTarget', opts)
        vim.keymap.set('n', '<tab>', '<Plug>UndotreeEnter', opts)
      end,
      group = 'UndoTreeMaps'
    })

    if vim.fn.has("persistent_undo") then
      local undodir = "~/.undodir"
      -- create the undo directory
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, "p")
      end
      vim.opt.undodir = undodir
      vim.opt.undofile = true
    end
  end
}

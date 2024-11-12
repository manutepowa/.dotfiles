return {
  "mbbill/undotree",
  event = "VeryLazy",
  cmd = "UndotreeToggle",
  keys = {
    {
      "<leader>u",
      vim.cmd.UndotreeToggle,
      noremap = true,
      desc = "Toggle [U]ndotree",
    },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 40
  end,
  config = function()
    vim.cmd([[
      if has("persistent_undo")
        let target_path = expand('~/.undodir')
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
      endif

      function g:Undotree_CustomMap()
        nmap <buffer> <tab> <plug>UndotreeEnter
      endfunc
    ]])
  end,
}

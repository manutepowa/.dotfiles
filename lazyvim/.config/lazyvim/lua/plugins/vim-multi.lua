local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd("sleep 200m")
  -- Press 'A' in normal mode after the delay.
  vim.cmd('silent! execute "normal! A"')
end

return {
  "mg979/vim-visual-multi",
  -- see https://github.com/mg979/vim-visual-multi/issues/241
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Exit"] = "<esc>",
      ["Find Under"] = "<S-M-n>",
      ["Find Subword Under"] = "<S-M-n>",
      ["Select All"] = "<M-n>",
      ["Visual All"] = "<M-n>",
    }
    vim.keymap.set("n", "<S-M-j>", "<Plug>(VM-Select-Cursor-Down)")
    vim.keymap.set("n", "<S-M-k>", "<Plug>(VM-Select-Cursor-Up)")
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
}

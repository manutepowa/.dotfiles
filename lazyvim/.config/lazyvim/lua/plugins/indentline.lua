return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "┊", tab_char = "┊" },
    whitespace = {
      remove_blankline_trail = true,
    },
    scope = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "Trouble",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "toggleterm",
        "trouble",
      },
    },
  },
}

return {
  "samodostal/image.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" },
  opts = {
    render = {
      foreground_color = true,
      background_color = true,
      show_label = true,
      use_dithering = false,
      min_padding = 5,
    },
    events = {
      update_on_nvim_resize = false,
    },
  },
}

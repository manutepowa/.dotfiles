local wezterm = require("wezterm")

local config = {
  color_scheme = "Gruvbox Dark",
  enable_tab_bar = true,
  window_decorations = "RESIZE",
  font = wezterm.font_with_fallback({
    "MonoLisaTrial",
    { family = "Symbols Nerd Font Mono", scale = 0.75 },
  }),
  native_macos_fullscreen_mode = true,
  keys = {
    {
      key = "n",
      mods = "SHIFT|CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },
  window_background_gradient = {
    orientation = "Horizontal",
    colors = {
      -- "#0f0c29",
      -- "#1e1e2d",
      -- "#302b63",
      "#00000C",
      -- "#00003F",
      "#000026",
      "#00000C",
      -- "#24243e",
      -- "#1e1e2d",
      -- "#0f0c29",
    },
    interpolation = "CatmullRom",
    blend = "Rgb",
    noise = 0,
  },
}

return config

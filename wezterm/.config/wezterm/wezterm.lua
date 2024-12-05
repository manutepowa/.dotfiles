local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local config = {}

-- =======================================================================
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- =======================================================================
config.disable_default_key_bindings = true
config.keys = {
  -- paste from the clipboard
  { key = "p",     mods = "ALT",  action = act.PasteFrom("Clipboard") },
  { key = "Enter", mods = "CTRL", action = act.ToggleFullScreen }, -- Desactivar ALT + Enter
}

config.color_scheme = "OneHalfDark"
-- =======================================================================
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.scrollback_lines = 2000
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.default_cursor_style = "SteadyBlock"
config.colors = {
  cursor_bg = "#CCC",       -- Color de fondo del cursor (rojo anaranjado)
  cursor_fg = "#000",       -- Color de primer plano del cursor (blanco)
  cursor_border = "#FF5733", -- Opcional: color del borde del cursor

  -- Esquema de colores personalizado
  background = "#1C1C1C", -- Color de fondo del terminal
}

-- =======================================================================
-- config.font = wezterm.font("Geist Mono", { weight = "Regular" })
-- config.font_size = 11.7
-- config.line_height = 1.3
-- config.cell_width = 0.9

config.font = wezterm.font("MonoLisa Nerd Font Mono", { italic = false, weight = "Medium" })
config.font_size = 11.5
config.line_height = 1.7
config.cell_width = 0.9
config.enable_wayland = false

config.initial_rows = 90
config.initial_cols = 140
wezterm.on("gui-startup", function(cmd) -- set startup Window position
  local active = wezterm.gui.screens().active

  -- Set the window coords on spawn.
  local tab, pane, window = mux.spawn_window(cmd or {
    x = active.x,
    y = active.y,
    width = active.width,
    height = active.height,
  })

  -- You probably don't need both, but you can also set the positions after spawn.
  window:gui_window():set_position(650, 0)
end)

return config

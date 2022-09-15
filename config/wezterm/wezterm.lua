local wezterm = require 'wezterm'

return {
  color_scheme = "Solarized Light (base16)",
  font = wezterm.font_with_fallback {
    "JetBrainsMonoNL Nerd Font",
  },
  font_size = 17.7,
  cursor_blink_rate = 500,
  default_cursor_style = "SteadyBlock",
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
}

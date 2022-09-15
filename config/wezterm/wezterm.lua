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
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    -- cursor_bg = "none",
    force_reverse_video_cursor = true,
    -- Overrides the text color when the current cell is occupied by the cursor
    -- cursor_fg = "bg",
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = "#52ad70",
    colors = {
        -- Make the selection text color fully transparent.
        -- When fully transparent, the current text color will be used.
        selection_fg = 'none',
        -- Set the selection background color with alpha.
        -- When selection_bg is transparent, it will be alpha blended over
        -- the current cell background color, rather than replace it
        selection_bg = 'rgba(50% 50% 50% 50%)',
    },

    default_prog = { "powershell" },
    custom_block_glyphs = false,
    tab_bar_at_bottom = false,
    tab_bar_style = {
        active_tab_left = wezterm.format({
            { Background = { Color = "#0b0022" } },
            { Foreground = { Color = "#2b2042" } },
            { Text = "▌" },
        }),
        active_tab_right = wezterm.format({
            { Background = { Color = "#0b0022" } },
            { Foreground = { Color = "#9b2042" } },
            { Text = "I" },
        }),
        inactive_tab_left = wezterm.format({
            { Background = { Color = "#0b0022" } },
            { Foreground = { Color = "#1b1032" } },
            { Text = "" },
        }),
        inactive_tab_right = wezterm.format({
            { Background = { Color = "#0b0022" } },
            { Foreground = { Color = "#1b1032" } },
            { Text = "" },
        }),
    },
    tab_max_width = 16,
    enable_kitty_graphics = true,
}

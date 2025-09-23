local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 16.0

-- Catppuccin Macchiato theme
config.color_scheme = "Catppuccin Macchiato"

-- Window configuration
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}

-- Tab bar configuration
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Other settings
config.enable_scroll_bar = false
config.window_background_opacity = 0.97

-- Scrollback
config.scrollback_lines = 10000

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- Terminal behavior
config.audible_bell = "Disabled"
config.enable_kitty_keyboard = true -- Better keyboard support

-- Performance
config.front_end = "WebGpu" -- Use GPU acceleration
config.max_fps = 120

-- Hyperlink rules (clickable URLs)
config.hyperlink_rules = wezterm.default_hyperlink_rules()

return config

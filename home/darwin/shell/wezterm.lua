-- Pull in the wezterm API
local wezterm = require("wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local config = wezterm.config_builder()

-- Font Configuration
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 12
config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9

-- Color Configuration
-- config.color_scheme = "Oxocarbon Dark (Gogh)"
-- config.color_scheme = "Kasugano (terminal.sexy)"
config.color_scheme = "Kanagawa Dragon (Gogh)"

-- Window Configuration
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 0,
}

bar.apply_to_config(config, {
	pane = {
		enabled = false,
	},
})

-- Performance Configuration
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 250

-- and finally, return the configuration to wezterm
return config

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = 'Tokyo Night'

----other
config.max_fps = 120
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

-- Finally, return the configuration to wezterm:
return config

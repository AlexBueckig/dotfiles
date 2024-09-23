local wezterm = require("wezterm")
local config = require("config")
require("events")

-- Apply color scheme based on the WEZTERM_THEME environment variable
config.color_scheme = "Catppuccin Frappe"

return config

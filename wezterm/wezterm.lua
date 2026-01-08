local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Appearance
config.enable_tab_bar = true
config.font_size = 16.0
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9 -- Fixed: Defined the value
config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.use_fancy_tab_bar = false
config.scrollback_lines = 3500

config.keys = {
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.Search({ CaseInSensitiveString = "" }),
	},
	-- Clear Scrollback
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	-- Copy & Paste
	{ key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	-- Font size
	{ key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
	-- Tabs
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

return config

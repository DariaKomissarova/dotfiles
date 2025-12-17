local wezterm = require("wezterm")

-- Initialize actual config
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Appearance
config.enable_tab_bar = true
config.font_size = 16.0
config.color_scheme = "Tokyo Night"
config.window_background_opacity = window_background_opacity
config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.use_fancy_tab_bar = false
config.scrollback_lines = 3500
-- config.disable_default_key_bindings = true
config.keys = {
	-- Search
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.Search({ CaseSensitiveString = "" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "f",
		mods = "CTRL|SHIFT|CMD",
		action = wezterm.action.Search({ CaseSensitiveString = "" }),
	},

	-- Copy & Paste
	{ key = "c", mods = "CTRL|CMD", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|CMD", action = wezterm.action.PasteFrom("Clipboard") },

	-- Font size
	{ key = "=", mods = "CTRL|CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL|CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CTRL|CMD", action = wezterm.action.ResetFontSize },

	-- The debug overlay
	{ key = "l", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	-- Exiting
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	-- { key = "q", mods = modifier, action = wezterm.action.QuitApplication } ,
}
return config

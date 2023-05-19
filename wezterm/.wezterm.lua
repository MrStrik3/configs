-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = false

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- remove prompt before closing the window
config.window_close_confirmation = "NeverPrompt"

-- This is where you actually apply your config choices

local colors, metadata = wezterm.color.load_scheme(
	"C:/Users/LefrancoisC/Desktop/Temp/Repositories/github/configs/wezterm/onedarkpronvim.toml"
)
-- local colors, metadata = wezterm.color.load_scheme("Desktop/Temp/Repositories/github/configs/wezterm/onedarkpronvim.toml")

config.bold_brightens_ansi_colors = false
-- config.bold_brightens_ansi_colors = "BrightAndBold"
config.font_dirs = { "fonts" }

config.font = wezterm.font({
	family = "CaskaydiaCove NFM",
	weight = "Regular",
	stretch = "Normal",
	style = "Normal",
	harfbuzz_features = {
		"calt=1",
		"cv02=1",
		"cv30=1",
		"onum=1",
		"ss01=1",
		"ss04=1",
		"ss05=1",
		"ss08=1",
		"ss19=1",
		"zero=1",
	},
})
config.font_size = 10

colors.tab_bar = {
	-- inactive_tab_edge = "#3A404C",
  background = "#282C34", -- tabrow color

  active_tab = {
  	bg_color = "#2E333C", --active tab bg
    fg_color = "white",
    intensity = "Bold"
  },
  inactive_tab = {
  	bg_color = "#282C34",
    fg_color = "grey",
    intensity = "Normal"
  }
}

-- For example, changing the color scheme:
config.colors = colors

config.window_frame = {
	font = wezterm.font({
		family = "CaskaydiaCove NFM",
		weight = "Regular",
		stretch = "Normal",
		style = "Normal",
		harfbuzz_features = {
			"calt=1",
			"cv02=1",
			"cv30=1",
			"onum=1",
			"ss01=1",
			"ss04=1",
			"ss05=1",
			"ss08=1",
			"ss19=1",
			"zero=1",
		}
	}),
  active_titlebar_bg = "#3A404C",
  inactive_titlebar_bg = "#282C34"
}
-- config.wsl_domains = {
-- 	{
-- 		name = "WSL:Arch",
--
-- 		distribution = "Arch",
-- 		username = "lefrancoisc",
--
-- 		default_cwd = "~/projects",
-- 		-- default_prog = { "zsh" }, -- Starting shell
-- 	},
-- }

config.wsl_domains = wezterm.default_wsl_domains()

config.default_domain = "WSL:Arch"

config.scrollback_lines = 6000
config.enable_scroll_bar = true

-- Launcher
local launch_menu = {}

table.insert(launch_menu, {
	label = "PowerShell huhu",
	args = { "C:/Program Files/PowerShell/7/pwsh.exe" },
})

config.launch_menu = launch_menu

return config

-- Pull in the wezterm API
local wezterm = require('wezterm')
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE"

config.default_prog = { 'pwsh.exe' }
-- config.default_domain = 'WSL:Arch'

-- Setting Theme & fonts
-- config.color_scheme = 'Tokyo Night Storm'
config.color_scheme = 'tokyonight_storm'

config.bold_brightens_ansi_colors = 'BrightAndBold'
config.font = wezterm.font {
  family = 'CaskaydiaCove Nerd Font Mono',
  weight = 'Regular',
  harfbuzz_features = {
    'calt=1', 'ss01=1', -- Enable the cursive  form of the italic
    'cv02=1',           -- Active special ligature for not equal
    'cv30=1',           -- Longer pipe bar
    'onum=1',
    'ss02=1',  -- Change the default ligature for <= and >=
    'ss04=1',  -- Change the dollar sign
    'ss05=1',  -- Change the at sign
    'ss08=1',  -- Change default ligature for ==, ===, != and !==
    'ss19=1',  -- Enable a slashed zero
    'zero=1'   -- Select a specific form of zero
  }
}

config.font_size = 10.0


wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window {}
  window:gui_window():maximize()
  -- window:gui_window():set_title('patate')
end)

-- wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
--   local zoomed = ''
--   if tab.active_pane.is_zoomed then
--     zoomed = '[Z] '
--   end
--
--   local index = ''
--   if #tabs > 1 then
--     index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
--   end
--
--   return zoomed .. index .. tab.active_pane.title
-- end)

wezterm.on('format-window-title', function()
  return 'Powershell'
end)

config.enable_tab_bar = false

config.scrollback_lines = 6000
config.enable_scroll_bar = true

return config

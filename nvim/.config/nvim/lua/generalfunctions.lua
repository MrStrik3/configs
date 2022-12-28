local M = {}

local colors = require("onedarkpro").get_colors()
local config = require('onedarkpro.config')

local ColorMappings = {
  name = config.theme,
  background = colors.bg,
  cursorColor = colors.white,
  foreground = colors.fg,
  selectionBackground = colors.selection,
  normal = {
    black = colors.black,
    blue = colors.blue,
    cyan = colors.cyan,
    green = colors.green,
    purple = colors.purple,
    red = colors.red,
    white = colors.white,
    yellow = colors.yellow
  },
  bright = {
    black = colors.black,
    blue = colors.blue,
    cyan = colors.cyan,
    green = colors.green,
    purple = colors.purple,
    red = colors.red,
    white = colors.white,
    yellow = colors.yellow
  },
}

function M.print_colors()
  print(vim.inspect(colors))
end

-- function M.export_to(appname)
-- str = str:gsub("^%l", string.upper)
--   for k, v in pairs(OutputFormats.windowsterminal) do
--     print(string.format('"%s" : "%s",', k, v))
--   end
-- end
--
-- colors:
--   primary:
--     background: "#282c34" -- bg
--     foreground: "#abb2bf" -- fg
--
--   bright:
--     black: "#3f3f3f" -- indentline ?
--     white: "#bfc5ce" -- selection ?
--     red: "#e06c75" -- red
--     green: "#98c379" -- green
--     yellow: "#e5c07b" -- yellow
--     blue: "#61afef"  -- blue
--     magenta: "#c678dd" -- purple
--     cyan: "#56b6c2"  --  cyan
--   normal:
--     black: "#282c34"
--     red: "#e06c75"
--     green: "#98c379"
--     yellow: "#e5c07b"
--     blue: "#61afef"
--     magenta: "#c678dd"
--     cyan: "#56b6c2"
--     white: "#abb2bf"
--
--
--   cursor:
--     text: CellBackground
--     cursor: CellForeground # syntax-cursor-color
--
--   selection:
--     text: CellForeground
--     background: "#3e4452" -- selection
return M

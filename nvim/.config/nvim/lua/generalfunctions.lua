
local M = {}

function M.print_colors()
  local colors = require("onedarkpro").get_colors()
  -- print(colors.purple)
  print(vim.inspect(colors))
end

-- local currenttheme = {
--   bg = "#282c34",
--   bg_statusline = "#22252C",
--   black = "#282c34",
--   blue = "#61afef",
--   white = "#abb2bf",
--   yellow = "#e5c07b",
--   cyan = "#2bbac5",
--   gray = "#5c6370",
--   green = "#89ca78",
--   orange = "#d19a66",
--   purple = "#d55fde",
--   red = "#ef596f",
--   color_column = "#2E323A",
--   comment = "#7f848e",
--   cursorline = "#2E323A",
--   diff_add = "#003e4a",
--   diff_delete = "#501b20",
--   diff_text = "#005869",
--   fg_gutter = "#3D4148",
--   float_bg = "#22252C",
--   highlight = "#e2be7d",
--   indentline = "#373B42",
--   selection = "#53565D",
--   virtual_text_error = "#F48B9A",
--   virtual_text_hint = "#55C8D1",
--   virtual_text_information = "#90C7F4",
--   virtual_text_warning = "#EDD3A3",
-- }

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

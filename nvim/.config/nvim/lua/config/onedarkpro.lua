local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  theme = "onedark_vivid",
  options = {
    bold = false, -- Use the colorscheme's opinionated bold styles?
    italic = false, -- Use the colorscheme's opinionated italic styles?
    underline = false, -- Use the colorscheme's opinionated underline styles?
    undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
    cursorline = false, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = true, -- Use the colorscheme's colors for Neovim's :terminal?
    window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()

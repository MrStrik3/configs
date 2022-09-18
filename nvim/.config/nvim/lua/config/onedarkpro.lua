local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  theme = "onedark_vivid",
  options = {
    bold = false, -- Use the colorscheme's opinionated bold styles?
    italic = false, -- Use the colorscheme's opinionated italic styles?
    underline = false, -- Use the colorscheme's opinionated underline styles?
    undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
    cursorline = true, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
    window_unfocused_color = true, -- When the window is out of focus, change the normal background?
  },
  ft_highlights_ignore = {
    filetypes = {
      "^aerial$",
      "^alpha$",
      "^fugitive$",
      "^fugitiveblame$",
      "^help$",
      "^NvimTree$",
      "^packer$",
      "^qf$",
      "^startify$",
      "^startuptime$",
      "^TelescopePrompt$",
      "^TelescopeResults$",
      "^terminal$",
      "^neo-tree$",
      "^toggleterm$",
      "^undotree$"
    },
    buftypes = {
      "^terminal$"
    }
  },
  ft_highlights = {
    -- Use the filetype as per the `set filetype?` command
    properties = {
      TSField = { fg = "${red}" }
    },
  }
})
onedarkpro.load()

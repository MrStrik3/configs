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
  dark_theme = "onedark_vivid", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  caching = true, -- Use caching for the theme?
  cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
  filetypes = { -- Override which filetype highlight groups are loaded
      markdown = true,
      python = true,
      ruby = true,
      yaml = true,
  },
  styles = { -- Choose from "bold,italic,underline"
      strings = "NONE", -- Style that is applied to strings.
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "NONE", -- Style that is applied to virtual text
  }
  -- ft_highlights_ignore = {
  --   filetypes = {
  --     "^aerial$",
  --     "^alpha$",
  --     "^fugitive$",
  --     "^fugitiveblame$",
  --     "^help$",
  --     "^NvimTree$",
  --     "^packer$",
  --     "^qf$",
  --     "^startify$",
  --     "^startuptime$",
  --     "^TelescopePrompt$",
  --     "^TelescopeResults$",
  --     "^terminal$",
  --     "^neo-tree$",
  --     "^toggleterm$",
  --     "^undotree$"
  --   },
  --   buftypes = {
  --     "^terminal$"
  --   }
  -- },
  -- ft_highlights = {
  --   -- Use the filetype as per the `set filetype?` command
  --   properties = {
  --     TSField = { fg = "${red}" }
  --   },
  -- }
})
onedarkpro.load()

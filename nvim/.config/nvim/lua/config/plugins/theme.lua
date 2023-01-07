local M = {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  lazy = false,
  name = "onedarkpro",
}

function M.config()
  require("onedarkpro").setup({
    theme = "onedark_vivid",
    options = {
      bold = true, -- Use the colorscheme's opinionated bold styles?
      italic = false, -- Use the colorscheme's opinionated italic styles?
      underline = true, -- Use the colorscheme's opinionated underline styles?
      undercurl = true, -- Use the colorscheme's opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
    },
    filetypes = { -- Override which filetype highlight groups are loaded
    markdown = true,
    python = true,
    yaml = true,
    lua = true,
  },
  styles = { -- Choose from "bold,italic,underline"
  types = "NONE", -- Style that is applied to types
  numbers = "NONE", -- Style that is applied to numbers
  strings = "NONE", -- Style that is applied to strings
  comments = "NONE", -- Style that is applied to comments
  keywords = "italic", -- Style that is applied to keywords
  constants = "NONE", -- Style that is applied to constants
  functions = "NONE", -- Style that is applied to functions
  operators = "NONE", -- Style that is applied to operators
  variables = "NONE", -- Style that is applied to variables
  conditionals = "italic", -- Style that is applied to conditionals
  virtual_text = "italic", -- Style that is applied to virtual text
}
})
-- onedarkpro.load()
vim.cmd("colorscheme onedark_vivid")
end

return M

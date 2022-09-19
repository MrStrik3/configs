
vim.cmd("colorscheme onedarkpro")
-- LUALINE CONFIGS
require('lualine').setup({
    options = {
      icons_enabled = true,
      -- theme = 'gruvbox-flat'
      -- theme = 'nord'
      theme = 'codedark',
      disabled_filetypes = {
        statusline = { "neo-tree"},
        winbar = {"neo-tree"},
      },
    },
    extensions = {'neo-tree'},
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      -- lualine_c = {'filename'},
      lualine_c = {},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
  })

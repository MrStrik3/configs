local M = {
  -- terminal management
  "akinsho/toggleterm.nvim",
  lazy = true,
  version             = '*',
  keys                = { "<F10>", "<F11>", "<F12>" },

  opts                = {
    direction = 'float',
    shade_terminal = false,
    float_opts = {
      border = 'double'
    }
  },
}
return M

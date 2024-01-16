local M = {
  -- terminal management
  "akinsho/toggleterm.nvim",
  version             = '*',
  keys                = { "<F10>", "<F11>", "<F12>" },
  init                = function()
    local Terminal               = require('toggleterm.terminal').Terminal

    local customTerminals        = {}
    customTerminals.lazygit_term = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
    _G.customTerminals           = customTerminals -- Store custom terminals in Global variables
  end,

  opts                = {
    direction = 'float',
    shade_terminal = false,
    float_opts = {
      border = 'double'
    }
  },
  toggle_lazygit_term = function()
    _G.customTerminals.lazygit_term:toggle()
  end
}

return M

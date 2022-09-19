require("toggleterm").setup({
    direction = 'float',
    shade_terminal = false,
    float_opts = {
      border = 'double'
    }
  })

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit_term = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })

function _terminal_lazygit_toggle()
  lazygit_term:toggle()
end

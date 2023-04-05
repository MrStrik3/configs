local M = {
  -- terminal management
  "akinsho/toggleterm.nvim",
  version = '*',
  lazy = false,
  -- keys = { "<F10>", "<F11>", "<F12>" }
}

-- function M.toggle_lazygit_term()
--   _G.customTerminals.lazygit_term:toggle()
-- end
--
-- function M.toggle_taskwarrior_term()
--   _G.customTerminals.taskwarrior_term:toggle()
-- end


function M.config()
  require("toggleterm").setup({
      direction = 'float',
      shade_terminal = false,
      float_opts = {
        border = 'double'
      }
    })
  local Terminal  = require('toggleterm.terminal').Terminal

  local customTerminals = {}
  customTerminals.lazygit_term = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
  customTerminals.taskwarrior_term = Terminal:new({ cmd = "taskwarrior-tui", direction = 'float', hidden = true })
  _G.customTerminals = customTerminals -- Store custom terminals in Global variables

  M.toggle_lazygit_term = function()
    _G.customTerminals.lazygit_term:toggle()
  end

  M.toggle_taskwarrior_term = function()
    _G.customTerminals.taskwarrior_term:toggle()
  end
end

return M

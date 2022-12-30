local M = {
  -- terminal management
  "akinsho/toggleterm.nvim",
  version = '*'
}


function M.toggle_lazygit_term()
  M.lazygit_term:toggle()
end

function M.toggle_taskwarrior_term()
  M.taskwarrior_term:toggle()
end

function M.config()
  require("toggleterm").setup({
      direction = 'float',
      shade_terminal = false,
      float_opts = {
        border = 'double'
      }
    })
  local Terminal  = require('toggleterm.terminal').Terminal
  M.lazygit_term = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true })
  M.taskwarrior_term = Terminal:new({ cmd = "taskwarrior-tui", direction = 'float', hidden = true })
end

return M

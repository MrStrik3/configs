if vim.fn.has('win32')  == 1 then
  local powershell_options = {
    shell = "pwsh",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do                                                                                                                                                                                                                                         vim.opt[option] = value
    vim.opt[option] = value
  end
else
  vim.opt.shell = 'zsh'
end

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

local taskwarrior_term = Terminal:new({ cmd = "taskwarrior-tui", direction = 'float', hidden = true })

function _terminal_taskwarrior_toggle()
  taskwarrior_term:toggle()
end

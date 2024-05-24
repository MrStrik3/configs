local M = {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    style = "storm"-- "night"
  },
  config = function()
    vim.cmd([[colorscheme tokyonight-storm]])
  end,
}

return M

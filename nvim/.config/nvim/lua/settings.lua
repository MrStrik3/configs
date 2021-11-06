vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  eol = '↲',
  nbsp = '␣',
  trail = '•',
  extends = '⟩',
  precedes = '⟨',
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    char = "⦙",
    show_current_context = true,
}

require('lualine').setup({
  options = { 
    icons_enabled = true,
    theme = 'gruvbox'
  }
})

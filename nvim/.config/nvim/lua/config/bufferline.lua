require("bufferline").setup {
  offsets = {
  {
    filetype = "NvimTree",
    text = function()
      return vim.fn.getcwd()
    end,
    highlight = "Directory",
    text_align = "left"
  }
}
}

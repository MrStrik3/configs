local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  opts = {
    -- use_treesitter = true,
    -- space_char_blankline = " ",
    -- show_end_of_line = true,
    -- char = "┊", -- "⦙",
    -- show_current_context = true,
    -- show_current_context_start = true,
    -- show_current_blankline_indent = false,
    -- filetype_exclude = { "help", "packer", "terminal", "NvimTree" },
    -- buftype_exclude = { "terminal", "nofile" },
    -- char_highlight = "LineNr",
    -- show_trailing_blankline_indent = false,

    -- indent = { highlight = { "CursorColumn", "Whitespace" }, char = "" },
    indent = {
      char = "┊",
      smart_indent_cap = true,
    },
    whitespace = {
      -- highlight = { "CursorColumn", "Whitespace" },
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  }
}

return M

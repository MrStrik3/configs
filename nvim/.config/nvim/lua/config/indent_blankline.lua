require("indent_blankline").setup {
    space_char_blankline = " ",
    show_end_of_line = false,
    -- char = "⦙",
    char = '┊',
    show_current_context = true,
    show_current_context_start = true,
    show_current_blankline_indent = false,
    filetype_exclude = { 'help', 'packer' },
    buftype_exclude = { 'terminal', 'nofile' },
    char_highlight = 'LineNr',
    show_trailing_blankline_indent = false
}

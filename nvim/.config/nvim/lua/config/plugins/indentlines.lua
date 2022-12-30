local M = {
  'lukas-reineke/indent-blankline.nvim'
}

function M.config()
    require("indent_blankline").setup {
        use_treesitter = true,
        space_char_blankline = " ",
        show_end_of_line = true,
        char = '┊', -- "⦙",
        show_current_context = true,
        show_current_context_start = true,
        show_current_blankline_indent = false,
        filetype_exclude = { 'help', 'packer', 'terminal', 'NvimTree' },
        buftype_exclude = { 'terminal', 'nofile' },
        char_highlight = 'LineNr',
        show_trailing_blankline_indent = false
    }
end

return M

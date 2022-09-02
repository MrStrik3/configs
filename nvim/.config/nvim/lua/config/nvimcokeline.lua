local get_hex = require('cokeline/utils').get_hex

local palette = {
    bg = "#282c34",
    fg = "#abb2bf",
    red = "#ef596f",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#89ca78",
    cyan = "#2bbac5",
    blue = "#61afef",
    purple = "#d55fde",
    white = "#abb2bf",
    black = "#282c34",
    gray = "#5c6370",
    highlight = "#e2be7d",
    none = "NONE",
}


require('cokeline').setup({
  default_hl = {
    fg = function(buffer) return buffer.is_focused and palette.blue or palette.gray end,
    -- fg = function(buffer) return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'bg') end,
    -- bg = get_hex('Normal', 'bg'),
    bg = 'NONE',
    style = function(buffer) return buffer.is_focused and 'bold' or nil end,
    -- style = function(buffer) return buffer.is_focused and 'bold,italic' or 'italic' end,
  },

  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '   File Explorer',
        -- text = '',
        -- bg = get_hex('Normal', 'bg'),
        bg = get_hex('WildMenu', 'bg'),
        fg = get_hex('WildMenu', 'fg'),
        -- fg = palette.yellow,
        -- bg = get_hex('NvimTreeNormal', 'bg'),
        style = 'bold,underline',
      },
    },
  },

  components = {
    {
      text = ' ',
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
    -- buffer icon
    {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
      -- fg = function(buffer) return buffer.devicon.color end,
      bg = get_hex('ColorColumn', 'bg'),
      fg = function(buffer) return buffer.is_modified and get_hex('Error', 'fg') or get_hex('Special','fg') end,
    },
    -- Is modified
    {
      -- text = function(buffer) return buffer.is_modified and ' ● ' or '  ' end,
      text = function(buffer) return buffer.is_modified and ' ' or ' ' end,
      fg = get_hex('ErrorMsg', 'fg'),
      bg = get_hex('ColorColumn', 'bg'),
    },
    -- filename
    {
      text = function(buffer) return buffer.filename .. ' ' end,
      bg = get_hex('ColorColumn', 'bg'),
      fg = function(buffer) return buffer.is_modified and get_hex('Error', 'fg') or get_hex('Special','fg') end,
      style = function(buffer) return buffer.is_focused and 'bold' or nil end,
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
  },
})


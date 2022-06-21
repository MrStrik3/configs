local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
  default_hl = {
    fg = function(buffer) return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'bg') end,
    -- bg = get_hex('Normal', 'bg'),
    bg = 'NONE',
    style = function(buffer) return buffer.is_focused and 'bold,italic' or 'italic' end,
  },

  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  File Explorer',
        -- text = '',
        fg = yellow,
        bg = get_hex('NvimTreeNormal', 'bg'),
        style = 'bold',
      },
    },
  },

  components = {
    -- Separator
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
      hl = {
        fg = get_hex('Normal', 'fg')
      },
    },
    -- buffer icon
    {
      text = function(buffer) return '    ' .. buffer.devicon.icon end,
      hl = {
        fg = function(buffer) return buffer.devicon.color end,
      },
    },
    -- buffer index
    {
      text = function(buffer) return ' ' .. buffer.index .. ': ' end,
    },
    -- Is modified
    {
      text = function(buffer) return buffer.is_modified and '● ' or '  ' end,
      hl = {
        fg = function(buffer) return buffer.is_focused and '#8FBCBB' end
      }
    },
    -- filename
    {
      text = function(buffer) return buffer.filename .. '    ' end,
      hl = {
        style = function(buffer) return buffer.is_focused and 'bold,italic' or nil end,
      }
    },
    -- Close button
    -- {
    --   text = '',
    --   delete_buffer_on_left_click = true,
    -- },
    {
      text = '  ',
    },
  },
})


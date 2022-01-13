local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
  default_hl = {
    focused = {
      fg = get_hex('Normal', 'fg'),
      bg = 'NONE',
    },
    unfocused = {
      fg = get_hex('Comment', 'fg'),
      bg = 'NONE',
    },
  },

  rendering = {
    left_sidebar = {
      filetype = 'NvimTree',
      components = {
        {
          text = '  File Explorer',
          hl = {
            fg = yellow,
            bg = get_hex('NvimTreeNormal', 'bg'),
            style = 'bold'
          }
        },
      }
    },
  },

  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
      hl = {
        fg = get_hex('Normal', 'fg')
      },
    },
    {
      text = function(buffer) return '    ' .. buffer.devicon.icon end,
      hl = {
        fg = function(buffer) return buffer.devicon.color end,
      },
    },
    {
      text = function(buffer) return ' ' .. buffer.index .. ': ' end,
    },
    {
      text = function(buffer) return buffer.filename .. '    ' end,
      hl = {
        style = function(buffer) return buffer.is_focused and 'bold,italic' or nil end,
      }
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = '  ',
    },
  },
})


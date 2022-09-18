local get_hex = require('cokeline/utils').get_hex

-- palette = {
--     bg = "#282c34",
--     fg = "#abb2bf",
--     red = "#ef596f",
--     orange = "#d19a66",
--     yellow = "#e5c07b",
--     green = "#89ca78",
--     cyan = "#2bbac5",
--     blue = "#61afef",
--     purple = "#d55fde",
--     white = "#abb2bf",
--     black = "#282c34",
--     gray = "#5c6370",
--     highlight = "#e2be7d",
--     none = "NONE",

local components = {

  separator = {
    text = ' ',
    bg = get_hex('Normal', 'bg')
  },

  left_half_circle = {
    text = '',
    bg = get_hex('Normal', 'bg'),
    fg = get_hex('ColorColumn', 'bg'),
  },

  right_half_circle = {
    text = '',
    bg = get_hex('Normal', 'bg'),
    fg = get_hex('ColorColumn', 'bg'),
  },

  buffer_icon = {
    text = function(buffer) return ' ' .. buffer.devicon.icon end,
  },

  buffer_read_only = {
    text = function(buffer) return buffer.is_readonly and ' ' or '' end,
  },

  buffer_is_modified = {
      text = function(buffer) return buffer.is_modified and ' ' or ' ' end,
      fg = get_hex('ErrorMsg', 'fg'),
  },

  buffer_name = {
      text = function(buffer) return buffer.filename .. ' ' end
  }
}

require('cokeline').setup({
  -- Only show the bufferline when there are at least this many visible buffers.
  -- default: `1`.
  show_if_buffers_are_at_least = 1,

  default_hl = {
    bg = get_hex('ColorColumn', 'bg'),
    fg = function(buffer) return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg') end
  },

  components = {
    components.separator,
    components.left_half_circle,
    components.buffer_icon,
    components.buffer_read_only,
    components.buffer_is_modified,
    components.buffer_name,
    components.right_half_circle
  },

  sidebar = {
    filetype = 'neo-tree',
    components = {
      {
        text = '   File Explorer',
        bg = get_hex('WildMenu', 'bg'),
        fg = get_hex('WildMenu', 'fg'),
        style = 'bold',
      },
    },
  }
})


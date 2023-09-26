local M = {
  "willothy/nvim-cokeline",
  event = "BufReadPre",
  dependencies = { 'kyazdani42/nvim-web-devicons' }
}

function M.config()
  -- local get_hl_attr = require('cokeline/utils').get_hl_attr
  local get_hl_attr = require('cokeline/hlgroups').get_hl_attr

  local components = {

    separator = {
      text = ' ',
      bg = get_hl_attr('Normal', 'bg')
    },
    space = {
      text = ' ',
      fg = get_hl_attr('Normal', 'bg'),
      bg = get_hl_attr('ColorColumn', 'bg'),
    },

    left_half_circle = {
      text = '',
      bg = get_hl_attr('Normal', 'bg'),
      fg = get_hl_attr('ColorColumn', 'bg'),
    },

    right_half_circle = {
      text = '',
      bg = get_hl_attr('Normal', 'bg'),
      fg = get_hl_attr('ColorColumn', 'bg'),
    },

    buffer_icon = {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
    },

    buffer_read_only = {
      text = function(buffer) return buffer.is_readonly and ' ' or '' end,
    },

    buffer_is_modified = {
      text = function(buffer) return buffer.is_modified and '󰆓 ' or ' ' end,
      fg = get_hl_attr('ErrorMsg', 'fg'),
    },

    buffer_name = {
      text = function(buffer) return buffer.filename end,
      fg = function(buffer) return buffer.is_focused and get_hl_attr('Directory', 'fg') or nil end,
      style = function(buffer) return buffer.is_focused and 'underline' or nil end
    }
  }

  local colors = require('tokyonight.colors').setup()

  vim.api.nvim_set_hl(0, 'CokelineTabFill', { fg = colors.bg, bg = colors.bg})

  require('cokeline').setup({
      -- Only show the bufferline when there are at least this many visible buffers.
      -- default: `1`.
      show_if_buffers_are_at_least = 1,

      default_hl = {
        bg = get_hl_attr('ColorColumn', 'bg'),
        fg = function(buffer) return buffer.is_focused and get_hl_attr('Normal', 'fg') or get_hl_attr('Comment', 'fg') end
      },

      components = {
        components.separator,
        components.left_half_circle,
        components.buffer_icon,
        components.buffer_read_only,
        components.buffer_is_modified,
        components.buffer_name,
        components.space,
        components.right_half_circle
      },

      fill_hl = 'CokelineTabFill',

      sidebar = {
        filetype = 'neo-tree',
        components = {
          {
            text = '   File Explorer',
            bg = get_hl_attr('WildMenu', 'bg'),
            fg = get_hl_attr('WildMenu', 'fg'),
            style = 'bold',
          },
        },
      }
    })
end

return M

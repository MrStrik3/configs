-- NVIM-TREE CONFIGS
require('nvim-tree').setup({
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = { "dashboard" },
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  sort_by = "case_sensitive",
  diagnostics         = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  git = {
    enable = false,
    ignore = true,
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },

  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true
      },

      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder= {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})

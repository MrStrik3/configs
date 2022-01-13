-- NVIM-TREE CONFIGS
-- vim.g.nvim_tree_show_icons = {
--    git: 1,
--    folders: 1,
--    files: 1,
--    folder_arrows: 1,
-- }
-- vim.g.nvim_tree_icons = {
--   default: '',
--   symlink: '',
--   git: {
--     unstaged: "✗",
--     staged: "✓",
--     unmerged: "",
--     renamed: "➜",
--     untracked: "★",
--     deleted: "",
--     ignored: "◌"
--   },
--   folder: {
--      arrow_open: "",
--      arrow_closed: "",
--      default: "",
--      open: "",
--      empty: "",
--      empty_open: "",
--      symlink: "",
--      symlink_open: "",
--   }
-- }

require('nvim-tree').setup({ 
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
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
    enable = true,
    ignore = true,
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {}
    }
  }
})

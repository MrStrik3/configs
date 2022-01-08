-- NVIM-TREE CONFIGS
--[[ vim.g.nvim_tree_show_icons = {
   git: 1,
   folders: 1,
   files: 1,
   folder_arrows: 1,
}
vim.g.nvim_tree_icons = {
  default: '',
  symlink: '',
  git: {
    unstaged: "✗",
    staged: "✓",
    unmerged: "",
    renamed: "➜",
    untracked: "★",
    deleted: "",
    ignored: "◌"
  },
  folder: {
     arrow_open: "",
     arrow_closed: "",
     default: "",
     open: "",
     empty: "",
     empty_open: "",
     symlink: "",
     symlink_open: "",
  }
} ]]
require'nvim-tree'.setup { }

-- BARBAR CONFIGS
vim.g.bufferline = {
  closable = false,
  icons = true,
  icon_custom_colors = true

}

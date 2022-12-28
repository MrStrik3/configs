local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk = require('which-key')
--
map('n', '<Space>', '<Nop>', { noremap = true }) -- Required on windows
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- " ######## Custom mappings
-- " don't complain on some obvious fat-fingers
map('n', ':W', ':w', { })
map('n', ':W!', ':w!', { })
map('n', ':Q!', ':q!', { })
map('n', ':Q', ':q', { })
map('n', ':Qa', ':qa', {})
map('n', ':Wq!', ':wq!', {})
map('n', ':WQ!', ':wq!', {})
map('n', ':W', ':w', { })

-- Add insert new line above or after
map('n', '<S-Enter>', 'O<Esc>j', { })
map('n', '<C-Enter>', 'o<Esc>k', { })
map('n', '<Enter>', 'i<Enter><Esc>', { })

-- Break the Habit of Reaching for the Arrow Keys
map('n', '<Up>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)

-- Window movement
map('n', '<c-h>', '<c-w>h', {})
map('n', '<c-j>', '<c-w>j', {})
map('n', '<c-k>', '<c-w>k', {})
map('n', '<c-l>', '<c-w>l', {})

-- Buffer motions
map('n', 'H', '^', {}) -- Move to beginning of line
map('n', 'L', '$', {}) -- Move end of line

-- Substitute mapping
-- SHOULD BE REMAPPED
-- vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
-- vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
-- vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
-- vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
--Exchange
-- vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
-- vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
-- vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
-- vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })

-- Terminal management
map('n', '<F12>', ':ToggleTerm<CR>', opts)
map('t', '<F12>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

map('n', '<F10>', '<cmd>lua _terminal_taskwarrior_toggle()<CR>', opts)
map('t', '<F10>', '<cmd>lua _terminal_taskwarrior_toggle()<CR>', opts)
map('n', '<F11>', '<cmd>lua _terminal_lazygit_toggle()<CR>', opts)
map('t', '<F11>', '<cmd>lua _terminal_lazygit_toggle()<CR>', opts)

-- Cokeline
-- -- Move to previous/next
-- map('n', '<A-,>', '<plug>(cokeline-focus-prev)', { silent = true })
-- map('n', '<A-.>', '<plug>(cokeline-focus-next)', { silent = true })
map('n', '<S-Tab>', '<plug>(cokeline-focus-prev)', { silent = true })
map('n', '<Tab>', '<plug>(cokeline-focus-next)', { silent = true })
-- -- Re-order to previous/next
map('n', '<A-<>', '<plug>(cokeline-switch-prev)', { silent = true })
map('n', '<A->>', '<plug>(cokeline-switch-prev)', { silent = true })

-- Which-key configs
wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "double", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

wk.register({
  [""] = {
    s = { ":HopChar2AC<cr>", "Search for 2 characters after the cursor"},
    S = { ":HopChar2BC<cr>" , "Search for 2 characters before the cursor"},
  },
  ["<leader><leader>"] = {
    name = "Fast motions",
    w = { ":HopWord<cr>", "Move to word (Hop.nvim)" },
    l = { ":HopLineStart<cr>", "Move to line (Hop.nvim)" },
    p = { ":HopPattern<cr>", "Move to a search pattern (Hop.nvim)" },
  },
  ["<leader>c"] = {
    name = "Code",
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format code (Prettier)"} ,
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle document diagnostics list" },
    t = { "<cmd>TodoTrouble<cr>", "Show TODO list" },
  },
  -- Files
  ["<leader>f"] = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    e = { "<cmd>Neotree toggle<cr>", "File Explorer" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    c = { "<cmd>Telescope colorscheme<cr>", "Find colorscheme" },
    n = { "<cmd>enew<cr>", "New File" }
  },
  ["<leader>h"] = {
    s = { "<cmd>help nvim-surround.usage<cr>", "Help Nvim-Surround.usage" },
    c = { "<cmd>help visual-multi", "Help multi cursors"}
  },
  ["<leader>o"] = {
    name = "Options",
    n = { "<cmd>set number! <cr><cmd>set relativenumber!<cr>", "Toggle numbers" },
    i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle indent lines"}
  },
  ["<leader>p"] = {
    name = "Plugins",
    u = { "<cmd>PackerUpdate<cr>", "Update all plugins (Packer)" },
    c = { "<cmd>PackerCompile<cr>", "Compile all plugins (Packer)"},
  },
  ["<leader>m"] = {
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon, Add file" },
    l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon, List marked files" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon, Navigate to previous marked file" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon, Navigate to next marked file" },
  }
})

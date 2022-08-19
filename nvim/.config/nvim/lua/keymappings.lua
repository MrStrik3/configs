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

-- Terminal management
vim.api.nvim_set_keymap('n', '<F7>', ':FloatermNew<CR>', opts)
vim.api.nvim_set_keymap('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', opts)

vim.api.nvim_set_keymap('n', '<F8>', ':FloatermPrev<CR>', opts)
vim.api.nvim_set_keymap('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>', opts)

vim.api.nvim_set_keymap('n', '<F9>', ':FloatermNext<CR>', opts)
vim.api.nvim_set_keymap('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>', opts)

vim.api.nvim_set_keymap('n', '<F12>', ':FloatermToggle<CR>', opts)
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', opts)

-- -- Bufferline
-- -- Move to previous/next
-- map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
-- map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
-- -- Re-order to previous/next
-- map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
-- map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- -- Goto buffer in position...
-- map('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', opts)
-- map('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', opts)
-- map('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', opts)
-- map('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', opts)
-- map('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', opts)
-- map('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', opts)
-- map('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', opts)
-- map('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', opts)
-- map('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', opts)
-- -- map('n', '<A-0>', ':BufferLast<CR>', opts)
-- -- Close buffer
-- map('n', '<A-c>', ':BufferLineClose<CR>', opts)
-- -- Close commands
-- --                 :BufferCloseAllButCurrent<CR>
-- --                 :BufferCloseBuffersLeft<CR>
-- --                 :BufferCloseBuffersRight<CR>
-- -- Magic buffer-picking mode
-- map('n', '<C-p>', ':BufferLinePick<CR>', opts)

-- Cokeline
-- -- Move to previous/next
map('n', '<A-,>', '<plug>(cokeline-focus-prev)', { silent = true })
map('n', '<A-.>', '<plug>(cokeline-focus-next)', { silent = true })
-- -- Re-order to previous/next
map('n', '<A-<>', '<plug>(cokeline-switch-prev)', { silent = true })
map('n', '<A->>', '<plug>(cokeline-switch-prev)', { silent = true })



-- -- Goto buffer in position...
-- for i = 1,9 do
--   map('n', ('<A-%s>').format(i), ('<plug>(cokeline-focus-%s)'):format(i), { silent = true })
-- end

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
    border = "none", -- none, single, double, shadow
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
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

wk.register({
  ["<leader>c"] = {
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format code (Prettier)"}
  },
  -- Files
  ["<leader>f"] = {
    name = "+file",
    c = { "<cmd>Telescope colorscheme<cr>", "Find colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    e = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" }
  },

  ["<leader>g"] = {
    a = { "<cmd>Git add .<cr>", "Add changes to next commit"},
  },
  ["<leader>o"] = {
    n = { "<cmd>set number! <cr><cmd>set relativenumber!<cr>", "Toggle numbers"}
  },
  ["<leader>p"] = {
    m = { "<cmd>PackerLoad vim-visual-multi<cr>", "Activate multi-cursor" },
    c = { "<cmd>PackerLoad nvim-colorizer.lua<cr>", "Activate Nvim colorizer"},
    u = { "<cmd>PackerUpdate<cr>", "Update the installed plugins"}

  }
})

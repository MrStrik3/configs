local map = vim.api.nvim_set_keymap

map('n', '<Space>', '<Nop>', { noremap = true }) -- Required on windows
vim.g.mapleader = ' '

-- " ######## Custom mappings
-- " don't complain on some obvious fat-fingers
map('n', ':W', ':w', { })
map('n', ':W!', ':w!', { })
map('n', ':Q!', ':q', { })
map('n', ':Qa', ':qa', {})
map('n', ':Wq!', ':wq!', {})
map('n', ':WQ!', ':wq!', {})
map('n', ':W', ':w', { })

-- " Add insert new line above or after
map('n', '<S-Enter>', 'O<Esc>j', { })
map('n', '<C-Enter>', 'o<Esc>k', { })
map('n', '<Enter>', 'i<Enter><Esc>', { })

-- " Break the Habit of Reaching for the Arrow Keys
map('n', '<Up>', '<Nop>', { noremap = true })
map('n', '<Right>', '<Nop>', { noremap = true })
map('n', '<Left>', '<Nop>', { noremap = true })
map('n', '<Down>', '<Nop>', { noremap = true })


-- Numbers
map('n', '<Leader>tn', ':set !number', { noremap = true })
map('n', '<Leader>trn', ':set !relativenumber', { noremap = true })


-- Telescope mappings
map('n', '<Leader>tff', ':Telescope find_files<cr>', { noremap = true, silent = true })

-- " ######## Custom mappings
-- " don't complain on some obvious fat-fingers
vim.api.nvim_set_keymap('n', ':W', ':w', { })
vim.api.nvim_set_keymap('n', ':W!', ':w!', { })
vim.api.nvim_set_keymap('n', ':Q!', ':q', { })
vim.api.nvim_set_keymap('n', ':Qa', ':qa', {})
vim.api.nvim_set_keymap('n', ':Wq!', ':wq!', {})
vim.api.nvim_set_keymap('n', ':WQ!', ':wq!', {})
vim.api.nvim_set_keymap('n', ':W', ':w', { })

-- " Add insert new line above or after
vim.api.nvim_set_keymap('n', '<S-Enter>', 'O<Esc>j', { })
vim.api.nvim_set_keymap('n', '<C-Enter>', 'o<Esc>k', { })
vim.api.nvim_set_keymap('n', '<Enter>', 'i<Enter><Esc>', { })

-- " Break the Habit of Reaching for the Arrow Keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })


-- Numbers
vim.api.nvim_set_keymap('n', '<Leader>tn', ':set !number', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>trn', ':set !relativenumber', { noremap = true })


-- Telescope mappings
vim.api.nvim_set_keymap('n', '<Leader>tff', ':Telescope find_files', { noremap = true, silent = true })

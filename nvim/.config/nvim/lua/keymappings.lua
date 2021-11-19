local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>', '<Nop>', { noremap = true }) -- Required on windows
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

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
map('n', '<Up>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)


-- Numbers
map('n', '<Leader>tn', ':set !number', opts)
map('n', '<Leader>trn', ':set !relativenumber', opts)


-- Telescope mappings
map('n', '<Leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<Leader>fe', ':NvimTreeOpen<cr>', opts)


-- Terraform 
map('n', ':tfp', ':Terraform plan<cr>', {})
map('n', ':tff', ':Terraform fmt<cr>', {})
map('n', ':tfv', ':Terraform validate<cr>', {})

-- Barbar tab manager
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Leader>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Leader>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Leader>bl', ':BufferOrderByLanguage<CR>', opts)

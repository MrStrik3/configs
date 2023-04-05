vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true }) -- Required on windows
vim.g.mapleader = ' '
vim.g.maplocalleader = ','


-- Skip some remote provider loading
vim.g.loaded_python_provider = 1 -- Disable default filetypes loading (slow loading)
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.node_host_prog = '/usr/bin/neovim-node-host'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Bootstrap lazy.nvim package manager
require('options')
require('autocmds')
require('config/lazy')
require('impatient')
-- require('impatient').enable_profile()

-- filetype plugin on
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- ######## End Custom mappings


-- Add logging level to LSP
-- vim.lsp.set_log_level("debug")

require('autocmds')
require('options')
require('plugins')
require('keymappings')
require('settings')
require('nvim_tree')

-- filetype plugin on
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- vim.cmd[[colorscheme gruvbox-flat]]
vim.cmd('colorscheme gruvbox-flat')

-- " -- Markdown settings
vim.g.vim_markdown_preview_toggle = 1
vim.g.vim_markdown_preview_github = 1
vim.g.vim_markdown_preview_use_xdg_open = 1


-- ######## End Custom mappings




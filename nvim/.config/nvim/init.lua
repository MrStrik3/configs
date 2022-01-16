require('autocmds')
require('options')
require('plugins')
require('keymappings')

-- filetype plugin on
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- vim.cmd[[colorscheme gruvbox-flat]]
vim.cmd('colorscheme gruvbox-flat')

-- " -- Markdown settings
vim.g.vim_markdown_preview_toggle = 1
vim.g.vim_markdown_preview_github = 1
vim.g.vim_markdown_preview_use_xdg_open = 1

-- vim-rainbow
vim.g.rainbow_active = 1

-- ######## End Custom mappings

-- Skip some remote provider loading
vim.g.loaded_python_provider = 0
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.node_host_prog = '/usr/bin/neovim-node-host'


-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  vim.g['loaded_' .. disabled_built_ins[i]] = 1
end

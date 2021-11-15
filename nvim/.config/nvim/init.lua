require('plugins')
require('settings')

require('keymappings')

-- filetype plugin on
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- " -- Markdown settings
vim.g.vim_markdown_preview_toggle = 1
vim.g.vim_markdown_preview_github = 1
vim.g.vim_markdown_preview_use_xdg_open = 1


vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.nowrap = true      -- dont wrap lines (see <leader>w)

-- Search related
vim.opt.hlsearch = true    -- highlight searches by default
vim.opt.ignorecase = true
vim.opt.smartcase = true 

vim.opt.inccommand = 'nosplit' -- Incremental live completion
vim.opt.laststatus = 2      -- always display status line even if only one window is visible.
vim.opt.updatetime = 1000   -- reduce updatetime so current tag in taglist is highlighted faster

vim.opt.wildignore= '*.o,*.obj,*/tmp/*,u.so,*~'  -- stuff to ignore when tab completing
vim.opt.backspace= 'indent,eol,start' -- allow backspacing over everything in insert mode
vim.opt.history = 1000               -- store lots of :cmdline history

-- let g:is_posix = 1  " vim's default is archaic bourne shell, bring it up to the 90s.

-- set visualbell      " don't beep constantly, it's annoying.
-- set t_vb=           " and don't flash the screen either (terminal anyway...
-- set guioptions-=T   " hide gvim's toolbar by default

vim.opt.expandtab = true     -- use spaces instead of tabs
vim.opt.smarttab = true       -- use shiftwidth when hitting tab instead of sts (?) 
vim.opt.autoindent = true    -- try to put the right amount of space at the beginning of a new line
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- set backup " Backup a file before overriding it



-- " ######## End Custom mappings
-- " some goddamn plugin is messing this up?
-- set textwidth=0

-- Change the idenline haracter
-- vim.g.indentLine_char = '⦙'

vim.cmd('autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab')

local autocmds = {
	highlight_yank = {
		{"TextYankPost",     "*",   "silent! lua vim.highlight.on_yank {higroup='Substitute', on_visual=false, timeout=200}"};
	};
}
require'utils'.nvim_create_augroups(autocmds);


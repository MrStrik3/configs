vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true }) -- Required on windows
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Skip some remote provider loading
vim.g.loaded_python_provider = 1 -- Disable default filetypes loading (slow loading)
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.node_host_prog = "/usr/bin/neovim-node-host"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- access Windows clipboard from WSL guest
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\\r", ""))',
		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\\r", ""))',
	},
	cache_enabled = 0,
}

-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("autocmds")
require("config/lazy")

-- Neovim < 9.0
-- require('impatient')
-- require('impatient').enable_profile()

-- Neovim > 9.0
-- Module caching has been integrated in Neovim
vim.loader.enable()

-- filetype plugin on
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- ######## End Custom mappings

-- Add logging level to LSP
-- vim.lsp.set_log_level("debug")

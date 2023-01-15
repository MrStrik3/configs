-- _G.open_telescope = function()
--     local first_arg = vim.v.argv[2]
--     if first_arg and vim.fn.isdirectory(first_arg) == 1 then
--         vim.g.loaded_netrw = true
--         require("telescope.builtin").find_files({search_dirs = {first_arg}})
--     end
-- end

vim.cmd([[

  augroup _general_settings
    autocmd!
    autocmd TextYankPost * silent!lua vim.highlight.on_yank({higroup='Substitute', on_visual=false, timeout=200})
    autocmd BufWinEnter * :set formatoptions-=cro
  augroup end

  augroup _yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _onopennvim_isdirectory_openfilexplorer
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'cd '.argv()[0] | execute 'Telescope find_files' | endif
  augroup end

  augroup _remove_trailing_whitespaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end

]])
-- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'Neotree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

-- augroup TelescopeOnEnter
--   autocmd!
--   autocmd VimEnter * lua open_telescope()
-- augroup END

-- local api = vim.api
-- local nvim_onOpen_isDir_TelescopePromptGrp =
-- 	api.nvim_create_augroup("_onopennvim_isdirectory_openfilexplorer", { clear = true })
-- api.nvim_create_autocmd("StdinReadPre", {
-- 	command = "let s:std_in=1",
-- 	group = nvim_onOpen_isDir_TelescopePromptGrp,
-- })
-- api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[0]) and not vim.fn.exists("s:std_in") then
-- 			-- vim.cmd("execute cd " .. vim.fn.argv()[0])
-- 			require("telescope.builtin").find_files()
-- 		end
-- 	end,
-- })
-- augroup end

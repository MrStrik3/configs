
-- local autocmds = {
-- 	highlight_yank = {
-- 		{"TextYankPost",     "*",   "silent! lua vim.highlight.on_yank {higroup='Substitute', on_visual=false, timeout=200}"};
-- 	};

vim.cmd [[

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

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end

  augroup _remove_trailing_whitespaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end
]]

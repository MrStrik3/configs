-- _G.open_telescope = function()
--     local first_arg = vim.v.argv[2]
--     if first_arg and vim.fn.isdirectory(first_arg) == 1 then
--         vim.g.loaded_netrw = true
--         require("telescope.builtin").find_files({search_dirs = {first_arg}})
--     end
-- end

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


  augroup _remove_trailing_whitespaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end

]]
  -- augroup TelescopeOnEnter
  --   autocmd!
  --   autocmd VimEnter * lua open_telescope()
  -- augroup END

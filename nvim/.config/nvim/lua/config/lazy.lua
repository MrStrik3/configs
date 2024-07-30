-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- -- bootstrap from github
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--       "git",
--       "clone",
--       "--filter=blob:none",
--       "--single-branch",
--       "git@github.com:folke/lazy.nvim.git",
--       lazypath,
--     })
-- end
-- vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
    defaults = {
      lazy = true,
    },
    checker = {
      enabled = true,
      notify = false,
      frequency = 900,
    },
    install = {
      colorscheme = { "tokyonight-storm" },
    },
    concurrency = 10, ---@type number limit the maximum amount of concurrent tasks
    git = {
      log = { "-10" }, -- show the last 10 commits
      -- log = { "--since=3 days ago" }, -- show commits from the last 3 days
      timeout = 120, -- kill processes that take more than 2 minutes
      url_format = "https://github.com/%s.git",
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          -- "netrw",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
          "man",
          "shada_plugin",
          "tar",
          "zip",
          "tohtml",
          "tutor",
        },
      },
    },
  })

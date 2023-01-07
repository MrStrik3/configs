-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "git@github.com:folke/lazy.nvim.git",
      lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
    checker = {
      enabled = true,
      notify = false,
      frequency = 900,
    },
    install = {
      colorscheme = { "onedark_vivid" },
    },
    ui = {
      icons = {
        plugin = "",
      },
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
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

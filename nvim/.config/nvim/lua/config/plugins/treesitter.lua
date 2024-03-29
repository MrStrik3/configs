-- Treesitter stuff
local M = {
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-angular',
    { 'nvim-treesitter/playground', cmd = { "TSPlayground", "TSUpdate" } },
  },
  event = "BufReadPre",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "bash", "c", "cmake", "cpp", "css", "dockerfile", "dot", "elm", "gitignore", "go", "help", "html", "http", "java", "javascript", "json", "json5", "jsonc", "jsonnet", "lua", "make", "markdown", "markdown_inline", "perl", "python", "regex", "ruby", "rust", "scheme", "scss", "sql", "tsx", "typescript", "vim", "yaml" }, -- ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
      enable = true, -- `false` will disable the whole extension

      -- list of language that will be disabled
      disable = {  },

      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true
    },
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable = true
    }
  }
end

function M.build()
  return ':TSUpdate'
end

return M

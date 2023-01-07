-- Treesitter stuff
local M = {
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'p00f/nvim-ts-rainbow',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-angular',
    'nvim-treesitter/playground',
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "bash", "c", "cmake", "cpp", "css", "dockerfile", "dot", "elm", "gitignore", "go", "help", "html", "http", "java", "javascript", "json", "json5", "jsonc", "jsonnet", "lua", "make", "markdown", "markdown_inline", "perl", "python", "regex", "ruby", "rust", "scheme", "scss", "sql", "tsx", "typescript", "vim", "yaml" },
    -- ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
      enable = true, -- `false` will disable the whole extension

      -- list of language that will be disabled
      disable = {  },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = 10000 -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
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

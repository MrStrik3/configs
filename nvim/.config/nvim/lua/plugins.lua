local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim"
end


return require('packer').startup({function(use)
  -- Package manager
  use 'wbthomason/packer.nvim' -- Package manager

  --Nvim optimizations
  use 'nathom/filetype.nvim' -- Define the neovim's filetypes list (load quicker)
  use 'lewis6991/impatient.nvim' -- Speed up start time

  -- THEMES
  use 'eddyekofo94/gruvbox-flat.nvim'  -- gruvbox theme
  use { 'arcticicestudio/nord-vim', branch = 'main' } -- Nord theme
  use 'olimorris/onedarkpro.nvim'

  -- TPOPE's plugins
  -- use 'tpope/vim-surround' -- surround management ( parenthesis,  quote, etc.)
  use { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end } -- surround management ( parenthesis,  quote, etc.) IN LUA -- Up for testing
  use 'tpope/vim-repeat'   -- Add special repeat commands
  -- use 'tpope/vim-fugitive' -- Git
  use { 'dinhhuy258/git.nvim', config = function () require("git").setup({}) end } -- rewrite of vim-fugitive in lua

  use 'mg979/vim-visual-multi'  -- Multi cursor shit

  -- FIX Fart hard!!!

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use 'editorconfig/editorconfig-vim'

  -- Status line extension
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('config.lualine')]],
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- TREESITTER EXTENSIONS
  use {
    'nvim-treesitter/nvim-treesitter',
    config    = [[ require('config.tree_sitter') ]],
    run       =  ':TSUpdate',
    opt = false
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    opt = false
  }
  use 'windwp/nvim-ts-autotag'

  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({})
    end
  }

  -- show Indentation lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[ require('config.indent_blankline') ]]
  }

  -- Auto-pair, highlights the separators ((),{}, "", ''))
 use {
   'windwp/nvim-autopairs',
   config = function()
     require('nvim-autopairs').setup({
       disable_filetypes = { "TelescopePrompt", "NvimTree" },
     })
   end
 }

  -- use 'frazrepo/vim-rainbow'

  -- Comments management
  use {
   'numToStr/Comment.nvim',
   config = function() require('Comment').setup() end
  }

  -- File picker
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Buffer management
  -- use {
  --   'akinsho/nvim-bufferline.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = [[require('config.bufferline')]]
  --   -- event = 'User ActuallyEditing',
  -- }

  -- TODO cnfigure this thing
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require('config.todo_comments')]]
  }

  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = [[require('config.nvimcokeline')]]
  }

  use 'folke/which-key.nvim'  -- graphical interface showing key mappings

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    -- config = function()
    --   require('neogit').setup({})
    -- end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    -- tag = 'nightly',
    config = [[require('config.nvim_tree')]]
  }

  -- LSP - LANGUAGES
  use {
    { 'neovim/nvim-lspconfig', config = [[require('config.lspconfig')]] },
    'hrsh7th/nvim-cmp',  -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer', -- autocompletion for buffer
    'jose-elias-alvarez/null-ls.nvim',
    { 'MunifTanjim/prettier.nvim', config = [[require('config.prettier')]] },
    { 'williamboman/mason.nvim', config = [[require('config.mason')]] }, -- Lint, Lsp, Dsp install manager
    { 'williamboman/mason-lspconfig.nvim', config = [[require('config.mason_lspconfig')]] }, -- Link mason with lspconfig
    'onsails/lspkind-nvim',
    'rcarriga/nvim-notify',
    {'ray-x/lsp_signature.nvim', config = function() require("lsp_signature").setup({}) end },
  }

    use 'folke/lsp-colors.nvim'
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      -- opt = true,
      config = function()
        require("trouble").setup { }
      end
    }

    -- use {
    -- 'weilbith/nvim-code-action-menu',
    -- cmd = 'CodeActionMenu',
    -- }

    -- Optional extensions
    use { 'tweekmonster/startuptime.vim' }
    -- use { 'davidgranstrom/nvim-markdown-preview'}
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "light"
    end, ft = { "markdown" }, })

    use { 'mrk21/yaml-vim', opt = true }  -- YAML files Shit - https://github.com/mrk21/yaml-vim

    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end
    }

    use { 'voldikss/vim-floaterm' }


    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end

  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
    profile = {
      enable = true,
      threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }})


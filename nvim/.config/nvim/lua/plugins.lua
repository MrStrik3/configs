
-- Plugins to look int
-- https://github.com/danymat/neogen (Annotation documentaiton)
-- https://github.com/Pocco81/true-zen.nvim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Package manager
  use 'wbthomason/packer.nvim' -- Package manager

  --Nvim optimizations
  use 'nathom/filetype.nvim' -- Define the neovim's filetypes list (load quicker)
  use 'lewis6991/impatient.nvim' -- Speed up start time

  use 'sheerun/vim-polyglot'

  --Nvim optimizations
  use {'edluffy/specs.nvim', config = function() require("specs").setup({}) end }

  -- THEMES
  -- use 'eddyekofo94/gruvbox-flat.nvim'  -- gruvbox theme
  -- use { 'arcticicestudio/nord-vim', branch = 'main' } -- Nord theme
  -- use 'rmehri01/onenord.nvim'
  use 'olimorris/onedarkpro.nvim'
  -- use 'luisiacc/gruvbox-baby'
  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   run = ":CatppuccinCompile"
  -- }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function() require("nvim-navic").setup({}) end
  }

  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup()
    end,
  }

  -- TPOPE's plugins
  use { 'kylechui/nvim-surround', tag = "*", config = function() require("nvim-surround").setup({}) end } -- surround management ( parenthesis,  quote, etc.)
  -- use 'tpope/vim-repeat'   -- Add special repeat commands
  -- use 'tpope/vim-fugitive' -- Git
  -- use { 'dinhhuy258/git.nvim', config = function () require("git").setup({}) end } -- rewrite of vim-fugitive in lua

  use 'mg979/vim-visual-multi'  -- Multi cursor shit

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- use 'editorconfig/editorconfig-vim'

  -- Status line extension
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('config.lualine')]],
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- NEO-Tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = [[require("config.neo_tree")]],
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  }


  -- TREESITTER EXTENSIONS
  use {
    'nvim-treesitter/nvim-treesitter',
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-angular',
      opt = false
    },
    config    = [[ require('config.tree_sitter') ]],
    run       =  ':TSUpdate',
    opt = false
  }

  -- smoothen the scolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({ easing_function = "circular" }) -- quadratic, cubic, quartic, quintic, circular, sine
    end
  }

  -- Substitution plugin
  use {
    "gbprod/substitute.nvim",
    config = function () require("substitute").setup({}) end
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
       disable_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree" },
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
    config = [[require('config.telescope')]],
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require('config.todo_comments')]]
  }

  -- Buffer management
  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = [[require('config.nvimcokeline')]]
  }

  use 'folke/which-key.nvim'  -- graphical interface showing key mappings

  -- use {
  --   'TimUntersberger/neogit',
  --   requires = 'nvim-lua/plenary.nvim',
  --   -- config = function()
  --   --   require('neogit').setup({})
  --   -- end
  -- }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- LSP - LANGUAGES
  use {
    { 'neovim/nvim-lspconfig', config = [[require('config.lspconfig')]] },
    -- { "glepnir/lspsaga.nvim", branch = "main" },
    'hrsh7th/nvim-cmp',  -- Autocompletion plugin
    'hrsh7th/cmp-cmdline',
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
    -- 'ray-x/lsp_signature.nvim',
    {
      'ray-x/lsp_signature.nvim',
      config = function() require("lsp_signature").setup({

        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        }
      }) end
    },
    -- {'ray-x/lsp_signature.nvim', config = function() require("lsp_signature").setup({}) end },
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
      'NvChad/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end
    }

    -- terminal management
    use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      config = [[require('config.toggleterm')]]
    }

    -- use {
    --   'vimwiki/vimwiki'
    -- }

-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
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
      threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    autoremove = false,
    max_jobs = 10,

  }})


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim"
end

return require('packer').startup({function()


  use 'wbthomason/packer.nvim' -- Package manager

  use 'nathom/filetype.nvim' -- Define the neovim's filetypes list (load quicker)

  use { 'tweekmonster/startuptime.vim', opt = true }
  use 'lewis6991/impatient.nvim' -- Speed up start time

  -- gruvbox theme
  use 'eddyekofo94/gruvbox-flat.nvim'

  use { 'arcticicestudio/nord-vim', branch = 'main' }
  use { 'davidgranstrom/nvim-markdown-preview', opt = true }

  -- TPOPE's plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- Git
  use 'tpope/vim-fugitive'

  -- YAML files Shit - https://github.com/mrk21/yaml-vim
  use { 'mrk21/yaml-vim', opt = true }

  -- Multi cursor shit
  use {
    'mg979/vim-visual-multi',
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('config.lualine')]],
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config    = [[ require('config.tree_sitter') ]],
    cmd       =  ':TSUpdate'
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

  use 'psliwka/vim-smoothie'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[ require('config.indent_blankline') ]]
  }

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

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require('config.todo-comments')]]
  }

  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = [[require('config.nvimcokeline')]]
  }

  use { 'voldikss/vim-floaterm', opt = true }

  use {'folke/which-key.nvim'}

--  use {
--    'TimUntersberger/neogit',
--    requires = 'nvim-lua/plenary.nvim',
--    config = function()
--      require('neogit').setup({})
--    end
--  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim_tree')]]
  }

  use {
    'norcalli/nvim-colorizer.lua',
    opt = true,
    config = function() require('colorizer').setup() end
  }

  -- LSP - LANGUAGES
  use {
    {
      'neovim/nvim-lspconfig', config = [[require('config.lspconfig')]] },
      'hrsh7th/nvim-cmp',  -- Autocompletion plugin
      'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
      'hrsh7th/cmp-vsnip', -- Link nvimcmp to Vsnip
      'hrsh7th/vim-vsnip', -- Vsnip
      { 'williamboman/nvim-lsp-installer', config = [[require('config.lspinstaller')]] }
    }

    use 'folke/lsp-colors.nvim'
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      opt = true,
      config = function()
        require("trouble").setup { }
      end
    }

    -- use {
    -- 'weilbith/nvim-code-action-menu',
    -- cmd = 'CodeActionMenu',
    -- }

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
      threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }})


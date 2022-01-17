local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim"
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()

  use 'wbthomason/packer.nvim'

  use 'nathom/filetype.nvim'

  use 'tweekmonster/startuptime.vim'
  use 'lewis6991/impatient.nvim' -- Speed up start time

  -- gruvbox theme
  use 'eddyekofo94/gruvbox-flat.nvim'

  use { 'davidgranstrom/nvim-markdown-preview', opt = true }
  -- TODO fart!
  -- FIX huhu
  -- WARN huhu

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

  -- Post-install/update hook with neovim command

  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

  use {
    'nvim-treesitter/nvim-treesitter',
    config    = [[require('config.tree_sitter')]],
    cmd       =  ':TSUpdate'
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
    -- config = function() require'nvim-treesitter.configs'.setup {} end
  }

  use 'psliwka/vim-smoothie'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require('config.indent_blankline')]]
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end }
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
      config = [[ require('config.todo-comments')]]
    }

    use {
      'noib3/nvim-cokeline',
      requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
      config = [[require('config.nvimcokeline')]]
    }

    -- use { 'voldikss/vim-floaterm', opt = true }

    use 'folke/which-key.nvim'

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
    opt = true,
    config = function() require('neogit').setup() end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[require('config.nvim_tree')]]
  }

  -- use 'hashivim/vim-terraform'

  use { 'norcalli/nvim-colorizer.lua', opt = true, config = function() require'colorizer'.setup() end }

  --[[ #######################
  LSP -Languages
  ####################### ]]
  use { 'williamboman/nvim-lsp-installer', config = [[require('config.lspinstaller')]] }
  use { 'hrsh7th/nvim-cmp' } -- Autocompletion plugin
  use { 'hrsh7th/cmp-nvim-lsp' }  -- LSP source for nvim-cmp
  -- luasnip
  -- use { 'saadparwaiz1/cmp_luasnip' } -- Snippets source for nvim-cmp
  -- use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'neovim/nvim-lspconfig',
    -- opt = true,
    config = [[require('config.lspconfig')]]
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
  profile = {
    enable = true,
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}})


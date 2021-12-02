
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TPOPE's plugins
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use 'tpope/vim-fugitive'
  
  -- YAML files Shit - https://github.com/mrk21/yaml-vim
  use 'mrk21/yaml-vim'

  -- Multi cursor shit
  use 'mg979/vim-visual-multi'

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Vim syntax highlighting
  -- use 'vim-jp/syntax-vim-ex'
  
  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'psliwka/vim-smoothie'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'jiangmiao/auto-pairs'
  use 'frazrepo/vim-rainbow'

  -- Comments management
  use 'b3nj5m1n/kommentary'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use 'voldikss/vim-floaterm'

   --folke/which-key.nvim
    
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use 'hashivim/vim-terraform'

  --[[ #######################
     Language
    ####################### ]]
    use {
      'neovim/nvim-lspconfig'
      -- config = function() require 'nvim-lspconfig' end
    }
    -- use {
      -- 'weilbith/nvim-code-action-menu',
      -- cmd = 'CodeActionMenu',
    -- }
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

  if packer_bootstrap then
    require('packer').sync()
  end

end)


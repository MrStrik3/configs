return {
  -- 'folke/which-key.nvim',  -- graphical interface showing key mappings

  -- Nvim optimizations
  'nathom/filetype.nvim', -- Define the neovim's filetypes list (load quicker)
  'lewis6991/impatient.nvim', -- Speed up start time
  'sheerun/vim-polyglot',
  'edluffy/specs.nvim',
  -- 'tweekmonster/startuptime.vim', -- :StartupTIme

  -- File picker
   {
     'nvim-telescope/telescope.nvim', version = '0.1.0',
     dependencies = { 'nvim-lua/plenary.nvim' }
   },

   -- smoothen the scrolling
  {
    "karb94/neoscroll.nvim",
    config = { easing_function = "circular" } -- quadratic, cubic, quartic, quintic, circular, sine
  },

  -- Comment management
  { "numToStr/Comment.nvim", config = function() require("Comment").setup({}) end },

  -- Sourring management
  { "kylechui/nvim-surround", version = "*", config = function() require("nvim-surround").setup({}) end }, -- surround management ( parenthesis,  quote, etc.)

  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
  { "ellisonleao/glow.nvim", config = function() require("glow").setup({}) end },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" } -- you can configure Hop the way you like here; see :h hop-config
    end
  },

  -- Auto-pair, highlights the separators ((),{}, "", ''))
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree" },
      })
    end
  },

  'mg979/vim-visual-multi',  -- Multi cursor shit
  'NvChad/nvim-colorizer.lua',

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons"
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "light"
    end,
  ft = { "markdown" }
},

  --     { 'mrk21/yaml-vim', opt = true },  -- YAML files Shit - https://github.com/mrk21/yaml-vim
}

-- Plugins to look int
-- danymat/neogen (Annotation documentaiton)
-- Pocco81/true-zen.nvim
-- mrjones2014/legendary.nvim
-- dressing.nvim
-- j-hui/fidget.nvim
-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#win bar     ( heirline + winbar)
-- yanky
-- gbprod/substitute.nvim

-- statusline rice : https://repository-images.githubusercontent.com/345368765/648e8f00-cdae-11eb-87c9-cd2dbf074eda
-- FOLKE dotFiles : https://github.com/folke/dot/blob/master/config/nvim/lua/config/plugins/init.lua

-- Themes
-- 'eddyekofo94/gruvbox-flat.nvim'  -- gruvbox theme
-- { 'arcticicestudio/nord-vim', branch = 'main' } -- Nord theme
-- 'rmehri01/onenord.nvim'
-- 'luisiacc/gruvbox-baby'
-- { "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" }

-- Editor con fig
-- 'editorconfig/editorconfig-vim'
-- 'gpanders/editorconfig.nvim' -- LUA + Fennel

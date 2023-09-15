return {

  -- Nvim optimizations

  -- { "nathom/filetype.nvim", lazy = false, opts = { overrides = { sh = "sh" } } }, -- Define the neovim's filetypes list (load quicker)
  -- { "lewis6991/impatient.nvim", lazy = false }, -- Speed up start time
  -- { "sheerun/vim-polyglot", lazy = false },
  { "edluffy/specs.nvim",           lazy = false },
  { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
  { "j-hui/fidget.nvim",            lazy = false },

  {
    "codota/tabnine-nvim",
    enabled = function()
      if vim.fn.has("win32") == 1 then
        return false
      end
      return true
    end,
    lazy = false,
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "|",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end,
  },

  -- File picker
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- smoothen the scrolling
  {
    "karb94/neoscroll.nvim",
    keys = { " <C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>" },
    opts = { easing_function = "circular" }, -- quadratic, cubic, quartic, quintic, circular, sine
  },

  -- Comment management
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup({})
      require("Comment.ft").set("terraform", "#%s").set("ft", "#%s")
    end,
  },

  -- Surrounding management
  {
    "kylechui/nvim-surround",
    event = "BufReadPost",
    version = "*",
    config = true,
  }, -- surround management ( parenthesis,  quote, etc.)

  -- Mark files
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    -- keys = { "<leader>ml", "<leader>ma", "<leader>mn", "<leader>mp" },
  },

  { "ellisonleao/glow.nvim",  cmd = { "Glow" },      config = true },

  -- {
  -- 	"smoka7/hop.nvim",
  -- 	keys = { "s", "S", "<leader><leader>w", "<leader><leader>p", "<leader><leader>l" },
  -- 	branch = "v2", -- optional but strongly recommended
  -- 	lazy = false,
  -- 	config = function()
  -- 		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  -- 	end,
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end,
                                                                                                  desc =
        "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc =
      "Toggle Flash Search" },
    },
  },

  -- Auto-pair, highlights the separators ((),{}, "", ''))
  {
    "windwp/nvim-autopairs",
    event = "BufReadPost",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree" },
      })
    end,
  },

  { "mg979/vim-visual-multi", keys = { { "<C-n>" } } }, -- Multi cursor shit
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
    config = function()
      require("colorizer").setup({ filetypes = { "html", "css", "lua", "kdl" } })
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {
      auto_open = false,
      use_diagnostic_signs = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "light"
    end,
    ft = { "markdown" },
  },

  { "toppair/peek.nvim", build = "deno task --quiet build:fast", ft = { "markdown" } },
  { "mrk21/yaml-vim",    ft = { "yaml" } }, -- YAML files Shit - https://github.com/mrk21/yaml-vim

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup({
        ignore_lsp = { "null-ls" },
      })
      require("telescope").load_extension("projects")
    end,
  },
}

-- Plugins to look int
-- danymat/neogen (Annotation documentaiton)
-- Pocco81/true-zen.nvim
-- j-hui/fidget.nvim
-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#win bar     ( heirline + winbar)
-- yanky
-- gbprod/substitute.nvim
-- https://github.com/toppair/peek.nvim

-- statusline rice : https://repository-images.githubusercontent.com/345368765/648e8f00-cdae-11eb-87c9-cd2dbf074eda
-- Reddit linux Rice : https://i.redd.it/8cbtmudmyzca1.png
-- folke dotFiles : https://github.com/folke/dot/blob/master/config/nvim/lua/config/plugins/init.lua

-- Themes
-- 'eddyekofo94/gruvbox-flat.nvim'  -- gruvbox theme
-- { 'arcticicestudio/nord-vim', branch = 'main' } -- Nord theme
-- 'luisiacc/gruvbox-baby'
-- { "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" }

-- Editor config
-- 'editorconfig/editorconfig-vim'
-- 'gpanders/editorconfig.nvim' -- LUA + Fennel

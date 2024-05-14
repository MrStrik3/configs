-- TODO Move away from keybinding extensions
local M = {
  "mrjones2014/legendary.nvim",
  lazy = false,
  priority = 10000,
  -- sqlite is only needed if you want to use frecency sorting
  -- requires = 'kkharji/sqlite.lua'
  dependencies = { "stevearc/dressing.nvim", event = "VeryLazy" },
}

function M.config()
  local map = vim.api.nvim_set_keymap

  vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

  -- " don't complain on some obvious fat-fingers
  map("n", ":W", ":w", {})
  map("n", ":W!", ":w!", {})
  map("n", ":Q!", ":q!", {})
  map("n", ":Q", ":q", {})
  map("n", ":Qa", ":qa", {})
  map("n", ":Wq!", ":wq!", {})
  map("n", ":WQ!", ":wq!", {})
  map("n", ":W", ":w", {})
  map("n", "<C-c>", ":bdelete<cr>", {})
  map("n", "<C-A-c>", ":bdelete!<cr>", {})

  -- Add insert new line above or after
  map("n", "<S-Enter>", "O<Esc>j", {})
  map("n", "<C-Enter>", "o<Esc>k", {})
  map("n", "<Enter>", "i<Enter><Esc>", {})

  -- Break the Habit of Reaching for the Arrow Keys
  local opts = { noremap = true, silent = true }
  map("n", "<Up>", "<Nop>", opts)
  map("n", "<Right>", "<Nop>", opts)
  map("n", "<Left>", "<Nop>", opts)
  map("n", "<Down>", "<Nop>", opts)

  -- Window movement
  map("n", "<c-h>", "<c-w>h", {})
  map("n", "<c-j>", "<c-w>j", {})
  map("n", "<c-k>", "<c-w>k", {})
  map("n", "<c-l>", "<c-w>l", {})

  -- Buffer motions
  map("n", "H", "^", {}) -- Move to beginning of line
  map("n", "L", "$", {}) -- Move end of line

  require("dressing").setup({
    select = {
      get_config = function(opts)
        if opts.kind == "legendary.nvim" then
          return {
            telescope = {
              sorter = require("telescope.sorters").fuzzy_with_index_bias({}),
            },
          }
        else
          return {}
        end
      end,
    },
  })
  require("legendary").setup({
    keymaps = {
      {
        itemgroup = "buffers",
        description = "Buffer-related",
        icon = "裡",
        keymaps = {
          --Bufferline
          -- { "<S-Tab>", { n = "<plug>(cokeline-focus-prev)" }, description = "Switch to previous buffer" },
          -- { "<Tab>", { n = "<plug>(cokeline-focus-next)" }, description = "Switch to next buffer" },
          -- { "<A-<>", { n = "<plug>(cokeline-switch-prev)" }, description = "Move before previous buffer" },
          -- { "<A->>", { n = "<plug>(cokeline-switch-next)" }, description = "Move after next buffer" },
          { "<S-Tab>", { n = "<cmd>bprevious<cr>" }, description = "Switch to previous buffer" },
          { "<Tab>",   { n = "<cmd>bnext<cr>" },     description = "Switch to next buffer" },
        },
      },

      -- {
      -- 	itemgroup = "motions",
      -- 	description = "Fast motions",
      -- 	icon = "省",
      -- 	keymaps = {
      -- 		{ "s", ":HopChar2AC<cr>", description = "Search for 2 characters after the cursor" },
      -- 		{ "S", ":HopChar2BC<cr>", description = "Search for 2 characters before the cursor" },
      -- 		{ "<leader><leader>w", ":HopWord<cr>", description = "Move to word (Hop.nvim)" },
      -- 		{ "<leader><leader>l", ":HopLineStart<cr>", description = "Move to line (Hop.nvim)" },
      -- 		{ "<leader><leader>p", ":HopPattern<cr>", description = "Move to a search pattern (Hop.nvim)" },
      -- 	},
      -- },

      {
        itemgroup = "code",
        description = "Code Actions",
        icon = "",
        keymaps = {
          {
            "<leader>cf",
            "<cmd>lua vim.lsp.buf.format({ async = false })<cr>",
            description = "[F]ormat [C]ode",
          },
          {
            "<leader>dl",
            "<cmd>TroubleToggle document_diagnostics<cr>",
            description = "Toggle document [D]iagnostics [L]ist",
          },
          { "<leader>ct", "<cmd>TodoTrouble<cr>",                    description = "Show TODO list" },
          { "ge",         function() vim.diagnostic.goto_next() end, description = "[G]oto next diagnostic [e]rror" },
          { "gE",         function() vim.diagnostic.goto_prev() end, description = "[G]oto previous diagnostic [E]rror" },
        },
      },

      {
        itemgroup = "file",
        description = "Files",
        icon = "",
        keymaps = {
          { "<leader>fe", "<cmd>Neotree toggle<cr>",       description = "[F]ile [E]xplorer" },
          { "<leader>ff", "<cmd>Telescope find_files<cr>", description = "[F]ind [F]ile" },
          { "<leader>fn", "<cmd>enew<cr>",                 description = "[N]ew [F]ile" },
          {
            "<leader>sf",
            "<cmd>Neotree float reveal reveal_force_cwd<cr>",
            description = "[S]how the current [F]ile in the filesystem tree"
          },
          {
            "<leader>fg",
            require('telescope.builtin').live_grep,
            description = "[F]ind file using live_[G]rep",
          },
        },
      },

      {
        itemgroup = "help",
        description = "Help",
        icon = "ﬤ",
        keymaps = {
          { "<leader>hs", "<cmd>help nvim-surround.usage<cr>", description = "Help Nvim-Surround.usage" },
          { "<leader>hc", "<cmd>help visual-multi<cr>",        description = "Help multi cursors" },
        },
      },

      {
        itemgroup = "options",
        description = "Options",
        icon = "漣",
        keymaps = {
          {
            "<leader>to",
            "<cmd>set number! <cr><cmd>set relativenumber!<cr><cmd>IBLToggle<cr>",
            description = "[T]oggle [O]ptions",
          },
        },
      },

      {
        itemgroup = "plugins",
        description = "Plugins",
        icon = "ﮧ",
        keymaps = {
          { "<leader>pi", "<cmd>Lazy install<cr>", description = "Install new plugins" },
          { "<leader>pl", "<cmd>Lazy<cr>",         description = "List plugins" },
          { "<leader>pu", "<cmd>Lazy update<cr>",  description = "Update all plugins" },
          { "<leader>ps", "<cmd>Lazy sync<cr>",    description = "Sync all plugins" },
        },
      },
      {
        itemgroup = "projects",
        description = "Projects",
        icon = "ﮧ",
        keymaps = {
          {
            "<leader>Pl",
            function()
              require("telescope").extensions.projects.projects({})
            end,
            description = "List projects",
          },
        },
      },

      {
        itemgroup = "harpoon",
        description = "Mark files",
        icon = "",
        keymaps = {
          {
            "<leader>ma",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            description = "Harpoon, Add file",
          },
          {
            "<leader>ml",
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            description = "Harpoon, List marked files",
          },
          {
            "<leader>mp",
            "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
            description = "Harpoon, Navigate to previous marked file",
          },
          {
            "<leader>mn",
            "<cmd>lua require('harpoon.ui').nav_next()<cr>",
            description = "Harpoon, Navigate to next marked file",
          },
        },
      },
      {
        itemgroup = "terminal",
        description = "Terminals",
        icon = "",
        keymaps = {

          -- Terminal management
          {
            "<F10>",
            { n = ":10ToggleTerm direction=horizontal size=17<CR>", t = "<C-\\><C-n>:10ToggleTerm<CR>" },
            description = "Toggle the main terminal",
          },
          {
            "<F11>",
            -- "<cmd>lua require('config.plugins.terminal').toggle_lazygit_term()<CR>",
            require('config.plugins.terminal').toggle_lazygit_term,
            mode = { "n", "v", "i", "t" },
            description = "Show/Hide the lazygit",
          },
          {
            "<F12>",
            { n = ":4ToggleTerm<CR>", t = "<C-\\><C-n>:4ToggleTerm<CR>" },
            description = "Toggle the main terminal",
          },
        },
      },
    },
  })
end

return M

-- Substitute mapping
-- SHOULD BE REMAPPED
-- vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
-- vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
-- vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
-- vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
--Exchange
-- vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
-- vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
-- vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
-- vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })

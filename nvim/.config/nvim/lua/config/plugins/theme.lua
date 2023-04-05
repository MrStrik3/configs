local M = {
	"olimorris/onedarkpro.nvim",
	-- "onedarkpro.nvim",
  -- dir = "~/repositories/onedarkpro.nvim",
  -- dev = true,
	priority = 1000,
	lazy = false,
	-- name = "onedarkpro",
}

function M.config()
	require("onedarkpro").setup({
		theme = "onedark_vivid",
		options = {
			bold = true, -- Use the colorscheme's opinionated bold styles?
			italic = true, -- Use the colorscheme's opinionated italic styles?
			underline = true, -- Use the colorscheme's opinionated underline styles?
			undercurl = true, -- Use the colorscheme's opinionated undercurl styles?
			cursorline = true, -- Use cursorline highlighting?
			transparency = false, -- Use a transparent background?
			terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
		},
		filetypes = { -- Override which filetype highlight groups are loaded
			markdown = true,
			python = true,
			yaml = true,
			lua = true,
		},
		plugins = { -- Override which plugin highlight groups are loaded
			aerial = false,
			barbar = false,
			copilot = false,
			dashboard = false,
			gitsigns = true,
			hop = true,
			indentline = true,
			leap = true,
			lsp_saga = true,
			marks = false,
			nvim_lsp = true,
			neotest = false,
			neo_tree = true,
			nvim_cmp = true,
			nvim_bqf = false,
			nvim_dap = true,
			nvim_dap_ui = true,
			nvim_hlslens = true,
			nvim_navic = true,
			nvim_notify = true,
			nvim_tree = false,
			nvim_ts_rainbow = true,
			op_nvim = true,
			packer = false,
			polygot = true,
			startify = false,
			telescope = true,
			toggleterm = true,
			treesitter = true,
			trouble = true,
			vim_ultest = false,
			which_key = false,
		},
		styles = { -- Choose from "bold,italic,underline"
			types = "NONE", -- Style that is applied to types
			numbers = "NONE", -- Style that is applied to numbers
			strings = "NONE", -- Style that is applied to strings
			comments = "italic", -- Style that is applied to comments
			keywords = "italic", -- Style that is applied to keywords
			constants = "NONE", -- Style that is applied to constants
			functions = "NONE", -- Style that is applied to functions
			operators = "NONE", -- Style that is applied to operators
			variables = "NONE", -- Style that is applied to variables
			conditionals = "italic", -- Style that is applied to conditionals
			virtual_text = "italic", -- Style that is applied to virtual text
		},
	})
	-- onedarkpro.load()
	vim.cmd("colorscheme onedark_vivid")
end

return M

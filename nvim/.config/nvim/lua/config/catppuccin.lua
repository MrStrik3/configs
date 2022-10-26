vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
		transparent_background = false,
		term_colors = false,
		compile = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			treesitter = true,
			cmp = true,
			gitsigns = true,
			telescope = true,
			nvimtree = false,
			neotree = true,
			neogit = true,
			hop = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			}
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
		color_overrides = {},
		highlight_overrides = {},
	})

vim.cmd [[colorscheme catppuccin]]
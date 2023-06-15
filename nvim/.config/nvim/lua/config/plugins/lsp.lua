-- Mason stuff
local M = {
	"VonHeikemen/lsp-zero.nvim", -- plugin to link lsp autocompletion plugins together
	branch = "v2.x",
	event = "BufReadPre",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim", cmd = "Mason" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "smjonas/inc-rename.nvim", cmd = "IncRename", config = true },
		{ "folke/neodev.nvim", opts = true },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "rcarriga/nvim-notify" },
		{ "jose-elias-alvarez/null-ls.nvim" },
	},
}

function M.config()
	require("luasnip.loaders.from_vscode").lazy_load()

	local signs = { Error = "", Warn = "", Hint = "󰛨", Info = "" }

	local lsp = require("lsp-zero")
	-- lsp.preset('recommended')
	lsp.set_sign_icons({
		error = signs.Error,
		warn = signs.Warn,
		hint = signs.Hint,
		info = signs.Info,
	})
	lsp.set_preferences({
		suggest_lsp_servers = true,
		setup_servers_on_start = true,
		set_lsp_keymaps = false,
		configure_diagnostics = true,
		cmp_capabilities = true,
		manage_nvim_cmp = true,
		call_servers = "local",
	})

	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
	-- vim.keymap.set('x', '<F4>', vim.lsp.buf.range_code_action, opts)

	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "ge", vim.diagnostic.goto_next, opts)

	-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	-- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	-- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	-- vim.keymap.set('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
	--
	-- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	--
	-- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	-- vim.keymap.set('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	-- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

	-- local cmp = require('cmp')

	-- lsp.setup_nvim_cmp({
	--   mapping = lsp.defaults.cmp_mappings({
	--     ['<C-Space>'] = cmp.mapping.complete(),
	--     ['<C-e>'] = cmp.mapping.abort(),
	--   })
	-- })

	lsp.ensure_installed({
		"lua_ls",
		"yamlls",
		"cssls",
		"bashls",
		"jdtls",
		"html",
		"pyright",
		"terraformls",
		"tsserver",
		"lemminx",
	})

	lsp.on_attach(function(client, bufnr)
		if vim.b.lsp_attached then
			return
		end
		vim.b.lsp_attached = true

		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
	end)

	lsp.nvim_workspace()

	lsp.setup()

	local cmp = require("cmp")

	-- add parenthesis when function selected from context menu
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			-- ["<C-space>"] = cmp.mapping.complete(),
			["<C-space>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						cmp.complete()
					end
				end,
			}),

			["<C-l>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-U>"] = cmp.mapping.scroll_docs(-4),
			["<C-D>"] = cmp.mapping.scroll_docs(4),
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),
		}),
	})

	-- nvim-notify
	vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		local lvl = ({ "ERROR", "WARN", "INFO", "DEBUG" })[result.type]
		require("notify")({ result.message }, lvl, {
			title = "LSP | " .. client.name,
			timeout = 10000,
			keep = function()
				return lvl == "ERROR" or lvl == "WARN"
			end,
		})
	end

	-- null language server
	require("null-ls").setup({
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.diagnostics.eslint,
			require("null-ls").builtins.completion.spell,
			require("null-ls").builtins.code_actions.gitsigns,
		},
	})
end

return M

--   -- LSP - LANGUAGES
--"glepnir/lspsaga.nvim"
--'hrsh7th/nvim-cmp',  -- Autocompletion plugin
--'hrsh7th/cmp-cmdline',
--'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
--'L3MON4D3/LuaSnip',
--'saadparwaiz1/cmp_luasnip',
--'hrsh7th/cmp-buffer', -- autocompletion for buffer
--'onsails/lspkind-nvim',
--'rcarriga/nvim-notify',
-- 'ray-x/lsp_signature.nvim
-- 'weilbith/nvim-code-action-menu',

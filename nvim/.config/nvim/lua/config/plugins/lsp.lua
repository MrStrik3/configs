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
		{ "onsails/lspkind.nvim" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			dependencies = "hrsh7th/nvim-cmp",
		},

		-- Snippets
		-- { "L3MON4D3/LuaSnip" },
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "2.*",
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		{ "rafamadriz/friendly-snippets" },
		{ "rcarriga/nvim-notify" },
		{ "jose-elias-alvarez/null-ls.nvim" },
	},
}

function M.config()

  vim.notify = require("notify")

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

	-- local opts = { noremap = true, silent = true, buffer = bufnr }
	local opts = { noremap = true, silent = true, buffer = true }
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
		-- vim.b.lsp_attached = true

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
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "luasnip", keyword_length = 2 },
		},

		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = require("lspkind").cmp_format({
				-- mode = "symbol_text", -- show only symbol annotations
				mode = "text_symbol", -- show only symbol annotations
				menu = {
					buffer = "[Buffer]",
          path = "[Path]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
          cmp_tabnine = "[T9]"
				},
				maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				before = function(entry, vim_item)
					vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol_text" })
					return vim_item
				end,
			}),
		},

		--   formatting = {
		-- 	format = function(entry, vim_item)
		--
		--       vim_item.kind = require('lspkind').symbolic(vim_item.kind, { mode = "symbol" })
		-- 		  vim_item.menu = source_mapping[entry.source.name]
		--
		--       if entry.source.name == "cmp_tabnine" then
		-- 			local detail = (entry.completion_item.labelDetails or {}).detail
		-- 			vim_item.kind = ""
		-- 			if detail and detail:find(".*%%.*") then
		-- 				vim_item.kind = vim_item.kind .. " " .. detail
		-- 			end
		--
		-- 			if (entry.completion_item.data or {}).multiline then
		-- 				vim_item.kind = vim_item.kind .. " " .. "[ML]"
		-- 			end
		-- 		end
		-- 		local maxwidth = 80
		-- 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
		-- 		return vim_item
		-- 	end,
		-- },
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
			require("null-ls").builtins.formatting.terraform_fmt,
			require("null-ls").builtins.diagnostics.eslint,
			-- require("null-ls").builtins.completion.spell,
			require("null-ls").builtins.code_actions.gitsigns,
		},
	})

  -- terraformls
  require'lspconfig'.terraformls.setup{}
  vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars", "*.hcl" },
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

return M

--   -- LSP - LANGUAGES
--"glepnir/lspsaga.nvim"
--'hrsh7th/nvim-cmp',  -- Autocompletion plugin
--'hrsh7th/cmp-cmdline',
--'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
--'onsails/lspkind-nvim',
-- 'ray-x/lsp_signature.nvim
-- 'weilbith/nvim-code-action-menu',

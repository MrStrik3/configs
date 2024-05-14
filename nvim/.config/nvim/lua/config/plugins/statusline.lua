local M = {
	"rebelot/heirline.nvim",
	lazy = false,
	dependencies = { { "smiteshp/nvim-navic" } },
	-- dependencies = { { "smiteshp/nvim-navic", commit="11e0839" } },
}

function M.config()
	require("nvim-navic").setup({
		highlight = true,
		separator = "  ",
		icons = {
			File = " ",
			Module = " ",
			Namespace = " ",
			Package = " ",
			Class = " ",
			Method = " ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = " ",
			Interface = " ",
			Function = " ",
			Variable = " ",
			Constant = " ",
			String = " ",
			Number = " ",
			Boolean = " ",
			Array = " ",
			Object = " ",
			Key = " ",
			Null = " ",
			EnumMember = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		},
    safe_output = true,
    preference = { 'lua_ls', 'null-ls' },
    auto_attach = true,
	})

	local heirline = require("heirline")
	local conditions = require("heirline.conditions")
	local utils = require("heirline.utils")

	-- Load the current theme colors
	-- local colors = require("onedarkpro.helpers").get_colors()
  local colors = require("tokyonight.colors").setup()
	heirline.load_colors(colors)

	-- ICONS
	-- local icons = {
	-- 	left_hard_divider = "",
	-- 	right_hard_divider = "",
	-- 	right_soft_divider = "",
	-- 	left_soft_divider = "",
	-- }

	local function wrapInSlanterLean(component, isLeaningLeft, bg_color, fg_color)
		if isLeaningLeft then
			return {
				{ provider = "", hl = { bg = fg_color, fg = bg_color } },
				component,
				{ provider = "", hl = { bg = bg_color, fg = fg_color } },
			}
		else
			return {
				{ provider = "", hl = { bg = bg_color, fg = fg_color } },
				component,
				-- mrjones2014/legendary.nvim
				{ provider = "", hl = { bg = fg_color, fg = bg_color } },
			}
		end
	end

	-- STATUSLINE COMPONENTS
	local alignment = { provider = "%=" }

	local nvimMode = {
		init = function(self)
			self.mode = vim.fn.mode(1) -- :h mode()
			self.mode_color = self.mode_colors[self.mode:sub(1, 1)]

			if not self.once then
				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*:*o",
					command = "redrawstatus",
				})
				self.once = true
			end
		end,
		static = {
			mode_names = { -- change the strings if you like it vvvvverbose!
				n = "NORMAL",
				no = "O-PENDING",
				nov = "O-PENDING",
				noV = "O_PENDING",
				["no\22"] = "O-PENDING",
				niI = "NORMAL",
				niR = "NORMAL",
				niV = "NORMAL",
				nt = "NORMAL",
				v = "VISUAL",
				vs = "VISUAL",
				V = "V-LINE",
				Vs = "V-LINE",
				["\22"] = "V-BLOCK",
				["\22s"] = "V-BLOCK",
				s = "SELECT",
				S = "S-LINE",
				["\19"] = "S-BLOCK",
				i = "INSERT",
				ic = "INSERT",
				ix = "INSERT",
				R = "REPLACE",
				Rc = "REPLACE",
				Rx = "REPLACE",
				Rv = "V-REPLACE",
				Rvc = "V-REPLACE",
				Rvx = "V-REPLACE",
				c = "COMMAND",
				cv = "EX",
				r = "EX",
				rm = "MORE",
				["r?"] = "CONFIRM",
				["!"] = "SHELL",
				t = "TERMINAL",
			},
			mode_colors = {
				n = "green",
				i = "blue",
				v = "yellow",
				V = "yellow",
				["\22"] = "yellow",
				c = "orange",
				s = "purple",
				S = "purple",
				["\19"] = "purple",
				R = "red",
				r = "red",
				["!"] = "red",
				t = "red",
			},
		},
		{
			provider = "",
			hl = function(self)
				return { bg = self.mode_color, fg = "bg" }
			end,
		},
		{
			provider = function(self)
				return " %2(" .. self.mode_names[self.mode] .. "%) "
			end,
			-- Same goes for the highlight. Now the foreground will change according to the current mode.
			hl = function(self)
				local mode = self.mode:sub(1, 1) -- get only the first mode character
				return { bg = self.mode_colors[mode], fg = "bg", bold = true }
			end,
			update = {
				"ModeChanged",
			},
		},
		{
			provider = "",
			hl = function(self)
				return { bg = "bg", fg = self.mode_color }
			end,
		},
	}

	-- FILE BLOCK
	local FileName = {
		-- let's first set up some attributes needed by this component and it's children
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
		provider = function(self)
			-- first, trim the pattern relative to the current directory. For other
			-- options, see :h filename-modifers
			local filename = vim.fn.fnamemodify(self.filename, ":.")
			if filename == "" then
				return "No Name"
			end
			-- now, if the filename would occupy more than 1/4th of the available
			-- space, we trim the file path to its initials
			-- See Flexible Components section below for dynamic truncation
			if not conditions.width_percent_below(#filename, 0.25) then
				filename = vim.fn.pathshorten(filename)
			end
			return " " .. filename .. " "
		end,
		hl = { fg = "white", bg = "black" },
		-- hl = { fg = "white", bg = "bg_highlight" },
	}
	-- local FileNameBlock = wrapInSlanterLean(FileName, true, "bg", "bg_highlight")
	local FileNameBlock = wrapInSlanterLean(FileName, true, "bg", "black")

	local FileType = {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color =
				require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		end,
		provider = function(self)
			return self.icon and (" " .. self.icon .. " " .. string.lower(vim.bo.filetype) .. " ")
		end,
		hl = { fg = "bg", bg = "comment" },
	}

	local FileTypeBlock = wrapInSlanterLean(FileType, false, "bg", "comment")
	-- FileTypeBlock.condition = conditions.buffer_matches({ filetype = { '' } })

	local FileEncoding = {
		provider = function()
			local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
			return enc ~= "utf-8" and enc:upper()
		end,
	}

	local FileFormat = {
		static = {
			file_format_icons = {
				unix = "",
				dos = "",
				mac = "",
			},
		},
		provider = function(self)
			local fmt = vim.bo.fileformat -- dos unix mac
			return self.file_format_icons[fmt] .. " " .. fmt
		end,
		hl = { bg = "bg_highlight", fg = "gray" },
	}

	local FileFormatBlock = wrapInSlanterLean(FileFormat, false, "bg", "black")
	-- local FileFormatBlock = wrapInSlanterLean(FileFormat, false, "bg", "bg_highlight")

	-- OTHERS COMPONENTS
	local Ruler = {
		-- %l = current line number
		-- %L = number of lines in the buffer
		-- %c = column number
		-- %P = percentage through file of displayed window
		-- provider = "%7(%l:%3L%):%2c %P",
		provider = "%7(%3l:%2c%) ",
		hl = { bg = "comment", fg = "bg" },
	}
	local RulerBlock = wrapInSlanterLean(Ruler, false, "bg", "comment")

	local Git = {
		condition = conditions.is_git_repo,

		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0
				or self.status_dict.removed ~= 0
				or self.status_dict.changed ~= 0
		end,

		hl = { fg = "gray", bg = "bg_highlight" },

		{ provider = "", hl = { bg = "bg_highlight", fg = "bg" } },
		{ -- git branch name
			provider = function(self)
				return "  " .. self.status_dict.head .. " "
			end,
			hl = { bold = true },
		},
		{ provider = "", hl = { bg = "bg", fg = "bg_highlight" } },
	}

	local Diagnostics = {
		condition = conditions.has_diagnostics,
		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,
		update = { "DiagnosticChanged", "BufEnter" },
		-- Errors
		{
			condition = function(self)
				return self.errors > 0
			end,
			hl = { fg = "bg", bg = "red" },
			{
				{
					provider = "",
				},
				{
					provider = function(self)
						return vim.fn.sign_getdefined("DiagnosticSignError")[1].text .. self.errors
					end,
				},
				{
					provider = "",
					hl = { bg = "bg", fg = "red" },
				},
			}
      ,
		},
		-- Warnings
		{
			condition = function(self)
				return self.warnings > 0
			end,
			hl = { fg = "bg", bg = "yellow" },
			{
				{
					provider = "",
				},
				{
					provider = function(self)
						return vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text .. self.warnings
					end,
				},
				{
					provider = "",
					hl = { bg = "bg", fg = "yellow" },
				},
			},
		},
		-- Hints
		{
			condition = function(self)
				return self.hints > 0
			end,
			hl = { fg = "gray", bg = "bg" },
			{
				{
					provider = "",
					hl = { bg = "bg", fg = "bg" },
				},
				{
					provider = function(self)
						local spacer = (self.errors > 0 or self.warnings > 0) and " " or ""
						return spacer .. vim.fn.sign_getdefined("DiagnosticSignHint")[1].text .. self.hints
					end,
				},
				{
					provider = "",
					hl = { bg = "bg", fg = "bg" },
				},
			},
		},
		-- Info
		-- {
		-- 	condition = function(self)
		-- 		return self.info > 0
		-- 	end,
		-- 	hl = { fg = "gray", bg = "bg" },
		-- 	{
		-- 		{
		-- 			provider = function(self)
		-- 				local spacer = (self.errors > 0 or self.warnings > 0 or self.hints) and " " or ""
		-- 				return spacer .. vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text .. self.info
		-- 			end,
		-- 		},
		-- 	},
		-- },
	}

	local WorkDir = {
		provider = function()
			local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
			local cwd = vim.fn.getcwd(0)
			cwd = vim.fn.fnamemodify(cwd, ":~")
			if not conditions.width_percent_below(#cwd, 0.25) then
				cwd = vim.fn.pathshorten(cwd)
			end
			local trail = cwd:sub(-1) == "/" and "" or "/"
			return icon .. cwd .. trail
		end,
		hl = { fg = "blue", bold = true },
	}

	-- Show plugin updates available from lazy.nvim
	local Lazy = {
		condition = require("lazy.status").has_updates,
		update = { "User", pattern = "LazyUpdate" },
		provider = function()
			return " 󰚰 " .. require("lazy.status").updates() .. " "
		end,
		on_click = {
			callback = function()
				require("lazy").update()
			end,
			name = "update_plugins",
		},
		hl = { bg = "bg_highlight", fg = "gray" },
	}
	local LazyBlock = wrapInSlanterLean(Lazy, false, "bg", "bg_highlight")
	LazyBlock.condition = require("lazy.status").has_updates

	local StatusLine = {
		condition = function()
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix" },
				filetype = { "^git.*", "fugitive", "neo-tree" },
			}) == false
		end,
		nvimMode,
		Git,
    -- WorkDir,
		FileNameBlock,
		Diagnostics,
		alignment,
		LazyBlock,
		FileEncoding,
		FileFormatBlock,
		FileTypeBlock,
		-- FileType,
		RulerBlock
	}

	-- WinBar
	local WinBar = {
		condition = function()
      return require("nvim-navic").is_available
    end,

    provider = function()
			return require("nvim-navic").get_location({ highlight = false })
		end,
		update = "CursorMoved",
	}

	-- tabline
	heirline.setup({
		statusline = StatusLine,
    -- winbar = nil,
    winbar = WinBar,
		-- tabline = nil,
		-- statuscolumn = nil,
	})
end

return M

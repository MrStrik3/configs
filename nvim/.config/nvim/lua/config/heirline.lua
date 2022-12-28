local heirline = require('heirline')
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- Load the current theme colors
local colors = require("onedarkpro").get_colors()
heirline.load_colors(colors)

-- ICONS
local icons = {
    left_hard_divider = '',
    right_hard_divider = '',
    right_soft_divider = '',
    left_soft_divider = '',
}

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
          { provider = "", hl = { bg = fg_color, fg = bg_color } },
      }
    end
end

-- STATUSLINE COMPONENTS
local alignment = { provider = "%=" }

local nvimMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
        self.mode_color = self.mode_colors[self.mode:sub(1,1)]

        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                    pattern = "*:*o",
                    command = 'redrawstatus'
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
            n = "green" ,
            i = "blue",
            v = "yellow",
            V =  "yellow",
            ["\22"] =  "yellow",
            c =  "orange",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "red",
            r =  "red",
            ["!"] =  "red",
            t =  "red",
        }
    },
    {
        provider = "",
        hl = function(self) return { bg = self.mode_color, fg = "bg" } end
    },
    {
        provider = function(self)
            return " %2("..self.mode_names[self.mode].."%) "
        end,
        -- Same goes for the highlight. Now the foreground will change according to the current mode.
        hl = function(self)
            local mode = self.mode:sub(1, 1) -- get only the first mode character
            return { bg = self.mode_colors[mode], fg = "bg", bold = true, }
        end,
        update = {
            "ModeChanged",
        },
    },
    {
        provider = "",
        hl = function(self) return { bg = "bg", fg = self.mode_color } end
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
        if filename == "" then return "No Name" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return " ".. filename .." "
    end,
    hl = { fg = "white", bg = "color_column"}
}
local FileNameBlock = wrapInSlanterLean(FileName, true, "bg", "color_column")


local FileType = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and ( " ".. self.icon .. " " .. string.lower(vim.bo.filetype) .. " ")
    end,
    hl = { fg = "bg", bg = "comment" }
}

local FileTypeBlock = wrapInSlanterLean(FileType, false, "bg", "comment")

-- local FileType = {
--     provider = function()
--         return string.lower(vim.bo.filetype)
--     end,
--     hl = { fg = "selection", bold = true },
-- }

local FileEncoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc ~= 'utf-8' and enc:upper()
    end
}

local FileFormat = {
    static = {
        file_format_icons = {
            unix = "",
            dos = "",
            mac = "",
        }
    },
    provider = function(self)
        local fmt = vim.bo.fileformat -- dos unix mac
        return self.file_format_icons[fmt] .. " " .. fmt
    end,
    hl = {  bg = "color_column", fg = "gray" }

}

local FileFormatBlock = wrapInSlanterLean(FileFormat, false, "bg", "color_column")

-- OTHERS COMPONENTS
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    -- provider = "%7(%l:%3L%):%2c %P",
    provider = "%7(%3l:%2c%) ",
    hl = { bg = "comment", fg = "bg" }
}
local RulerBlock = wrapInSlanterLean(Ruler, false, "bg", "comment")

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "gray", bg = "color_column"},


    { provider = "", hl = { bg = "color_column", fg = "bg" }},
    {   -- git branch name
        provider = function(self)
            return "  " .. self.status_dict.head .. " "
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    -- {
    --     condition = function(self)
    --         return self.has_changes
    --     end,
    --     provider = "("
    -- },
    -- {
    --     provider = function(self)
    --         local count = self.status_dict.added or 0
    --         return count > 0 and ("+" .. count)
    --     end,
    --     hl = { fg = "green" },
    -- },
    -- {
    --     provider = function(self)
    --         local count = self.status_dict.removed or 0
    --         return count > 0 and ("-" .. count)
    --     end,
    --     hl = { fg = "red" },
    -- },
    -- {
    --     provider = function(self)
    --         local count = self.status_dict.changed or 0
    --         return count > 0 and ("~" .. count)
    --     end,
    --     hl = { fg = "yellow" },
    -- },
    -- {
    --     condition = function(self)
    --         return self.has_changes
    --     end,
    --     provider = ")",
    -- },
    { provider = "", hl = { bg = "bg", fg = "color_column" }},
}

local statusline = {
    condition = function()
        return conditions.buffer_matches({
                buftype = { "nofile", "prompt", "help", "quickfix" },
                filetype = { "^git.*", "fugitive", "neo-tree" },
            }) == false
    end,
    nvimMode,
    Git,
    FileNameBlock,
    alignment,
    FileEncoding,
    FileFormatBlock,
    FileTypeBlock,
    -- FileType,
RulerBlock }

heirline.setup(statusline, nil, nil)

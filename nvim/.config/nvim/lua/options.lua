vim.cmd[[
  set complete-=i
  set nrformats-=octal
  set formatoptions+=j
]]

local options = {
  completeopt= "menu,menuone,noselect",

  number = true,
  relativenumber = true,
  wrap = false,      -- dont wrap lines

  -- Search related
  hlsearch = true,    -- highlight searches by default
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  inccommand = 'nosplit', -- Incremental live completion
  laststatus = 2,      -- always display status line even if only one window is visible.
  updatetime = 1000,   -- reduce updatetime so current tag in taglist is highlighted faster
  ttimeout = true,
  ttimeoutlen = 100,

  wildignore= '*.o,*.obj,*/tmp/*,u.so,*~',  -- stuff to ignore when tab completing
  backspace= 'indent,eol,start', -- allow backspacing over everything in insert mode
  history = 1000,               -- store lots of :cmdline history

  ruler = true,
  wildmenu = true,
  autoread = true,

  expandtab = true,     -- use spaces instead of tabs
  smarttab = true,       -- use shiftwidth when hitting tab instead of sts (?)
  autoindent = true,    -- try to put the right amount of space at the beginning of a new line
  smartindent = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,

  swapfile = false,
  cursorline = true,                       -- highlight the current line

  scrolloff = 8,
  sidescrolloff = 8,

  showmode = false,                        -- we dont need to see things like -- INSERT -- anymore

  -- mouse = "a",                             -- allow the mouse to be used in neovim
  mouse = "",

  -- Backup a file before overriding it
  backup = false,

  termguicolors = true,

  errorbells = false,
  visualbell = false,
  t_vb = nil,
  -- some goddamn plugin is messing this up?
  -- set textwidth=0

  list = true,
  listchars = {
    tab = '→ ',
    -- eol = '↲',
    nbsp = '␣',
    -- trail = '•',
    -- space = '⋅',
    trail = '⋅',
    extends = '⟩',
    precedes = '⟨',
  },
  signcolumn = 'yes', -- Reserve space for diagnostic icons
  -- terminal-related
  shell = 'zsh',
}

if vim.fn.has('win32')  == 1 then
  options.shell = "pwsh"
  options.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  options.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  options.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  options.shellquote = ""
  options.shellxquote = ""
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

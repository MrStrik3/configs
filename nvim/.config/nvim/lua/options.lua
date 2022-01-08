local options = {
  number = true,
  relativenumber = true,
  wrap = false,      -- dont wrap lines 

  -- Search related
  hlsearch = true,    -- highlight searches by default
  ignorecase = true,
  smartcase = true,

  inccommand = 'nosplit', -- Incremental live completion
  laststatus = 2,      -- always display status line even if only one window is visible.
  updatetime = 1000,   -- reduce updatetime so current tag in taglist is highlighted faster

  wildignore= '*.o,*.obj,*/tmp/*,u.so,*~',  -- stuff to ignore when tab completing
  backspace= 'indent,eol,start', -- allow backspacing over everything in insert mode
  history = 1000,               -- store lots of :cmdline history

  -- let g:is_posix = 1  " vim's default is archaic bourne shell, bring it up to the 90s.

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

  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
 
  mouse = "a",                             -- allow the mouse to be used in neovim
  -- Backup a file before overriding it
  backup = false, 

  -- termguicolors = true

  -- some goddamn plugin is messing this up?
  -- set textwidth=0

  list = true,
  listchars = {
    tab = '→ ',
    -- eol = '↲',
    nbsp = '␣',
    -- trail = '•',
    trail = '⋅',
    extends = '⟩',
    precedes = '⟨',
  }
}


for k, v in pairs(options) do
  vim.opt[k] = v
end


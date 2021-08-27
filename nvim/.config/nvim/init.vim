
set nocompatible              " be iMproved, required, disabled old vim compatibility
filetype off                  " required

" ####### Plugin manager (minpac) - https://github.com/k-takata/minpac
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
" ####### End Plugin manager

" ###### Plugins
call minpac#add('vim-jp/syntax-vim-ex')

" Nerd file tree
call minpac#add('scrooloose/nerdtree', { 'on': 'NERDTreeToggle' })

" YAML files Shit - https://github.com/mrk21/yaml-vim
call minpac#add('mrk21/yaml-vim')

" Highlighting plugin
call minpac#add('nvim-treesitter/nvim-treesitter')

" call minpac#add('Shougo/deoplete.nvim')
" let g:deoplete#enable_at_startup = 1

" conquer of complete - https://github.com/neoclide/coc.nvim
call minpac#add('neoclide/coc.nvim')

" Smooth scroll - https://github.com/psliwka/vim-smoothie
call minpac#add('psliwka/vim-smoothie')

" https://github.com/tpope/
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')
"call minpac#add('tpope/vim-scriptease')
"call minpac#add('tpope/vim-speeddating')
call minpac#add('tpope/vim-fugitive')

" Auto-complete
"call minpac#add('Valloric/YouCompleteMe')

" Indent line - https://github.com/Yggdroot/indentLine
call minpac#add('Yggdroot/indentLine')

" Highlight the matching bracket
call minpac#add('jiangmiao/auto-pairs')

" https://github.com/terryma/vim-multiple-cursors
call minpac#add('terryma/vim-multiple-cursors')

" Replace text with register - https://github.com/vim-scripts/ReplaceWithRegister
"call minpac#add('ReplaceWithRegister')

" Enforce editor settings - https://github.com/editorconfig/editorconfig-vim
call minpac#add('editorconfig/editorconfig-vim', {'type': 'opt'})

call minpac#add('christoomey/vim-sort-motion', {'type': 'opt'})

" Airline (statusbar) - https://github.com/vim-airline/vim-airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

"  Startify - https://github.com/mhinz/vim-startify
call minpac#add('mhinz/vim-startify')

" rainbow brackets
call minpac#add('frazrepo/vim-rainbow')

"call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
"call minpac#add('junegunn/fzf', {'type': 'opt'})

call minpac#add('mboughaba/i3config.vim')

" Markdown related
"call minpac#add('tpope/vim-markdown', {'type': 'opt'})
"call minpac#add('JamshedVesuna/vim-markdown-preview', {'type': 'opt'})
"call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

" ####### End Plugins

" ####### User-defined commands
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" ####### End User-defined commands


filetype plugin on
filetype plugin indent on 

" syntax on
syntax enable

" ------- Themes settings--------
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" -- Markdown settings
let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1


" set termguicolors
set encoding=utf-8 fileencodings= " use utf8 by default
set number relativenumber  " Add Margin numbers"
set nowrap            " by default, dont wrap lines (see <leader>w)
set hlsearch          " highlight searches by default
set laststatus=2      " always display status line even if only one window is visible.
set updatetime=1000   " reduce updatetime so current tag in taglist is highlighted faster

set wildignore=*.o,*.obj,*/tmp/*,*.so,*~ "stuff to ignore when tab completing
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set history=1000               "store lots of :cmdline history

let g:is_posix = 1  " vim's default is archaic bourne shell, bring it up to the 90s.

set visualbell      " don't beep constantly, it's annoying.
set t_vb=           " and don't flash the screen either (terminal anyway...
set guioptions-=T   " hide gvim's toolbar by default

set expandtab         " use spaces instead of tabstops
set smarttab          " use shiftwidth when hitting tab instead of sts (?)
set autoindent        " try to put the right amount of space at the beginning of a new line
set shiftwidth=2
set softtabstop=2
set splitbelow        " when splitting, cursor should stay in bottom window

" Completion Zsh type
set wildmenu
set wildmode=full

set backup " Backup a file before overriding it

" vim register will interact with OS clipboard
"set clipboard=unnamed,unnamedplus

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = [ 'vim', 'c', 'css', 'html', 'javascript', 'perl', 'python', 'yaml', 'sh']

" ######## Custom mappings
" don't complain on some obvious fat-fingers
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Qa :qa
nmap :Wq! :wq!
nmap :WQ! :wq!

" Add insert new line above or after
nmap <S-Enter> O<Esc>j
nmap <C-Enter> o<Esc>k
nmap <Enter>   i<Enter><Esc>

let mapleader=' '
nnoremap ; :
noremap <Leader>nt :NERDTree

" Break the Habit of Reaching for the Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ######## End Custom mappings
" some goddamn plugin is messing this up?
set textwidth=0


set directory=$HOME/.vim/swap/


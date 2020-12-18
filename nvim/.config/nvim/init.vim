set nocompatible              " be iMproved, required
set termguicolors
filetype off                  " required

"Package manager (minpac)a
" https://github.com/k-takata/minpac
packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('vim-jp/syntax-vim-ex')

" List of plugins
"call minpac#add('scrooloose/nerdtree', { 'on': 'NERDTreeToggle' })

" YAML files Shit
" https://github.com/mrk21/yaml-vim
call minpac#add('mrk21/yaml-vim')

" https://github.com/tpope/vim-surround
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
" https://github.com/tpope/vim-commentary
call minpac#add('tpope/vim-commentary')
"call minpac#add('tpope/vim-scriptease')
" https://github.com/tpope/vim-speeddating
"call minpac#add('tpope/vim-speeddating')

" 
"call minpac#add('scrooloose/nerdcommenter')
"call minpac#add('Valloric/YouCompleteMe')
" https://github.com/Yggdroot/indentLine
call minpac#add('Yggdroot/indentLine')
call minpac#add('jiangmiao/auto-pairs')

" https://github.com/terryma/vim-multiple-cursors
call minpac#add('terryma/vim-multiple-cursors')

" https://github.com/vim-scripts/ReplaceWithRegister
"call minpac#add('ReplaceWithRegister')

" Enforce editor settings
" https://github.com/editorconfig/editorconfig-vim
call minpac#add('editorconfig/editorconfig-vim', {'type': 'opt'})

" https://github.com/christoomey/vim-system-copy
call minpac#add('christoomey/vim-system-copy', {'type': 'opt'})

" https://github.com/christoomey/vim-sort-motion
call minpac#add('christoomey/vim-sort-motion', {'type': 'opt'})

" Themes
" https://github.com/vim-airline/vim-airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" https://github.com/mhinz/vim-startify
call minpac#add('mhinz/vim-startify')


" https://github.com/tpope/vim-fugitive
call minpac#add('tpope/vim-fugitive')

" 
"call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
"call minpac#add('junegunn/fzf', {'type': 'opt'})

call minpac#add('mboughaba/i3config.vim')

" Markdown related plugins
"call minpac#add('tpope/vim-markdown', {'type': 'opt'})
"call minpac#add('JamshedVesuna/vim-markdown-preview', {'type': 'opt'})
"call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

" User-defined minpac command
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()


filetype plugin on
filetype plugin indent on 

syntax on

" ------- Themes settings--------
let g:solarized_termcolors=256

syntax enable
set background=dark
" colorscheme solarized
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"# -------- Markdown grip
let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

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

" vim register will interact with OS clipboard
"set clipboard=unnamed,unnamedplus

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = [ 'vim', 'c', 'css', 'html', 'javascript', 'perl', 'python', 'yaml', 'sh']

" don't complain on some obvious fat-fingers
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Qa :qa
nmap :Wq! :wq!
nmap :WQ! :wq!

"map <C-o> :NERDTreeToggle

" Add insert new line above or after
nmap <S-Enter> O<Esc>j
nmap <C-Enter> o<Esc>k
nmap <Enter>   i<Enter><Esc>

" some goddamn plugin is messing this up?
set textwidth=0


set directory=$HOME/.vim/swap/

let mapleader=";"
nnoremap ; :

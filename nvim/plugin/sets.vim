set noshowmode
set guicursor=
set updatetime=100
set hidden
set nobackup
set nowritebackup
set tgc
set shortmess+=c
set signcolumn=yes
set encoding=utf-8
set noerrorbells
set t_Co=256
set hlsearch
set incsearch
set rnu
set nu
set clipboard^=unnamed,unnamedplus
set lazyredraw
set scrolloff=8

" Tabs
" Want auto indents automatically
set autoindent
set cindent
set nowrap
set expandtab

" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=2
set shiftwidth=2
set softtabstop=2

set belloff=all
set ttyfast

set noswapfile

" Folding
set foldmethod=marker
set foldlevel=0
set modelines=1

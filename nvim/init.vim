filetype plugin indent on
syntax enable
syntax on

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'szw/vim-maximizer'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-marketplace'

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'

Plug 'nvim-lua/completion-nvim'
Plug 'Yggdroot/indentLine'
Plug 'sbdchd/neoformat'
Plug 'ngmy/vim-rubocop'

Plug 'mg979/vim-visual-multi'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'preservim/nerdtree'

Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

let mapleader = " "
set list
"set noshowmode
set guicursor=
set updatetime=100
set hidden
set nobackup
set nowritebackup
set termguicolors
set shortmess+=c
set signcolumn=yes
set encoding=utf-8
set noerrorbells
set hlsearch
set incsearch
set rnu
set nu
set clipboard^=unnamed,unnamedplus
set lazyredraw
set scrolloff=8

set laststatus=2

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
set foldmethod=syntax
set foldlevel=99

set background=dark

let g:gruvbox_contrast_dark = 'medium'

colorscheme jellybeans

"Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


"Highlight
hi clear SignColumn
hi clear VertSplit
hi CursorLineNr guibg=None guifg=#333
highlight TabLineSel guifg=#ffffff
highlight Normal cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guibg=NONE guifg=NONE
"highlight Pmenu cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guifg=#ffffff guibg=#4f4f4f

hi EndOfBuffer guibg=none
hi LineNr guibg=none

hi TabLineSel guifg=white guibg=none
hi TabLine guifg=gray guibg=none
hi TabLineFill guibg=none
"hi Search guibg=#222222 guifg=#ffffff

"RipGrep
if executable('rg')
    let g:rg_derive_root='true'
endif


noremap <Leader>s :update<CR>
nnoremap <Leader>s :update<CR>
nmap <Leader>s :update<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>w :q<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"autocmd BufWritePre * :call TrimWhitespace()
nmap <leader>trim :call TrimWhitespace()<CR>

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

nnoremap <C-p> :GFiles<cr>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Vim-fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gck :Git checkout -- %<CR>
nmap <leader>gps :Git push<CR>
nmap <leader>gpl :Git pull<CR>
nmap <leader>gs :G<CR>


inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect
set shortmess+=c

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

"Search
nnoremap / /\m
nnoremap <leader>/ /\m\c

"Maximizer
nnoremap <leader>mt :MaximizerToggle<CR>


"NeoFormat
nnoremap <leader>fpy :Neoformat! python<CR>


nmap <leader>hl :nohl<CR>

"Gitgrep
set grepprg=git\ grep

let g:grep_cmd_opts = '--line-number'

let g:vimrubocop_config = '/home/william/Documents/projects/.rubocop.yml'

nmap <Leader>r :RuboCop<CR>

set foldlevel=99 " Open all folds


function RubocopAutoformat()
    silent ! rubocop --auto-correct %
    :e!
endfunction

nnoremap <leader>frb :call RubocopAutoformat()<CR>

let g:user_emmet_leader_key=','

lua require'colorizer'.setup()

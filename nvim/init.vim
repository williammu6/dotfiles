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
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

let mapleader = " "

colorscheme gruvbox
set background=dark

"Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"Window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Highlight
hi clear SignColumn
hi clear VertSplit
"hi CursorLineNr guibg=None guifg=#333
"highlight TabLineSel guifg=#ffffff
highlight Normal cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guibg=NONE guifg=NONE
"highlight Pmenu cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guifg=#ffffff guibg=#4f4f4f
"hi EndOfBuffer guibg=none
"hi LineNr guibg=none
"hi TabLineSel guifg=white guibg=none
"hi TabLine guifg=gray guibg=none
"hi TabLineFill guibg=none
"hi Search guibg=#222222 guifg=#ffffff

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

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

nmap <leader>hl :nohl<CR>
lua require('lualine').setup()

set laststatus=3
"ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>



filetype plugin on

call plug#begin()
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

set splitright
set updatetime=100
set hidden
set nobackup
set nowritebackup
set termguicolors
set shortmess+=c
set signcolumn=no
set encoding=utf-8
set t_Co=256
set noerrorbells
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set nohlsearch
set incsearch
set rnu
set nu
set noshowmode
set clipboard^=unnamed,unnamedplus
set guicursor=
set lazyredraw

syntax on

let mapleader = " "

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }

colorscheme base16-gruvbox-dark-hard
set background=dark

"highlight Pmenu ctermbg=111217 guibg=#555
"highlight Normal ctermbg=None guibg=None

hi clear SignColumn
hi clear LineNr
set colorcolumn=80

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <leader>h :wincmd h<CR>
noremap <Leader>s :update<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>w :q<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

"nnoremap <C-p> :FZF<CR>
nnoremap <C-p> :GFiles<cr>


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Vim-fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gck :Git checkout -- %<CR>
nmap <leader>gps :Gpush<CR>
nmap <leader>gpl :Gpull<CR>
nmap <leader>gs :G<CR>

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1


"Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

"Emmet
let g:user_emmet_leader_key=','

"Prettier
nmap <leader>fa :PrettierAsync<CR>

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0

"au BufNewFile,BufRead *.ts setlocal filetype=typescript
"au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

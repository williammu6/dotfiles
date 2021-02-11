syntax enable
syntax on

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'szw/vim-maximizer'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'

Plug 'tjdevries/colorbuddy.vim'
Plug '/Users/williammurari/dotfiles/lua/nicebuddy.nvim'

call plug#end()

let mapleader = " "

set listchars=tab:\|\ 
set list
set noshowmode
"set guicursor=
set updatetime=100
set hidden
set nobackup
set nowritebackup
set termguicolors
set shortmess+=c
set signcolumn=yes
"set encoding=utf-8
set noerrorbells
set t_Co=256
set nohlsearch
set incsearch
set rnu
set nu
set clipboard^=unnamed,unnamedplus
set lazyredraw

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
set foldmethod=marker
set foldlevel=0
set modelines=1

filetype plugin indent on

lua require('colorbuddy').colorscheme('nicebuddy')
lua require'colorizer'.setup()

colorscheme nicebuddy
set background=dark

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
highlight GitGutterAdd guibg=none 
highlight GitGutterDelete guibg=none 
highlight GitGutterChange guibg=none 
highlight GitGutterChangeDelete guibg=none 

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
nmap <leader>gc :Gcommit<CR>
nmap <leader>gck :Git checkout -- %<CR>
nmap <leader>gps :Gpush<CR>
nmap <leader>gpl :Gpull<CR>
nmap <leader>gs :G<CR>

" "FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
            \ 'rebase': {
            \   'prompt': 'Rebase> ',
            \   'execute': 'echo system("{git} rebase {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-r',
            \   'required': ['branch'],
            \   'confirm': v:false,
            \ },
            \ 'track': {
            \   'prompt': 'Track> ',
            \   'execute': 'echo system("{git} checkout --track {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-t',
            \   'required': ['branch'],
            \   'confirm': v:false,
            \ },
            \}


"Lsp


lua require'lspconfig'.pyls.setup { on_attach=require'completion'.on_attach } 
"lua require'lspconfig'.solargraph.setup { on_attach=require'completion'.on_attach } 

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> vD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1vD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> vr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> v0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> vW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> vd    <cmd>lua vim.lsp.buf.declaration()<CR>

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

"GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)


nmap <leader>hl :nohl<CR>

"Lightline
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1


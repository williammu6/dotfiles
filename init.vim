syntax on

set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"set cmdheight=2

set updatetime=50

set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey



call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'lyuts/vim-rtags'
"Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-rails'
Plug 'othree/html5.vim'
Plug 'vim-python/python-syntax'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim'


call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "



" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:NetrwIsOpen=1


let g:jedi#auto_initialization = 0
let g:jedi#completions_command = "<C-Space>"

let g:ctrlp_use_caching = 0


nnoremap <leader>h :wincmd h<CR>
noremap <Leader>s :update<CR>

nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Coc conf
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"autofix current line
nmap <leader>qf  <Plug>(coc-fix-current)

"trigger completion
inoremap <silent><expr> <c-space> coc#refresh()


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


autocmd BufWritePre * :call TrimWhitespace()

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

autocmd FileType python setlocal completeopt-=preview

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}



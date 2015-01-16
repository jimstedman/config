syntax on
filetype indent plugin on

set <C-s> :update
set lazyredraw

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" more standard copy/paste
set pastetoggle=<F2>
set clipboard=unnamed

set bs=2
set mouse=a

"save with ctrl-s
noremap <C-s> :update<CR>
vnoremap <C-s> :update<CR>
inoremap <C-s> :update<CR>

"quit
noremap <C-q> :q<CR>
noremap <C-Q> :q!<CR>

"leader key
"let mapleader = ","

" movement between tabs
map <Leader>h :tabprevious<CR>
map <Leader>l :tabnext<CR>

" movement between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" move selection
" vnoremap < <gv 
" vnoremap > >gv


set number

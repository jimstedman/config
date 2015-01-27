set nocompatible
filetype off
set term=screen-256color

" Vundle stuff and plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
" mini buff explorer
" Plugin 'fholgado/minibufexpl.vim'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Better autocompletion
Bundle 'Shougo/neocomplcache.vim'
" Automatically sort python imports
Bundle 'fisadev/vim-isort'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
" Paint css colors with the real color
Bundle 'lilydjwg/colorizer'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" javascript indent
Bundle 'lukaszb/vim-web-indent'
" powerline (status bar plugin)
Bundle 'powerline/powerline'
" better autocompletion, includes jedi as a subrepo
" *** disabled due to bad compilation, on td list ***
" Bundle 'Valloric/YouCompleteMe'
" solarized
Bundle 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
" end Vundle

syntax on

let g:pydiction_location = '/home/sol/.vim/bundle/pydiction/complete-dict'

set number
set numberwidth=4
set textwidth=80
set colorcolumn=+1  " color column 81
set splitbelow
set splitright
set backspace=2     " bs behaves like most editors 
set ruler           " cursor position all the time
set showcmd         " show incomplete commands
set incsearch       " incremental search
set laststatus=2    " show status line
set autowrite       " write before running command
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set shiftround
set mouse=a " can probably remove this now

" show whitespace
set list listchars=tab:»·,trail:·,nbsp:·,tab:▸\

set lazyredraw

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" movement between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map! <C-s> <ESC>:update<cr>
map <C-s> <ESC>:update<cr>

" pymode stuff
let g:pymode_rope = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_virtualenv = 1

set background=dark
colorscheme solarized
"
"set background=light
"colorscheme solarized
"
let mapleader = ","


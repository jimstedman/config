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
" powerline (status bar plugin)
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
" better autocompletion, includes jedi as a subrepo
" *** disabled due to bad compilation, on td list ***
" Bundle 'Valloric/YouCompleteMe'
" solarized vim-kalisi
Bundle 'freeo/vim-kalisi' 
" js syntax and indent
Bundle 'pangloss/vim-javascript'

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
"set list listchars=tab:»·,trail:·,nbsp:·,tab:▸\

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

map! <C-A-S-s> <ESC>:wq<cr>
map <C-A-S-s> <ESC>:wq<cr>
map! <C-s> <ESC>:update<cr>
map <C-s> <ESC>:update<cr>

" pymode stuff
let g:pymode_rope = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_virtualenv = 1

colorscheme kalisi
set background=dark
"set background=light

" command to mkdir if needed when opening a file
command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

" easy function ends for javascript
map <C-l> o});<ESC>
map! <C-l> <cr>});

" next or previous buffer
map <C-k> :bn
map <C-j> :bp

" Toggle Vexplore with Ctrl-E from a friendly SO user
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" enter in file browser to open file with :vsplit to the right
let g:netrw_browse_split = 4
let g:netrw_altv = 1

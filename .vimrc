set nocompatible
filetype off
set term=screen-256color
let mapleader = ','

" reload .vimrc on save
autocmd! bufwritepost .vimrc source %

" more standard clipbaord
set pastetoggle=<F2>
set clipboard=unnamed

" Vundle stuff and plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
                " Indent text object
Bundle 'michaeljsmith/vim-indent-object'
                " Python mode
Bundle 'klen/python-mode'
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
                " solarized vim-kalisi
Bundle 'freeo/vim-kalisi' 
                " js syntax and indent
Bundle 'pangloss/vim-javascript'
                " ctrlp, easy open files in project
Bundle 'kien/ctrlp.vim'
                " high speed html & css editing
Bundle 'mattn/emmet-vim'
                " golang for vim
Bundle 'fatih/vim-go'

call vundle#end()
filetype plugin indent on
" end Vundle

let g:pydiction_location = '/home/sol/.vim/bundle/pydiction/complete-dict'

syntax on
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
set history=888
set undolevels=888

set hlsearch        " case insesitive searching
set incsearch
set ignorecase
set smartcase
noremap <silent><Leader>/ :nohls<CR> " clear search highlighting

set nobackup        " I'll save my work, thanks.
set nowritebackup   " the swap and backup files wreak havok with automated 
set noswapfile      " testing

set omnifunc=syntaxcomplete#Complete

" show whitespace
set list listchars=tab:»·,trail:·,nbsp:·,tab:▸\

set lazyredraw

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" move between tabs
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>
map <Leader>c <esc>:tabclose<CR>
map <Leader>n <esc>:tabnew<CR>

" move between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map! <C-A-S-s> <ESC>:wq<cr>
map <C-A-S-s> <ESC>:wq<cr>
map! <C-s> <ESC>:update<cr>
map <C-s> <ESC>:update<cr>
map <Leader>s :sort<cr>             " alpha sort selection

" pymode stuff
let g:pymode_rope = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_virtualenv = 1

colorscheme kalisi
set background=dark
"set background=light

" command to mkdir if needed when opening a file
command! -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

" easy function ends for javascript
map <C-]> o});<ESC>
map! <C-]> <cr>});

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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
set autochdir

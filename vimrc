"not compatible with vi
set nocompatible
" Quickly edit/reload the vimrc file
"use pathogen to manage bundle
execute pathogen#infect()
let mapleader = " "
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set number
set ruler
set cursorline
set backspace=indent,eol,start
set hidden
"set map key to ,
syntax on
filetype plugin indent on

"enable solarized color scheme
syntax enable

"use the transparent background
let g:solarized_termtrans = 1
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

"NERDCommenter
let NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

"NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

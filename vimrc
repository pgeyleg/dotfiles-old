"not compatible with vi
set nocompatible
" Quickly edit/reload the vimrc file
"use pathogen to manage bundle
execute pathogen#infect()
"set map key to space key
let mapleader = " "
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set number
set ruler
set cursorline
set backspace=indent,eol,start
set hidden
set nowrap
set title
syntax on

"indentation settings (soft tabs, two spaces)
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set tabstop=2
filetype plugin indent on

"enable solarized color scheme
syntax enable

"searches
set ignorecase
set incsearch
set smartcase
set hlsearch
nnoremap <silent> <leader>H :set hlsearch!<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>

if &t_Co >= 256 || has("gui_running")
  "use the transparent background
  let g:solarized_termtrans = 1
  colorscheme solarized
  set background=light
 endif

 if &t_Co > 2 || has("gui_running")
 " switch syntax highlighting on, when the terminal has colors
  let g:solarized_termtrans = 1
  colorscheme solarized
  syntax on
  set background=dark
 endif

"NERDCommenter
let NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

"NERDTree
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

"exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

"index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

"quick window navigation 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"disable tabs for html and xml files
autocmd filetype html,xml set listchars-=tab:>.

"Syntastic
let g:syntastic_enable_signs=1

"enable paste mode
set pastetoggle=<F2>

"stop using these keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"to be ignored
set wildignore+=*.class,*.o,.DS_Store
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/**,*/build/*,*/*.dSYM/*,*/.sass-cache/*
set wildmenu

"store backup & swap files elsewhere to avoid directory pollution
set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp

"persistent undo
if(has("persistent_undo"))
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
endif

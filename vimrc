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

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

"open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"indentation settings (soft tabs, two spaces)
set autoindent
set expandtab
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
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

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Delete trailing whitespace
  func! DeleteTrailingWhitespace()
    exec "normal mZ"
    %s/\s\+$//e
    exec "normal `Z"
  endfunc

  autocmd BufWritePre *.{c,cpp,h,hpp,m,mm} :call DeleteTrailingWhitespace()
  autocmd BufWritePre *.{erb,feature,haml,rb,yml} :call DeleteTrailingWhitespace()
  autocmd BufWritePre *.{css,html,js,json,less,scss,xml} :call DeleteTrailingWhitespace()
  autocmd BufWritePre *.{java,php} :call DeleteTrailingWhitespace()

  " Associate some filetypes with their proper syntax
  autocmd BufRead,BufNewFile *.applescript set filetype=applescript
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  autocmd BufRead,BufNewFile *.prawn set filetype=ruby
  autocmd BufRead,BufNewFile *.txt set filetype=text

  autocmd FileType gitcommit,markdown,text set spell

  autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

  " Enable soft-wrapping for text files
  autocmd FileType eruby,html,markdown,text,xhtml setlocal wrap linebreak nolist
augroup END


"not compatible with vi
set nocompatible

"use pathogen to manage bundle
execute pathogen#infect()

"set map key to ,
let mapleader = ","

"enable solarized color scheme
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

filetype off
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

au BufRead,BufNewFile *.html set filetype=jinja
au BufRead,BufnewFile *.tex setlocal spell spelllang=sv

set pastetoggle=<F2>

set ignorecase
set smartcase

set expandtab
"set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on

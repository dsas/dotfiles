set nocompatible
filetype off

" Use vundle to manage plugins
" see https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required.
Bundle 'gmarik/vundle'
" Use better js support
Bundle 'pangloss/vim-javascript'
" Syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

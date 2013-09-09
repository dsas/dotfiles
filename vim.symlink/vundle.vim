set nocompatible
filetype off

" Use vundle to manage plugins
" see https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required.
Bundle 'gmarik/vundle'
" Transparently edit gpg files
Bundle 'gnupg.vim'
" Marks the gutter with added/modified/delete symbols
" Where syntastic has already put a mark in the gutter
" it won't do anything for that line.
Bundle 'airblade/vim-gitgutter'
" Use better js support
Bundle 'pangloss/vim-javascript'
" Syntax checking
Bundle 'scrooloose/syntastic'
" Do syntax checking on start-up
let g:syntastic_check_on_open=1

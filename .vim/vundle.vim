set nocompatible
filetype off

" Use vundle to manage plugins
" see https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
"let g:syntastic_check_on_open=1
"let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"
" markdown syntax highlighting
Bundle 'plasticboy/vim-markdown'
" Tab auto completion
Bundle 'ervandew/supertab'
" Better PHP auto completion
Bundle 'shawncplus/phpcomplete.vim'

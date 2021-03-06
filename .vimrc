set nocompatible

" Set up bundles if not on an ancient version of vim
if filereadable(expand("~/.vim/vundle.vim"))
	source ~/.vim/vundle.vim
endif

if has("syntax")
  syntax on
endif

" Make syntax highlighting look good on dark backgrounds
set background=dark

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation and plug-ins related to the detected filetype
if has("autocmd")
  filetype plugin indent on
endif

" Indent to the same level as previous line, overridden by filetype
" indentation if appropriate.
set autoindent

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set formatoptions +=n		" Continue numbering lists
set number			" Show line numbers
set wildmenu			" Better auto-complete for open buffers etc
"set showcmd			" Show (partial) command in status line.
set showmatch			" Show matching brackets.
set ignorecase			" Do case insensitive matching
set smartcase			" Do smart case matching
"set incsearch			" Incremental search. Annoying.
"set mouse=a			" Enable mouse usage (all modes)
"
let mapleader = "\\"

" ctags
let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 50
" Show list of tags with F4
noremap <F4> :TlistToggle<cr>
" Reindex the current directory with F8
noremap <F8> :!ctags -R --fields=+iaS  .<CR>

" When moving between search results keep the current result vertically
" centered
nnoremap n nzz
nnoremap N Nzz

" Add Space2Tab command which does what it says on the tin
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'. &ts .'\}\)\+#\=repeat("\t", len(submatch(0))/'. &ts .')'

" Highlight trailing whitespace and space before tab in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\|^\W* \t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|^\W* \t\%#\@<!/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\|^\W* \t/

" Go straight to the first line when writing a git commit message
" Yes, I'm too lazy to use gg
" From
" http://vim.wikia.com/wiki/Always_start_on_first_line_of_git_commit_message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" uppercase the current word in insert mode, saves holding shift.
inoremap <c-u> <esc>viwUwi

" Open up .vimrc in a vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Hitting esc in insert mode is too much hard work
inoremap jk <esc>

" Make <leader>c comment the current line out
:autocmd FileType php nnoremap <buffer> <localleader>c I//<esc>

" Make p mean 'in params' when waiting for a movement
onoremap p :<c-u>normal! f(vi(<cr>

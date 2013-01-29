" Start Pathogen
execute pathogen#infect()

" Setup standard
filetype plugin indent on

" set our tabs to four spaces
set smartindent
set sw=4
set ts=4

" turn syntax highlighting on by default
syntax on

" set auto-indenting on for programming
set ai

" turn off compatibility with the old vi
set nocompatible

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Turn off annoying swapfiles
set noswapfile

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" do not highlight words when searching for them. it's distracting.
set nohlsearch

" highlight search terms incrementally
set incsearch

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
set binary noeol

" make that backspace key work the way it should
set backspace=indent,eol,start

" turn-off toolbar
set guioptions-=T

" turn-off scrollbar
set guioptions-=L
set guioptions-=r

" add line numbers
set nu

" don't wrap lines
set nowrap

" login to shell
set shell=bash\ --login

" allow tab completion of buffers
set wildchar=<Tab> wildmenu wildmode=full

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Double Esc clears search string
nnoremap <Esc><Esc> :let @/ = ""<CR>

" Show the full path of the current file
noremap ff :echo expand('%:p')<CR>

" Show the full path of the current file and add it to a yank register
noremap cp :let @" = expand("%:p")<CR>

" Make window movement easier
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" move to end of line
noremap - <End>

" write out
noremap wq :wq

" invert tab in insert mode
imap <S-Tab> <Esc><<i

" load closetag script
:let g:closetag_html_style=1
:source ~/.vim/scripts/closetag.vim

" Remove all trailing whitespace from file and save
noremap <C-S> :%s/\s\+$//g<CR>:w<CR>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

noremap _ :ls<CR>:b


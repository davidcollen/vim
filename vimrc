" Required Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()"
"
"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/closetag.vim'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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

" invert tab in insert mode
imap <S-Tab> <Esc><<i

" Close tag in insert mode

imap p[ <C-R>=GetCloseTag()<CR>

" load closetag script
":let g:closetag_html_style=1
":source ~/.vim/scripts/closetag.vim

" Remove all trailing whitespace from file and save
noremap <C-S> :%s/\s\+$//g<CR>:w<CR>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;
" inoremap ; :
" inoremap : ;

noremap _ :ls<CR>:b

" noremap dos :e ++ff=dos<CR>:w<CR>

colorscheme molokai

" set line number color
highlight LineNr guifg=#666666
highlight ColorColumn ctermbg=darkgrey guibg=#2f2f2f

if exists("&colorcolumn")
    set colorcolumn=79
endif

set ruler

" highlight things that we find with the search
set hlsearch

"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Ctags_Cmd = "ctags"
nnoremap ~~  :TlistToggle<cr>
"}}}

let NERDTreeIgnore = ['\.pyc$']


autocmd FileType html,htmldjango,jinjahtml,eruby,mako,twig let b:closetag_html_style=1

autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

autocmd FileType php set omnifunc=phpcomplete#CompletePHP


" abbreviations
ab dcm /**<CR> * @param <CR>* @return void<CR>*/<Esc><Up><Up>$i
ab pubm /**<CR> * @param <CR>* @return void<CR>*/<CR><Backspace>public function()<CR>{<CR><CR>}<Esc>kkk%hi
ab privar /**<CR> * @var <CR>*/<CR>private $
ab provar /**<CR> * @var <CR>*/<CR>protected $
ab pubvar /**<CR> * @var <CR>*/<CR>public $
ab ip import ipdb; ipdb.set_trace()

let g:dwm_map_keys=0

" expand tabs to spaces
set expandtab
set novisualbell

"set guifont=Monospace\ 8

" disable arrow keys in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Call Flake 8 before write .py
autocmd BufWritePost *.py call Flake8()
let g:flake8_max_line_length=99
let g:flake8_ignore="E128,E501,W293,W404"
let g:flake8_builtins="_,apply"

" NERDComment
imap §      <ESC><plug>NERDCommenterToggle
nmap §      <plug>NERDCommenterToggle

noremap 1§ :ConqueTermSplit bash

" Yank to clipboard
xmap <C-c> "+y

" Save Ctrl-c
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

"Command-T listings
"Set dir to current dir
"set autochdir
set wildignore+=*.pyc

"Folding
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Paste mode
set pastetoggle=<F6>

" Set Vim file name in tab of iterm
set t_ts=]1;
set t_fs=

" sessions
" save sessions with .vis extension
map <C-8> :mksession!  session.vis<CR>

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

" set syntax for phtml files
syntax on
filetype on
au BufNewFile,BufRead *.phtml set filetype=html
au BufNewFile,BufRead *.scss set filetype=cgji

imap jj <Esc>

" make mouse scrolling work in terminal vim!
map <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[65~ <S-ScrollWheelDown>

" make external keypad work in terminal vim OSX!
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map <Esc>OM <CR>
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -
map! <Esc>OM <CR>

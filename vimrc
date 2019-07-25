"
" ~/.vimrc
" dczheng
" created 2019-07-25
"

"---------------------plugin--------------------------

let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------plugin--------------------------

"-----------------------------------------------------

set nocompatible
set nospell
set nu
set cursorline
set tabstop=4
set expandtab
set shiftwidth=4
set mouse=a
set autochdir
set fileencodings=utf-8,gbk,gb2312
set termencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set autoindent
set smartindent
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000
set hlsearch

colorscheme koehler
setlocal foldmethod=syntax
syntax on

"-----------------------------------------------------

"---------------------keymap--------------------------

inoremap /* /*<CR>*/<ESC>O
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
nmap <F12> :UndotreeToggle<CR>

"---------------------keymap--------------------------

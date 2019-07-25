"
" ~/.vimrc
" dczheng
" created 2019-07-25
"

"---------------------vundle install-------------------
function! Vundle_setup()
	set nocompatible
	filetype off
	
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	call vundle#end()
	filetype plugin indent on

endfunction
"---------------------vundle install-------------------

"---------------------plugin--------------------------

"call Vundle_setup()

"set rtp+=~/.vim/undotree
"set rtp+=~/.vim/indent-guides
"let g:indent_guides_enable_on_vim_startup = 1
"set rtp+=~/.vim/snippets
"set rtp+=~/.vim/neosnippet

set rtp+=~/.vim/signify	
set rtp+=~/.vim/syntastic
set rtp+=~/.vim/surround	
set rtp+=~/.vim/auto-pairs

set rtp+=~/.vim/lightline
set laststatus=2
if !has( 'gui_runing')
	set t_Co=256
endif

set rtp+=~/.vim/neocomplete
let g:neocomplete#enable_at_startup = 1

"---------------------plugin--------------------------

"-----------------------------------------------------
set nocompatible
set nospell
set nu
set cursorline
set tabstop=4
set expandtab
set mouse=a
set autochdir
set fileencodings=utf-8,gbk,gb2312
set termencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set autoindent
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000

colorscheme koehler
setlocal foldmethod=syntax
syntax on

"-----------------------------------------------------

"---------------------keymap--------------------------
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
nmap <F12> :UndotreeToggle<CR>
"---------------------keymap--------------------------"

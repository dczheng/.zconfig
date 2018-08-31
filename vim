set nospell
colorscheme blackbeauty
setlocal foldmethod=syntax
Plugin 'Tagbar'
Plugin 'SuperTab'
Plugin 'clang-complete'
Plugin 'neocomplete'
nmap <f10> :TagbarToggle<CR>
set fileencodings=utf-8,gbk,gb2312
set termencoding=utf-8
set encoding=utf-8
set tags=tags
set autochdir
let g:tex_conceal = ""

Plugin 'latexlivepreview'
let g:livepreview_previewer = 'evince'
autocmd Filetype tex setl updatetime=1
nmap <F12> :LLPStartPreview <cr>

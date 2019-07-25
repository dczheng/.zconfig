#!/bin/bash
#
# dczheng
# created 2019-07-25
#

mkdir -p ~/.vim/pack/my-plugins/start/
git clone git@github.com:jiangmiao/auto-pairs.git    ~/.vim/pack/my-plugins/start/auto-pairs
git clone git@github.com:Shougo/neocomplete.vim.git  ~/.vim/pack/my-plugins/start/neocomplete
git clone git@github.com:tpope/vim-surround.git      ~/.vim/pack/my-plugins/start/surround
git clone git@github.com:vim-syntastic/syntastic.git ~/.vim/pack/my-plugins/start/syntastic
git clone git@github.com:vim-airline/vim-airline.git ~/.vim/pack/my-plugins/start/airline

#git clone git@github.com:mbbill/undotree.git         ~/.vim/pack/my-plugins/start/undotree
#git clone git@github.com:mhinz/vim-signify.git       ~/.vim/pack/my-plugins/start/signify


set runtimepath^=~/.nvim/bundle/ctrlp.vim
set number
filetype plugin indent on
set shiftwidth=4
set expandtab


set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'freeo/vim-kalisi'
call vundle#end()
filetype plugin indent on


let g:airline_theme='kalisi'
colorscheme industry
set background=dark
set autoindent
set tabstop=4

set timeoutlen=1000 ttimeoutlen=0

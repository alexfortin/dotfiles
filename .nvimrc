call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu
set background=dark
set autoindent
set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set expandtab
set ignorecase

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamed

set rtp+=/usr/local/opt/fzf

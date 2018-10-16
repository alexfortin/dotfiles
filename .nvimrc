call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu
set background=dark
set autoindent
set tabstop=4

set timeoutlen=1000 ttimeoutlen=0

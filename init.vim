call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

set splitright
set splitbelow

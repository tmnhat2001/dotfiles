call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let mapleader = ","

"gruvbox colorscheme
autocmd vimenter * colorscheme gruvbox
set termguicolors

syntax on

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

nmap <Leader>q <esc>:qa<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set number
set relativenumber
set cursorline
set splitright
set splitbelow
set noswapfile " disables .swap files being created

"Toggle search highlighting
nnoremap <silent> z/ :set hlsearch!<CR>

"vim-go syntax highlighting
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"fzf settings
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_layout = { 'down': '~20%' }
nnoremap <silent> <C-p> :Files<cr>
noremap <silent> <Leader>f :Rg<CR>
nnoremap <Leader>l :Rg \b<C-R><C-W>\b<CR>

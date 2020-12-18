call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'pangloss/vim-javascript'

Plug 'kchmck/vim-coffee-script'

Plug 'mustache/vim-mustache-handlebars'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let mapleader = ","

"gruvbox colorscheme
autocmd vimenter * colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'soft'

" disables autocomment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on

nnoremap <Leader>sc :vsp db/schema.rb<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <Leader>q :qa<CR>

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

"vim-rspec mappings
let g:rspec_command = "!clear && bin/rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

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
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git/*'"
let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent> <C-p> :Files<cr>
noremap <silent> <Leader>f :Rg<CR>
nnoremap <Leader>l :Rg \b<C-R><C-W>\b<CR>

" set fillchars=vert:\│,fold:\-
" hi VertSplit term=NONE cterm=NONE gui=NONE ctermfg=DarkGrey

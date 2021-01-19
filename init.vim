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

"tab settings
set tabstop=2      " number of visual spaces per TAB
set softtabstop=2  " number of space in tab when editing
set shiftwidth=2   " number of spaces with reindent operations
set expandtab

"vim-rspec mappings
let g:rspec_command = "!clear && bin/rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

"Toggle search highlighting
nnoremap <silent> z/ :set hlsearch!<CR>

" ale settings
let g:ale_linters = {
\ 'ruby': ['rubocop', 'ruby'],
\ 'javascript': ['eslint'],
\ 'coffeescript': ['coffeelint']
\}

let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'coffeescript': ['coffeelint'],
\}

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
nnoremap <Leader>F :Rg \b<C-R><C-W>\b<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim setup (mostly copied from their README)
"""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_global_extensions=['coc-solargraph']

" vim-repeat config
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

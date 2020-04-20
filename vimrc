" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'			        " For a tree structure on left
Plug 'vim-airline/vim-airline'		    " For informations on buffers' bottom
Plug 'vim-airline/vim-airline-themes'		" For airline's themes
Plug 'altercation/vim-colors-solarized'	" For a beautiful colorscheme
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }

" Initialize plugin system
call plug#end()

" =========== MINE ==========
" -- Settings for colorscheme
syntax enable
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
colorscheme solarized
set background=dark

" -- No swap files
set noswapfile

" -- Display lines number
set number

" -- Allow using backspace as in many software
set backspace=indent,eol,start

" -- Settings for python
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix colorcolumn=88

au BufNewFile,BufRead *.html set filetype=htmldjango shiftwidth=4
set shiftwidth=4

" -- Settings for Black
au BufWritePre *.py execute ':Black'
let g:black_skip_string_normalization=1

" -- Highlight bad white space
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" -- Color for cursor and max colum
set cursorline cursorcolumn

" -- Setting for split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" --- Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" -- Settings for NERDTree
au vimenter * NERDTree " -- Start NERDTree at vim start
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -- Settings for Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#enabled = 1

"-- Settings syntax coloring for log files
au BufNewFile,BufRead *.log set filetype=log

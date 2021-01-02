" Add some missing filetype extentions
au BufNewFile,BufRead *.yaml  set filetype=yaml

call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'preservim/nerdtree'                       " For a tree structure on left
Plug 'preservim/nerdcommenter'				    " For comment and uncomment your code
Plug 'Xuyuanp/nerdtree-git-plugin'			    " Add git symbol in the NERDTree

" Theme
Plug 'vim-airline/vim-airline'				    " For informations on buffers' bottom
Plug 'vim-airline/vim-airline-themes'		    " For airline's themes
Plug 'altercation/vim-colors-solarized'		    " For a beautiful colorscheme
Plug 'lilydjwg/colorizer'					    " Color hexa code (eg: #0F12AB)
Plug 'luochen1990/rainbow'					    " Special parenthesis colors
Plug 'ryanoasis/vim-devicons'				    " Add filetype glyphs

" Vim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'                       " Git in vim
Plug 'LucHermitte/local_vimrc'                  " Handdle local vimrc files
Plug 'LucHermitte/lh-vim-lib'                   " Library used by local_vimrc

" Language
Plug 'sheerun/vim-polyglot'                     " Improve the syntax higlighting
Plug 'kevinoid/vim-jsonc'                     " JSON with comments!
Plug 'nvie/vim-flake8'

call plug#end()

" ==============================
" ========== NERDTREE ==========
" ==============================
" /!\ MUST BE ON THE TOP BEFORE OTHERS SETTINGS /!\
au BufNew,BufRead,BufWritePost * :NERDTreeRefreshRoot

" ======================================
" ========== GENERAL SETTINGS ==========
" ======================================
" Display signcolumn, numbers and cursorcolumn for edited files
au VimEnter,BufAdd,BufNew,BufEnter,BufRead,BufWritePost *
            \ if (&filetype != 'nerdtree')
              \ | set signcolumn=yes
              \ | set number
              \ | set cursorcolumn
            \ | else
              \ | set nonumber
              \ | set signcolumn=no
              \ | set nocursorcolumn
              \ | endif

set showmatch			        " Show matching brackets/parenthesis
set incsearch			        " Find as you type search
set noswapfile			        " Disable swap files
set backspace=indent,eol,start	" Allow using backspace
set undofile                    " So is persistent undo ...
set undolevels=1000             " Maximum number of changes that can be undone
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload
set cursorline 			        " Display the cursoline
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nohlsearch                  " Disable search highlighting
set cmdheight=4                 " Command line height

" Highlight bad white space for python and c files
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile,BufEnter *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Settings syntax coloring for log files
au BufNewFile,BufRead *.log set filetype=log

" Setting for split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Change tab width for javascript files
au FileType typescript,typescriptreact,html,css,scss,javascript,javascriptreact,njml,json,jsonc set shiftwidth=2 tabstop=2 softtabstop=2

" Save undofiles in the same directory
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

" ===========================
" ========== THEME ==========
" ===========================
syntax on
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
colorscheme solarized
set background=dark

" =============================
" ========== AIRLINE ==========
" =============================
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
let g:airline#extensions#tabline#buffer_nr_show = 1

" ==============================
" ========== SENSIBLE ==========
" ==============================
set autoread

" === LOCAL_VIMRC ===
call lh#local_vimrc#munge('whitelist', $HOME.'/DevData') " Add the DevData dir in the local_vimrc whitelist

" Add some missing filetype extentions
au BufNewFile,BufRead *.yaml  set filetype=yaml

call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'preservim/nerdtree'                                       " For a tree structure on left
Plug 'preservim/nerdcommenter'                                  " For comment and uncomment your code
Plug 'Xuyuanp/nerdtree-git-plugin'                              " Add git symbol in the NERDTree

" Theme
Plug 'vim-airline/vim-airline'                                  " For informations on buffers' bottom
Plug 'vim-airline/vim-airline-themes'                           " For airline's themes
Plug 'morhetz/gruvbox'                                          " Nvim theme
Plug 'lilydjwg/colorizer'                                       " Color hexa code (eg: #0F12AB)
Plug 'luochen1990/rainbow'                                      " Special parenthesis colors
Plug 'ryanoasis/vim-devicons'                                   " Add filetype glyphs

" Vim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'                                       " Git in vim
Plug 'LucHermitte/local_vimrc'                                  " Handdle local vimrc files
Plug 'LucHermitte/lh-vim-lib'                                   " Library used by local_vimrc
Plug 'airblade/vim-gitgutter'                                   " Display git diff signs in the sign's column

" Language
Plug 'sheerun/vim-polyglot'                                     " Improve the syntax higlighting
Plug 'kevinoid/vim-jsonc'                                       " JSON with comments!
Plug 'dense-analysis/ale'                                       " ALE for linting/fixing/etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Used for the LSP

call plug#end()

" === GENERAL SETTINGS ===
set signcolumn=yes                              " Always display the sign's column
set number                                      " Display lines' number
set cursorcolumn                                " Display the cursor column
set showmatch                                   " Show matching brackets/parenthesis
set incsearch                                   " Find as you type search
set noswapfile                                  " Disable swap files
set backspace=indent,eol,start                  " Allow using backspace
set undofile                                    " So is persistent undo ...
set undolevels=1000                             " Maximum number of changes that can be undone
set undoreload=10000                            " Maximum number lines to save for undo on a buffer reload
set cursorline                                  " Display the cursoline
set scrolljump=5                                " Lines to scroll when cursor leaves screen
set scrolloff=3                                 " Minimum lines to keep above and below cursor
set expandtab                                   " Tabs are spaces, not tabs
set shiftwidth=2                                " Use indents of 2 spaces
set tabstop=2                                   " An indentation every 2 columns
set softtabstop=2                               " Let backspace delete indent
set nohlsearch                                  " Disable search highlighting
set cmdheight=4                                 " Command line height
set completeopt=menuone,preview                 " Change the completion options
autocmd CompleteDone * pclose!                  " Close the preview window when completion is done
set termguicolors                               " Enables 24-bit RGB color

" Key settings for completion options
" Use tab to go to next deoplete completion
inoremap <silent><expr><tab> pumvisible() ? '<C-n>' : '<tab>'
" Use shift + tab to go to previous deoplete completion
inoremap <silent><expr><s-tab> pumvisible() ? '<C-p>' : '<s-tab>'
" Allow to use enter to use a highlighted option
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<C-g>u<CR>'

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

" Change tab width for pyhton files
au FileType pyhton set shiftwidth=4 tabstop=4 softtabstop=4

" Save undofiles in the same directory
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

" === THEME ===
syntax on
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" === AIRLINE ===
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

" === SENSIBLE ===  
set autoread

" === LOCAL_VIMRC ===
call lh#local_vimrc#munge('whitelist', $HOME.'/DevData')    " Add the DevData dir in the local_vimrc whitelist
call lh#local_vimrc#munge('whitelist', $HOME.'/DevEnv')    " Add the DevData dir in the local_vimrc whitelist

" == ALE ===
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" Disale ale for using the one from coc.nvim
let g:ale_disable_lsp = 1

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" === GITGUTTER ===
nmap <silent> [h <Plug>(GitGutterPrevHunk)
nmap <silent> ]h <Plug>(GitGutterNextHunk)

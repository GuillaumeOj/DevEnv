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
Plug 'ryanoasis/vim-devicons'                                   " Add filetype glyphs

" Vim
Plug 'tpope/vim-sensible'
Plug 'LucHermitte/local_vimrc'                                  " Handdle local vimrc files
Plug 'LucHermitte/lh-vim-lib'                                   " Library used by local_vimrc

" Language
Plug 'sheerun/vim-polyglot'                                     " Improve the syntax higlighting
Plug 'kevinoid/vim-jsonc'                                       " JSON with comments!
Plug 'neoclide/coc.nvim'                                        " Used for the LSP

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
set termguicolors                               " Enables 24-bit RGB color
set clipboard+=unnamedplus                      " Always use the clipboard

" Highlight bad white space for python and c files
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile,BufEnter match BadWhitespace /\s\+$/

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
if has('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile
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

" === COC-GIT ===
nmap <silent> [h <Plug>(coc-git-prevchunk)
nmap <silent> ]h <Plug>(coc-git-nextchunk)
nmap <silent> [c <Plug>(coc-git-prevconflict)
nmap <silent> ]c <Plug>(coc-git-nextconflict)
nmap gs <Plug>(coc-git-chunkinfo)

" === COC.NVIM ===
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Use <TAB> for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Auto-Import when CR the completion
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Navigate throw coc.nvim diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Renaming symbol
nmap <leader>rn <Plug>(coc-rename)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Function for create shortcuts
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use :C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
" Use :CL to open coc local config
call SetupCommandAbbrs('CL', 'CocLocalConfig')
" Use :CI to open coc info
call SetupCommandAbbrs('CI', 'CocInfo')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Organize imports before writing the buffer
autocmd  BufWritePost *.py :OR

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile
"autocmd BufWritePre * :Prettier

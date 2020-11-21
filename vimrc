" Add some missing filetype extentions
au BufNewFile,BufRead *.yaml  set filetype=yml
au BufNewFile,BufRead *.j2    set filetype=jinja
au BufNewFile,BufRead *mutt-* set filetype=mail
au BufNewFile,BufRead *.kt    set filetype=kotlin

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
Plug 'inside/vim-search-pulse'				    " The cursor line pulse during search
Plug 'ryanoasis/vim-devicons'				    " Add filetype glyphs

" Vim
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'                   " Display git diffs in the sign column
Plug 'tpope/vim-fugitive'                       " Git in vim

" Language
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Add completion and linting by using language servers
Plug 'sheerun/vim-polyglot'
Plug 'chemzqm/vim-jsx-improve'

call plug#end()

" ==============================
" ========== NERDTREE ==========
" ==============================
" /!\ MUST BE ON THE TOP BEFORE OTHERS SETTINGS /!\
au VimEnter * NERDTree " -- Start NERDTree at vim start
au BufEnter *
            \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
            \ | q
            \ | endif
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

" Settings for python files
au BufNewFile,BufRead,BufEnter * if (&filetype == "python") | set colorcolumn=90 | else | set colorcolumn=0 | endif

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
au FileType html,css,scss,javascript,javascript.jsx,json,javascriptreact,njml set shiftwidth=2 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.mjml set filetype=html

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
" ========== COC.NVIM ==========
" ==============================
" au FileType python call LoadVirtualEnv()
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

autocmd FileType json syntax match Comment +\/\/.\+$+

" ==============================
" ========== SENSIBLE ==========
" ==============================
set autoread

" ====================================
" ========== VIM-EASY-ALIGN ==========
" ====================================

xmap ga <Plug>(EasyAlign)   " Interactive easy-align in visual mode
nmap ga <Plug>(EasyAlign)   " Interactive easy-align for a motion/text object

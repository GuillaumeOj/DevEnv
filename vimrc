call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'preservim/nerdtree'                                                              " For a tree structure on left
Plug 'preservim/nerdcommenter'                                                         " For comment and uncomment your code
Plug 'Xuyuanp/nerdtree-git-plugin'                                                     " Add git symbol in the NERDTree

" Theme
Plug 'vim-airline/vim-airline'		                                               " For informations on buffers' bottom
Plug 'vim-airline/vim-airline-themes'	                                               " For airline's themes
Plug 'altercation/vim-colors-solarized'                                                " For a beautiful colorscheme


" Vim
Plug 'tpope/vim-sensible'

" Language
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jaxbot/semantic-highlight.vim'                                                   " semantic highlight (permanent)
Plug 'numirias/semshi',               {'do': ':UpdateRemotePlugins', 'for': 'python'}  " semantic highlight (selected/python)
Plug 'vim-python/python-syntax',      {'for': 'python'}
Plug 'HerringtonDarkholme/yats.vim',  {'for': ['javascript', 'javascriptreact']}
Plug 'yuezk/vim-js',                  {'for': ['javascript', 'javascriptreact']}
Plug 'maxmellon/vim-jsx-pretty',      {'for': 'javascriptreact'}

Plug 'elzr/vim-json',                 {'for': 'json'}
Plug 'tpope/vim-markdown',            {'for': 'markdown'}
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'xml']}
Plug 'hail2u/vim-css3-syntax',        {'for': 'css'}

call plug#end()

" ======================================
" ========== GENERAL SETTINGS ==========
" ======================================
" Disable swap files
set noswapfile

" Allow using backspace
set backspace=indent,eol,start

" Settings for python files
au BufNewFile,BufRead,BufEnter * if (&filetype == "python") | set colorcolumn=90 | else | set colorcolumn=0 | endif

" Highlight bad white space for python and c files
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile,BufEnter *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Setting for split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Settings syntax coloring for log files
au BufNewFile,BufRead *.log set filetype=log

" ===========================
" ========== THEME ==========
" ===========================
syntax enable
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
colorscheme solarized
set background=dark

" Display the cursorline
set cursorline

" Display signcolumn, numbers and cursorcolumn for edited files
au BufNew * if (buflisted(buffer_number(""))) | set signcolumn=yes | set number | set cursorcolumn | else | set nonumber | set signcolumn=no | set nocursorcolumn | endif

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

" ==========================
" ========== JEDI ==========
" ==========================
au FileType python call LoadVirtualEnv()

" Use system python for neovim itself
let g:python_host_prog = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'
let g:python_highlight_all = 1

" =========================
" ========== ALE ==========
" =========================
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
  \ 'priority': 10,
  \ }))

let g:ale_completion_enabled = 0
"let g:ale_completion_delay = 5
"set omnifunc=ale#completion#OmniFunc
"set completeopt+=menuone
"set completeopt+=noinsert

let g:ale_sign_column_always = 1  " always show left column
let g:ale_open_list = 1
let g:ale_list_window_size = 7
let g:ale_list_vertical = 0
let g:ale_keep_list_window_open = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {}
let g:ale_linters.python = ['pyls'] " , 'flake8']
let g:ale_linters.c = ['clangformat']
let g:ale_linters.go = ['gometalinter']
let g:ale_linters.kotlin = ['ktlint', 'languageserver']
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.jsx = ['stylelint', 'eslint']
let g:ale_fixers = {
  \  'javascript': ['eslint'],
  \  '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ }

let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
let g:ale_python_pyls_config = {'pyls': {
  \ 'settings': {"configurationSources": ["flake8"]},
  \ 'plugins': {
  \   'jedi': {'environment': ''},
  \   'pylint': {'enabled': v:false},
  \   'pycodestyle': {'enabled': v:false},
  \   'pyls_mypy': { 'enabled': v:true, "live_mode": v:false },
  \   'pyls_black': { 'enabled': v:true},
  \ }}}

let g:ale_kotlin_languageserver_executable = 'kotlin-language-server'

let g:ale_fix_on_save = 1
"let __ale_c_project_filenames = ['README.md']

" for golang
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
" let g:ale_go_gometalinter_options = '--fast --vendored-linters --disable-all --enable=gotype --enable=vet --enable=golint -t'

let g:go_fmt_fail_silently = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = '⛔'
let g:ale_sign_info = 'ℹ'
let g:ale_sign_offset = 1000000
let g:ale_sign_style_error = '⛔'
let g:ale_sign_style_warning = '⚠'
let g:ale_sign_warning = '⚠'

let g:vim_json_syntax_conceal = 0

" ==============================
" ========== NERDTREE ==========
" ==============================
au vimenter * NERDTree " -- Start NERDTree at vim start
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
au BufNew,BufRead,BufWritePost * :NERDTreeRefreshRoot


" =====================================
" ========== Semshi/ALE KEYS ==========
" =====================================
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>
nmap <silent> <leader>dd <Plug>(ale_go_to_definition)
nmap <silent> <leader>dr <Plug>(ale_find_references)
nnoremap <F11> :ALEFix<cr>

nmap <silent> <leader>rr :Semshi rename<CR>
nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>
nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>
nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>

" ==============================
" ========== SENSIBLE ==========
" ==============================
set autoread

" ========================================
" ========== SEMANTIC HIGLIGTHS ==========
" ========================================
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,125,124,19]
nnoremap <F10> :SemanticHighlightToggle<cr>

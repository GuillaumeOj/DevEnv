local map = require('utils').map

-- Maps for Neovim
map('n', '<esc>', ':nohlsearch<CR>')

-- Maps for split navigation
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- Maps for navigation between buffers
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')
map('n', '<S-x>', ':bdelete<CR>')

-- Maps for FZF
map('n', '<C-p>', ':Files<CR>')
map('n', '<C-t>', ':Tags<CR>')
map('n', '<S-t>', ':BTags<CR>')
map('n', '<S-l>', ':BLines<CR>')

-- Maps for coc.nvim
vim.cmd [[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
vim.cmd [[
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
]]
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : <SID>check_back_space()? "\\<Tab>" : coc#refresh()', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', { expr = true })
map('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', { expr =true })
map('n', '[d', '<Plug>(coc-diagnostic-prev)', { noremap = false })
map('n', ']d', '<Plug>(coc-diagnostic-next)', { noremap = false })
map('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map('n', 'gi', '<Plug>(coc-implementation)', { noremap = false })
map('n', 'gr', '<Plug>(coc-references)', { noremap = false, nowait = false })
map('n', 'K', ':call <SID>show_documentation()<CR>')
map('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = false })
map('c', 'FO', ':call CocAction("format")<CR>')
map('c', 'OR', ':call CocAction("runCommand", "editor.action.organizeImport")<CR>')

-- Maps for coc-git
map('n', '[h', '<Plug>(coc-git-prevchunk)', { noremap = false })
map('n', ']h', '<Plug>(coc-git-nextchunk)', { noremap = false })
map('n', '[c', '<Plug>(coc-git-prevconflict)', { noremap = false })
map('n', ']c', '<Plug>(coc-git-nextconflict)', { noremap = false })
map('n', 'gs', '<Plug>(coc-git-chunkinfo)', { noremap = false })
map('n', 'gc', '<Plug>(coc-git-commit)', { noremap = false })
map('n', 'gu', ':CocCommand git.chunkUndo<CR>', { noremap = false })
map('n', 'gt', ':CocCommand git.chunkStage<CR>', { noremap = false })

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
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : <SID>check_back_space()? "\\<Tab>" : coc#refresh()', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', { expr = true })
map('n', '[d', '<Plug>(coc-diagnostic-prev)')
map('n', ']d', '<Plug>(coc-diagnostic-next)')
map('n', 'gd', '<Plug>(coc-definition)')
map('n', 'gy', '<Plug>(coc-type-definition)')
map('n', 'gi', '<Plug>(coc-implementation)')
map('n', 'gr', '<Plug>(coc-references)')
map('n', '<leader>n', '<Plug>(coc-rename)')

-- Maps for coc-git
map('n', '[h', '<Plug>(coc-git-prevchunk)')
map('n', ']h', '<Plug>(coc-git-nextchunk)')
map('n', '[c', '<Plug>(coc-git-prevconflict)')
map('n', ']c', '<Plug>(coc-git-nextconflict)')
map('n', 'gs', '<Plug>(coc-git-chunkinfo)')
map('n', 'gc', '<Plug>(coc-git-commit)')
map('n', 'grs', ':CocCommand git.chunkUndo<CR>')
map('n', 'gst', ':CocCommand git.chunkStage<CR>')

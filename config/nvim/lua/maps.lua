local maps = {}
local map = require('utils').map
local esc = require('utils').esc
local fn = vim.fn

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
local function check_back_space()
	local col = fn.col('.') - 1
	return col <= 0 or fn.getline('.'):sub(col, col):match('%s')
end

function maps.tab_completion()
	if fn.pumvisible() > 0 then
		return esc('<C-n>')
	end

	if check_back_space() then
		return esc('<Tab>')
	end

	return fn['coc#refresh']()
end

function maps.handle_stab()
	if fn.pumvisible() > 0 then
		return esc('<C-p>')
	end

	return esc('<C-h>')
end

function maps.handle_cr()
	if fn.pumvisible() > 0 then
		return fn['coc#_select_confirm']()
	end

	return esc('<CR>')
end

map('i', '<Tab>', 'v:lua.guigui.maps.tab_completion()', { noremap = false, expr = true })
map('i', '<S-Tab>', 'v:lua.guigui.maps.handle_stab()', { noremap = false, expr = true })
map('i', '<CR>', 'v:lua.guigui.maps.handle_cr()', { noremap = false, expr =true })
map('n', '[d', '<Plug>(coc-diagnostic-prev)', { noremap = false })
map('n', ']d', '<Plug>(coc-diagnostic-next)', { noremap = false })
map('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map('n', 'gi', '<Plug>(coc-implementation)', { noremap = false })
map('n', 'gr', '<Plug>(coc-references)', { noremap = false })
map('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = false })
map('n', 'FO', ':FO<CR>')
map('n', 'RO', ':OR<CR>')

-- Maps for coc-git
map('n', '[h', '<Plug>(coc-git-prevchunk)', { noremap = false })
map('n', ']h', '<Plug>(coc-git-nextchunk)', { noremap = false })
map('n', '[c', '<Plug>(coc-git-prevconflict)', { noremap = false })
map('n', ']c', '<Plug>(coc-git-nextconflict)', { noremap = false })
map('n', 'gs', '<Plug>(coc-git-chunkinfo)', { noremap = false })
map('n', 'gc', '<Plug>(coc-git-commit)', { noremap = false })
map('n', 'gu', ':CocCommand git.chunkUndo<CR>', { noremap = false })
map('n', 'gt', ':CocCommand git.chunkStage<CR>', { noremap = false })

_G.guigui.maps = maps

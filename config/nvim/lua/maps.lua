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

-- Maps for Telescope
map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files{}<CR>')
map('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep{}<CR>')
map('n', '<leader>fb', '<cmd>lua require"telescope.builtin".buffers{}<CR>')
map('n', '<leader>ft', '<cmd>lua require"telescope.builtin".tags{}<CR>')
map('n', '<leader>bl', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find{}<CR>')
map('n', '<leader>bt', '<cmd>lua require"telescope.builtin".current_buffer_tags{}<CR>')

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
map('i', '<CR>', 'v:lua.guigui.maps.handle_cr()', { noremap = false, expr = true })
map('n', '[d', '<Plug>(coc-diagnostic-prev)', { noremap = false })
map('n', ']d', '<Plug>(coc-diagnostic-next)', { noremap = false })
map('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
map('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false })
map('n', 'gi', '<Plug>(coc-implementation)', { noremap = false })
map('n', 'gr', '<Plug>(coc-references)', { noremap = false })
map('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = false })
map('n', 'FO', ':FO<CR>')
map('n', 'RO', ':OR<CR>')

_G.guigui.maps = maps

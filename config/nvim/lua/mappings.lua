local map = _G.guigui.utils.map
local buff_map = _G.guigui.utils.buf_map

-- Mappings for Neovim
map('n', '<esc>', ':nohlsearch<CR>')

-- Mappings for split navigation
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')


local M = {}
local api = vim.api

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true, nowait = false }
	options = vim.tbl_extend("keep", opts or {}, options)
	return api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.esc(cmd)
	return api.nvim_replace_termcodes(cmd, true, false, true)
end

_G.guigui.utils = M

return M

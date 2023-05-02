local opt = vim.opt
local M = {}

function M.setup()
	opt.list = true
	opt.listchars:append 'space:·'
	opt.listchars:append 'eol:↴'
	require('indent_blankline').setup({
		show_end_of_line = true,
		space_char_blankline = ' ',
	})
end

return M

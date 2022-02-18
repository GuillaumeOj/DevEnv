local M = {}

function M.map(mode, input, output, options)
	local local_options = { noremap = true }
	if options then
		local_options = vim.tbl_extend("force", local_options, options)
	end
	vim.api.nvim_set_keymap(mode, input, output, local_options)
end

function check_back_space()
	local col = vim.fn.col('.') - 1
        return not col or vim.fn.getline('.')[col - 1 ] == '\\s'
end

return M


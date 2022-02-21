local M = {}

function M.map(mode, input, output, options)
	local local_options = { noremap = true, silent = true, nowait = false }
	if options then
		local_options = vim.tbl_extend("force", local_options, options)
	end
	vim.api.nvim_set_keymap(mode, input, output, local_options)
end


return M

local fn = vim.fn
local M = {}

function M.setup()
	require('nvim-projectconfig').setup({
		project_dir = fn.stdpath('config') .. '/projects/'
	})
end

return M

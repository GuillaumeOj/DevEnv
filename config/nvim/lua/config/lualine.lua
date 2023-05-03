local M = {}
local navic = require('nvim-navic')

function M.setup()
	require('lualine').setup({
		winbar = {
			lualine_c = {
				{ 'filetype', icon_only = true },
				{ 'filename' },
				{
					function()
						return navic.get_location()
					end,
					cond = navic.is_available,
				},
			}
		},
		inactive_winbar = {
			lualine_c = {
				{ 'filetype', icon_only = true },
				{ 'filename' },
			}
		}
	})
end

return M

require('lualine').setup {
	options = {
		theme = 'dracula',
	},
	sections = {
		lualine_c = {{
			'filename',
			path = 1
		}}
	},
	tabline = {
		lualine_a = {{
			'buffers',
			show_filename_only = false,
		}},
	}
}


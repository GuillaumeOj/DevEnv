local b = vim.b

require('telescope').setup {
	pickers = {
		tags = {
			only_sort_tags = true,
			cwd = b.gutentags_root,
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	},
	defaults = {
		preview = {
			treesitter = false,
		}
	}
}

require('telescope').load_extension('fzy_native')

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			".local/",
			"node_modules/",
			".expo/",
			"__pycache__/",
			"env/",
		}
	}
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("session-lens")
require("telescope").load_extension("file_browser")

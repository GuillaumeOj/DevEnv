local configs = require("nvim-treesitter.configs")

configs.setup({
	auto_install = true,
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"html",
		"python",
		"yaml",
		"json",
		"jsonc",
	},
	modules = {},
	ignore_install = {},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = false },
})

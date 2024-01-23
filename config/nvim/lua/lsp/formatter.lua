local util = require("formatter.util")
local buf_filetype = vim.bo.filetype
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		dart = {
			function()
				return {
					exe = "dart format",
					args = {
						"--output",
						"show",
						"--summary",
						"none",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
	},
})

require("venv-selector").setup({})
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Auto select virtualenv Nvim open",
	pattern = "*",
	callback = function()
		local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
		if venv ~= "" then
			require("venv-selector").retrieve_from_cache()
			vim.defer_fn(function()
				vim.cmd("LspRestart")
			end, 2000)
		end
	end,
	once = true,
})

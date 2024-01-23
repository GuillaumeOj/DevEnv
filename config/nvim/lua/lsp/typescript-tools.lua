require("typescript-tools").setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	end,
	settings = {
		tsserver_max_memory = 1536,
	},
})

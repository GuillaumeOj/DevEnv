local M = {}

function M.config_loader()
	local default_settings = {
		lua_ls = {
			Lua = {
				diagnostics = {
					globals = {
						'vim',
					},
				},
			},
		},
	}
	local project_settings = _G.guigui.lsp_project_settings or {}
	local config = vim.tbl_extend('keep', project_settings, default_settings)


	return config
end

function M.setup_document_symbols(client, bufnr)
	vim.g.navic_silence = false
	local symbols_supported = client.supports_method "textDocument/documentSymbol"
	if not symbols_supported then
		_G.guigui.utils.debug("skipping setup for document_symbols, method not supported by " .. client.name)
		return
	end
	local status_ok, navic = pcall(require, 'nvim-navic')
	if status_ok then
		navic.attach(client, bufnr)
	end
end

return M

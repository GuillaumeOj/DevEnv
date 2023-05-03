local M = {}
local wich_key = require('which-key')
local lsp_utils = require('config.lsp.utils')

local function on_attach(client, bufnr)
	require('lsp-format').on_attach(client)
	local code_keymap = {
		l = {
			name = 'Code',
			r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
			a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
			d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostics' },
			i = { '<cmd>LspInfo<CR>', 'Lsp Info' },
			s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Symbols in current buffer' },
			S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', 'Symbols in current workspace' },
		},
	}

	local goto_settings = {
		name = 'Goto',
		d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
		D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
		s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
		I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
		t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
	}

	code_keymap.l.g = goto_settings
	local goto_keymap = { g = goto_settings }

	wich_key.register(code_keymap, { buffer = bufnr, prefix = '<leader>' })
	wich_key.register(goto_keymap, { buffer = bufnr, prefix = '' })

	lsp_utils.setup_document_symbols(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

function M.setup()
	require('mason').setup()
	require('mason-lspconfig').setup({
		ensure_installed = { 'lua_ls' },
	})
	require('lsp-format').setup()

	local extra_config = lsp_utils.config_loader()
	require('mason-lspconfig').setup_handlers({
		function(server_name)
			local default_config = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			local config = {}
			if extra_config[server_name] then
				config = vim.tbl_extend('keep', { settings = extra_config[server_name] }, default_config)
			else
				config = default_config
			end

			require('lspconfig')[server_name].setup(config)
		end,
	})
end

return M

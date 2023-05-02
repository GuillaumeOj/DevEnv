local M = {}
local wich_key = require('which-key')

function M.setup()
	local leader_keymap = {
		f = {
			name = 'File',
			f = { '<cmd>Telescope find_files<CR>', 'Find file' },
			g = { '<cmd>Telescope git_files<CR>', 'Find file within git dir' },
			s = { '<cmd>Telescope grep_string<CR>', 'Search current string' },
			G = { '<cmd>Telescope live_grep<CR>', 'Search string in workspace' },
			b = { '<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Find in current buffer' },
			l = {
				name = 'Find in code',
				s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Find symbols in current buffer' },
				S = { '<cmd>Telescope lsp_workspace_symbols<CR>', 'Find symbols in current workspace' },
				r = { '<cmd>Telescope lsp_references<CR>', 'References for current word' },
				i = { '<cmd>Telescope lsp_incoming_calls<CR>', 'Incoming calls for current word' },
				o = { '<cmd>Telescope lsp_outgoing_calls<CR>', 'Outgoing calls for current word' },
			}
		},
		['w'] = { '<cmd>w<CR>', 'Save current buffer' },
		['q'] = { '<cmd>q<CR>', 'Close current window' },
		c = {
			name = 'Configuration',
			r = { '<cmd>source %<CR>', 'Reload current config file' },
		},
		b = {
			name = 'Buffers',
			h = { '<cmd>BufferLineCloseLeft<CR>', 'Close all to the left' },
			k = { '<cmd>BufferLineCloseRight<CR>', 'Close all to the right' },
			c = { '<cmd>BufDel<CR>', 'Close current buffer' },
			f = { '<cmd>Telescope buffers<CR>', 'List open buffers' },
		},
		g = {
			name = 'Git',
			j = { '<cmd>Gitsigns next_hunk<CR>', 'Next hunk' },
			k = { '<cmd>Gitsigns prev_hunk<CR>', 'Previous hunk' },
			p = { '<cmd>Gitsigns preview_hunk<CR>', 'Preview hunk' },
			s = {
				name = 'Stage',
				b = { '<cmd>Gitsigns stage_buffer<CR>', 'Stage buffer' },
				h = { '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk' },
				u = { '<cmd>Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk' },
			},
			r = {
				name = 'Reset',
				b = { '<cmd>Gitsigns reset_buffer<CR>', 'Reset buffer' },
				h = { '<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk' },
			}
		},
		p = {
			name = 'Plugins',
			i = { '<cmd>Lazy install<CR>', 'Install' },
			s = { '<cmd>Lazy sync<CR>', 'Sync' },
			S = { '<cmd>Lazy clear<CR>', 'Status' },
			c = { '<cmd>Lazy clean<CR>', 'Clean' },
			u = { '<cmd>Lazy update<CR>', 'Update' },
			p = { '<cmd>Lazy profile<CR>', 'Profile' },
		},
		m = { '<cmd>Mason<CR>', 'Mason' },
	}
	wich_key.register(leader_keymap, { prefix = '<leader>' })

	local root_keymap = {
		['['] = {
			d = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Goto previous diagnostic' },
			e = { '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>',
				'Goto previous error' },
		},
		[']'] = {
			d = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Goto next diagnostic' },
			e = { '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>',
				'Goto next error' },
		},
		['<Tab>'] = { '<cmd>BufferLineCycleNext<CR>', 'Next' },
		['<S-Tab>'] = { '<cmd>BufferLineCyclePrev<CR>', 'Previous' },
	}
	wich_key.register(root_keymap, { prefix = '' })
end

return M

local whichkey = require("which-key")

whichkey.register({
	["<leader>"] = {
		w = { "<cmd>w!<CR>", "Save" },
		q = { "<cmd>confirm q<CR>", "Quit current window" },
		Q = { "<cmd>confirm qa<CR>", "Quit Neovim" },
		c = { "<cmd>BufDel<CR>", "Close current buffer" },
		h = { "<cmd>checkhealth<CR>", "Run health check" },
		t = {
			name = "+Telescope",
			f = { "<cmd>Telescope find_files<CR>", "Find files" },
			b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search in current buffer" },
			B = { "<cmd>Telescope buffers<CR>", "List buffers" },
			s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
			S = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace symbols" },
			d = { "<cmd>Telescope lsp_definitions<CR>", "Goto word's definition" },
			a = { "<cmd>Telescope session-lens<CR>", "List existing sessions" },
			e = { "<cmd>Telescope file_browser<CR>", "Browese files" },
		},
		m = {
			name = "+Mason",
			m = { "<cmd>Mason<CR>", "List all packages" },
			u = { "<cmd>MasonUpdate<CR>", "Update all packages" },
		},
		p = {
			name = "+Lazy",
			l = { "<cmd>Lazy<CR>", "List all packages" },
			u = { "<cmd>Lazy update<CR>", "Update packages" },
		},
		l = {
			name = "+LSP",
			f = { "<cmd>FormatWrite<CR>", "Format current buffer" },
			j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
			k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		},
		g = {
			name = "+Gitsigns",
			j = { "<cmd>Gitsigns next_hunk<CR>", "Next hunk" },
			k = { "<cmd>Gitsigns prev_hunk<CR>", "Previous hunk" },
			s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
			r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
			S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer" },
			R = { "<cmd>Gitsigns reset_buffer<CR>", "Reset buffer" },
			u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo stage hunk" },
			h = { "<cmd>Gitsigns select_hunk<CR>", "Select hunk" },
			p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
			d = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle deleted" },
		},
		b = {
			name = "+Buffer",
			j = { "<cmd>BufferLineNext<CR>", "Next buffer" },
			k = { "<cmd>BufferLinePrev<CR>", "Previous buffer" },
			c = {
				name = "+Close",
				j = { "<cmd>BufferlineCloseRightCR>", "Close buffers to the right" },
				k = { "<cmd>BufferLineCloseLeft>", "Close buffers to the left" },
			},
			s = {
				name = "+Split",
				v = { "<cmd>vs<CR>", "Vertical split" },
				h = { "<cmd>split<CR>", "Horizontal split" },
			},
		},
	},
})

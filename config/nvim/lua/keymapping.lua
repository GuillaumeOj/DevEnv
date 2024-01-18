local keymap = vim.api.nvim_set_keymap
local default_opts = {
	noremap = true,
	silent = true,
}

-- Buffers
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", default_opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", default_opts)

-- Navigate through windows
keymap("n", "<C-l>", "<C-w>l", default_opts)
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)

-- Cancel search highlighting
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", default_opts)

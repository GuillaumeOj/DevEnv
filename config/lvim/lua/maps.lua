-- Maps for Neovim
lvim.keys.normal_mode["<esc>"] = ":nohlsearch<CR>"

-- Maps for navigation between buffers
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<S-x>"] = ":bdelete<CR>"

-- Maps for Telescope
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  P    = { "<cmd>Telescope projects<CR>", "Projects" },
  f    = { "<cmd>Telescope find_files<CR>", "Find files" },
  g    = { "<cmd>Telescope live_grep<CR>", "Live grep" },
  b    = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find current buffer" },
  B    = { "<cmd>Telescope buffers<CR>", "Find open buffers" },
}

-- Maps for Trouble
lvim.builtin.which_key.mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

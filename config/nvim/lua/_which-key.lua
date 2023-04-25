local wk = require("which-key")

wk.register({
  f = {
    name = "file",
    b = { "<cmd>Telescope buffers<CR>", "List open buffers" },
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    g = { "<cmd>Telescope git_files<CR>", "Find file within git dir" },
  },
  w = { ":w<CR>", "Save current buffer" },
}, { prefix = "<leader>" })

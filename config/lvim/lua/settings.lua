lvim.colorscheme = "dracula"
lvim.log.level = "warn"
lvim.leader = "space"
lvim.format_on_save = true
lvim.builtin.bufferline.options = {
  always_show_bufferline = true,
}
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.conceallevel = 0

-- Settings for mini.nvim.
require("mini.surround").setup {}
require("mini.pairs").setup {}
require("mini.cursorword").setup {}

-- Settings for nvim-projectconfig
require("nvim-projectconfig").setup {
  project_dir = "~/.config/lvim/projects/"
}

lvim.log.level = "warn"
lvim.leader = "space"
lvim.format_on_save = true
lvim.builtin.bufferline.options = {
  always_show_bufferline = true,
}
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true

-- Settings for mini.nvim.
require("mini.surround").setup {}
require("mini.pairs").setup {}

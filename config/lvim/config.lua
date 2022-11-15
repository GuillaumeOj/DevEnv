-- Load custom settings files here
require("plugins")
require("maps")

-- Lunarvim extensions' disabled
lvim.builtin.autopairs.active = false

-- General settings
lvim.colorscheme = "dracula"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.builtin.bufferline.options = { always_show_bufferline = true,
}
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 4
vim.opt.conceallevel = 0

-- Settings for mini.nvim.
require("mini.surround").setup {}
require("mini.pairs").setup {}
require("mini.cursorword").setup {}

-- Settings for nvim-projectconfig
require("nvim-projectconfig").setup {
  project_dir = "~/.config/lvim/projects/"
}

-- Settings for Telescope
lvim.builtin.telescope.pickers.find_files.preview   = true
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.find_files.hidden    = true

lvim.builtin.telescope.pickers.buffers.preview      = true
lvim.builtin.telescope.pickers.buffers.previewer    = nil
lvim.builtin.telescope.pickers.buffers.initial_mode = "insert"

lvim.builtin.telescope.defaults.path_display = { shorten = { len = 10, exclude = { 1, -1 } } }
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/*",
  "%.lock",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  ".git/",
  "%.webp",
  ".github/",
  "__pycache__/",
  "build/",
  "env/",
  "node_modules/",
  "%.pdf",
}

lvim.builtin.telescope.extensions = {
  override_generic_sorter = true,
  override_file_sorter = true,
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
end

-- Settings for Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }

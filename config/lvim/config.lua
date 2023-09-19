lvim.plugins = {
  { "echasnovski/mini.nvim" },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
}

-- Maps for Neovim
lvim.keys.normal_mode["<esc>"] = "<cmd>nohlsearch<CR>"

-- Maps for navigation between buffers
lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-x>"] = "<cmd>BufferKill<CR>"

-- Maps for Telescope
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  P    = { "<cmd>Telescope projects<CR>", "Projects" },
  f    = { "<cmd>Telescope find_files<CR>", "Find files" },
  g    = { "<cmd>Telescope live_grep<CR>", "Live grep" },
  b    = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find current buffer" },
  B    = { "<cmd>Telescope buffers<CR>", "Find open buffers" },
}

lvim.builtin.gitsigns.opts.current_line_blame = true

-- General settings
lvim.colorscheme = "tokyonight-storm"
lvim.format_on_save.enabled = true
lvim.builtin.bufferline.options = { always_show_bufferline = true }
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 4
vim.opt.conceallevel = 0
vim.opt.wrap = true

-- Settings for mini.nvim.
require("mini.surround").setup {}

-- Settings for Telescope
lvim.builtin.telescope.pickers.find_files.hidden     = true
lvim.builtin.telescope.pickers.buffers.initial_mode  = "insert"
lvim.builtin.telescope.defaults.path_display         = { shorten = { len = 10, exclude = { 1, -1 } } }
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
lvim.builtin.telescope.extensions                    = {
  override_generic_sorter = true,
  override_file_sorter = true,
}
lvim.builtin.telescope.on_config_done                = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
end

-- Settings for Treesitter
lvim.builtin.treesitter.ensure_installed             = {
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
lvim.builtin.treesitter.ignore_install               = { "haskell" }


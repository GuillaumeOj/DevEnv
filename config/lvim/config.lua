lvim.plugins = {
  { "alexaandru/nvim-lspupdate" },
  { "echasnovski/mini.nvim" },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "windwp/nvim-projectconfig" },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
}

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

-- Lunarvim extensions' disabled
lvim.builtin.autopairs.active = false

-- General settings
lvim.colorscheme = "tokyonight-moon"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.builtin.bufferline.options = { always_show_bufferline = true }
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 4
vim.opt.conceallevel = 0

-- Settings for mini.nvim.
require("mini.surround").setup {}
require("mini.pairs").setup {}

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

lvim.autocommands = {
  {
    { "BufEnter", "BufWinEnter" },
    {
      group = "lvim_user",
      pattern = "*.py",
      command = "setlocal ts=4 sw=4"
    }
  }
}

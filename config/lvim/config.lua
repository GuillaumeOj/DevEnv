--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
lvim.builtin.telescope.setup = {
  pickers = {
    tags = {
      onlyt_sort_tags = true,
      cwd = vim.b.gutentags_root,
    }
  },
  defaults = {
    preview = {
      treesitter = false,
    }
  }
}
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
end
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- local _, actions = pcall(require, "telescope.actions")
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  P    = { "<cmd>Telescope projects<CR>", "Projects" },
  f    = { "<cmd>Telescope find_files<CR>", "Find files" },
  g    = { "<cmd>Telescope live_grep<CR>", "Live grep" },
  T    = { "<cmd>Telescope tags<CR>", "Tags" },
  t    = { "<cmd>Telescope current_buffer_tags<CR>", "Current buffer tags" },
  b    = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find current buffer" },
  B    = { "<cmd>Telescope buffers<CR>", "Find open buffers" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
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
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "ludovicchabant/vim-gutentags"
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim"
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

local g = vim.g

g.gutentags_enabled = true
g.gutentags_project_root = { ".git" }
g.gutentags_add_default_project_roots = false
g.gutentags_generate_on_missing = true
g.gutentags_generate_on_write = true
g.gutentags_generate_on_empty_buffer = true
g.gutentags_cache_dir = "/Users/guillaume/.cache/lvim/ctags"
g.gutentags_ctags_exclude = {
  "tools3d",
  "mesh-ui",
  "*/venv/",
  "*.git", "*.svg", "*.hg",
  "build",
  "dist",
  "*sites/*/files/*",
  "bin",
  "*/node_modules/",
  "*/migrations/",
  "__pycache__",
  "bower_components",
  "cache",
  "compiled",
  "docs",
  "example",
  "bundle",
  "vendor",
  "*.md",
  "*-lock.json",
  "*.lock",
  "*bundle*.js",
  "*build*.js",
  ".*rc*",
  "*.json",
  "*.min.*",
  "*.map",
  "*.bak",
  "*.zip",
  "*.pyc",
  "*.class",
  "*.sln",
  "*.Master",
  "*.csproj",
  "*.tmp",
  "*.csproj.user",
  "*.cache",
  "*.pdb",
  "tags*",
  "cscope.*",
  "*.css",
  "*.less",
  "*.scss",
  "*.exe", "*.dll",
  "*.mp3", "*.ogg", "*.flac",
  "*.swp", "*.swo",
  "*.bmp", "*.gif", "*.ico", "*.jpg", "*.png",
  "*.rar", "*.zip", "*.tar", "*.tar.gz", "*.tar.xz", "*.tar.bz2",
  "*.pdf", "*.doc", "*.docx", "*.ppt", "*.pptx",
  "*.pyc",
}
g.gutentags_ctags_extra_tags = {
  "--tag-relative=yes",
  "--fields=+ailmnS",
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

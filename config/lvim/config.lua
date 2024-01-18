lvim.lsp.installer.setup.automatic_installation = false
lvim.plugins = {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
        opts = {}
    }, {"echasnovski/mini.nvim"}, {"nvim-telescope/telescope-fzy-native.nvim"},
    {"lbrayner/vim-rzip"}, {"lukas-reineke/indent-blankline.nvim"}, {
        "smoka7/hop.nvim",
        versions = "*",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", {silent = true})
        end
    }
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
    P = {"<cmd>Telescope projects<CR>", "Projects"},
    f = {"<cmd>Telescope find_files<CR>", "Find files"},
    g = {"<cmd>Telescope live_grep<CR>", "Live grep"},
    b = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find current buffer"},
    B = {"<cmd>Telescope buffers<CR>", "Find open buffers"}
}

lvim.builtin.gitsigns.opts.current_line_blame = true

-- General settings
lvim.colorscheme = "tokyonight-storm"
lvim.format_on_save.enabled = true
lvim.builtin.bufferline.options = {always_show_bufferline = true}
vim.g.python3_host_prog = "~/.pyenv/shims/python"
vim.g.loaded_perl_provider = 0
vim.opt.cursorcolumn = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 4
vim.opt.conceallevel = 0
vim.opt.wrap = true

-- Settings for mini.nvim.
require("mini.surround").setup {}

-- Settings for Telescope
lvim.builtin.telescope.pickers.find_files.hidden = true
lvim.builtin.telescope.pickers.buffers.initial_mode = "insert"
lvim.builtin.telescope.defaults.path_display = {
    shorten = {len = 10, exclude = {1, -1}}
}
lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*", "%.lock", "%.jpg", "%.jpeg", "%.png", "%.svg", "%.otf", "%.ttf",
    ".git/", "%.webp", ".github/", "__pycache__/", "build/", "env/",
    "node_modules/", "%.pdf"
}
lvim.builtin.telescope.extensions = {
    override_generic_sorter = true,
    override_file_sorter = true
}
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzy_native")
end

-- Settings for Treesitter
lvim.builtin.treesitter.ensure_installed = {
    "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
    "css", "rust", "java", "yaml"
}
lvim.builtin.treesitter.ignore_install = {"haskell"}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {name = "black"}, {name = "isort"}, {name = "lua_format"}, {
        name = "prettier",
        filetypes = {"javascript", "typescript", "typescriptreact"}
    }
}
lvim.format_on_save.enabled = true

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {name = "flake8", filetypes = {"python"}}, {
        name = "eslint",
        args = {"--stdin", "--fix-dry-run"},
        filetypes = {"javascript", "typescript", "typescriptreact"}
    }
}

require("typescript-tools").setup {
    settings = {
        jsx_close_tag = {
            enable = true,
            filetypes = {"javascriptreact", "typescriptreact"}
        }
    }
}

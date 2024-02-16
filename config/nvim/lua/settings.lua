vim.cmd([[colorscheme tokyonight-moon]])

vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.scrolljump = 10
vim.o.scrolloff = 10
vim.o.swapfile = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.g.python3_host_prog = "/Users/guillaume/.pyenv/shims/python"

vim.cmd([[autocmd BufWritePost * silent! FormatWrite]])
vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank()]])
vim.cmd([[autocmd BufWritePost * silent! lua require("lint").try_lint()]])

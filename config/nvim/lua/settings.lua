vim.cmd([[colorscheme tokyonight-moon]])

vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false

vim.cmd([[autocmd BufWritePost * silent! FormatWrite]])
vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank()]])
vim.cmd([[autocmd BufWritePost * silent! lua require("lint").try_lint()]])

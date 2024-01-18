vim.cmd([[colorscheme tokyonight-moon]])

vim.o.backup = false
vim.o.cmdheight = _G.cmdheight_value
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

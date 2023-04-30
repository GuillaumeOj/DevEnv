local cmd = vim.cmd
local o = vim.o
local wo = vim.wo

-- Change default <leader> by <space>
vim.g.mapleader = " "

-- Global options
o.clipboard = 'unnamedplus'
o.cmdheight = 4
o.cursorcolumn = true
o.cursorline = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.undodir = vim.fn.stdpath('config') .. '/undo'
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000

cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

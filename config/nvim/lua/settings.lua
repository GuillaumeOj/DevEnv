local o = vim.o
local wo = vim.wo

-- Change default <leader> by <space>
vim.g.mapleader = " "

-- Neovim UI
-- Global options
o.cmdheight = 4

-- Window-local options
wo.cursorcolumn = true
wo.cursorline = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'

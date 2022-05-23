local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local g = vim.g
local nvim_command = vim.api.nvim_command

-- Settings for Neovim
-- global options
o.clipboard = 'unnamedplus'
o.backspace = 'indent,eol,start'
o.backup = false
o.cmdheight = 4
o.completeopt = 'menu,menuone,noselect'
o.hidden = true
o.swapfile = false
o.scrolljump = 10
o.scrolloff = 10
o.shortmess = 'filnxtToOFc'
o.showmatch = true
o.termguicolors = true
o.undodir = vim.fn.stdpath('config') .. '/undo'
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000
o.updatetime = 300
o.writebackup = false

-- window-local options
wo.cursorcolumn = true
wo.cursorline = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'

-- buffer-local options
bo.expandtab = true
bo.shiftwidth = 2
bo.softtabstop = 2
bo.tabstop = 2
bo.syntax = 'ON'

cmd[[ colorscheme dracula ]]

cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Settings for Indentline
g.indentLine_char_list = {'┊'}

-- Settings for coc.nvim
cmd[[ au CursorHold * silent call CocActionAsync('highlight') ]]
nvim_command("command! -nargs=0 FO :call CocAction('format')<CR>")
nvim_command("command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')<CR>")

-- Settings for mini.nvim.
require('mini.surround').setup{}
require('mini.pairs').setup {}

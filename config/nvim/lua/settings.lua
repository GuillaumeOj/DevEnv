local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local HOME = os.getenv('HOME')

-- Settings for Neovim
-- global options
o.clipboard = o.clipboard ..'unnamedplus'
o.backspace = 'indent,eol,start'
o.cmdheight = 4
o.completeopt = 'menu,menuone,noselect'
o.swapfile = false
o.scrolljump = 10
o.scrolloff = 10
o.shortmess = 'filnxtToOFc'
o.showmatch = true
o.termguicolors = true
o.undodir = HOME .. '/.config/nvim/undo'
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

cmd('syntax on')
cmd('colorscheme dracula')
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
cmd('au FileType pyhton set shiftwidth=4 tabstop=4 softtabstop=4')

-- Settings for lualine
require('lualine').setup {
  options = {
    theme = 'dracula',
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

-- Settings for Indentline
vim.g.indentLine_char_list = {'┊'}

-- Settings for coc.nvim
cmd[[ au CursorHold * silent call CocActionAsync('highlight') ]]
cmd(':command! -nargs=0 FO :call CocAction("format")')

-- Settings for FZF
cmd('let $FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"')

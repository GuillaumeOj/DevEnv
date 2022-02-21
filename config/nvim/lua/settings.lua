local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local HOME = os.getenv('HOME')

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
bo.syntax = 'ON'

cmd[[ colorscheme dracula ]]

cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Settings for lualine
require('lualine').setup {
  options = {
    theme = 'dracula-nvim',
  },
  sections = {
    lualine_c = {{
      'filename',
      path = 1
    }}
  },
  tabline = {
    lualine_a = {{
        'buffers',
        show_filename_only = false,
    }},
  }
}

-- Settings for Indentline
vim.g.indentLine_char_list = {'┊'}

-- Settings for coc.nvim
cmd[[ au CursorHold * silent call CocActionAsync('highlight') ]]

-- Settings for FZF
cmd('let $FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"')

-- Settings for Nvim autopairs
require('nvim-autopairs').setup{}

-- Settings for Treesitter
require('nvim-treesitter.configs').setup{
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	}
}

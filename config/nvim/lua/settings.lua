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
			'filename'
			--'buffers',
			--show_filename_only = false,
		}},
	}
}

-- Settings for Indentline
g.indentLine_char_list = {'┊'}

-- Settings for coc.nvim
cmd[[ au CursorHold * silent call CocActionAsync('highlight') ]]
nvim_command("command! -nargs=0 FO :call CocAction('format')<CR>")
nvim_command("command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')<CR>")
cmd[[ au  BufWritePost *.py :OR ]]


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
	},
	incremental_selection = {
		enable = true,
	},
}

-- Settings for vim-gutentags
g.gutentags_enabled = true
g.gutentags_cache_dir = '~/.cache/nvim/ctags'
nvim_command("command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')")
g.gutentags_add_default_project_roots = false
-- g.gutentags_trace = 1
--g.gutentags_project_root = {'.git'}
g.gutentags_generate_on_new = true
g.gutentags_generate_on_missing = true
g.gutentags_generate_on_write = true
g.gutentags_generate_on_empty_buffer = true
g.gutentags_ctags_exclude = {
	'*.git',
	'*.svg',
	'build',
	'dist',
	'*sites/*/files/*',
	'bin',
	'node_modules',
	'__pycache__', 'venv',
	'bundle',
	'vendor',
	'*-lock.json',
	'*.lock',
	'*bundle*.js',
	'*build*.js',
	'.*rc*',
	'*.json',
	'*.bak',
	'*.zip',
	'*.pyc',
	'*.tmp',
	'*.pdb',
	'tags*',
	'*.css',
	'*.less',
	'*.scss',
	'*.swp',
	'undo/*',
	'*.swo',
	'*.bmp',
	'*.gif',
	'*.ico',
	'*.jpg',
	'*.png',
	'*.rar',
	'*.zip',
	'*.tar',
	'*.tar.gz',
	'*.tar.xz',
	'*.tar.bz2',
	'*.pdf',
	'*.doc',
	'*.docx',
	'*.ppt',
	'*.pptx'
}
g.gutentags_ctags_extra_args = {
	--'--fields=+ailmnS',
	'--tag-relative=yes'
}

-- Settings for gitsigns.nvim
require('gitsigns').setup()

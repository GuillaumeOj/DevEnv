local g = vim.g

g.gutentags_enabled = true
g.gutentags_project_root = { '.git' }
g.gutentags_add_default_project_roots = false
g.gutentags_generate_on_missing = true
g.gutentags_generate_on_write = true
g.gutentags_generate_on_empty_buffer = true
g.gutentags_cache_dir = vim.fn.stdpath('cache') .. '/ctags'
g.gutentags_ctags_exclude = {
	'venv',
	'tools3d',
	'mesh-ui',
	'*.git', '*.svg', '*.hg',
	'build',
	'dist',
	'*sites/*/files/*',
	'bin',
	'node_modules',
	'*/migrations/',
	'__pycache__', 'venv',
	'bower_components',
	'cache',
	'compiled',
	'docs',
	'example',
	'bundle',
	'vendor',
	'*.md',
	'*-lock.json',
	'*.lock',
	'*bundle*.js',
	'*build*.js',
	'.*rc*',
	'*.json',
	'*.min.*',
	'*.map',
	'*.bak',
	'*.zip',
	'*.pyc',
	'*.class',
	'*.sln',
	'*.Master',
	'*.csproj',
	'*.tmp',
	'*.csproj.user',
	'*.cache',
	'*.pdb',
	'tags*',
	'cscope.*',
	'*.css',
	'*.less',
	'*.scss',
	'*.exe', '*.dll',
	'*.mp3', '*.ogg', '*.flac',
	'*.swp', '*.swo',
	'*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
	'*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
	'*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
	'*.pyc',
}
g.gutentags_ctags_extra_tags = {
	'--tag-relative=yes',
	'--fields=+ailmnS',
}

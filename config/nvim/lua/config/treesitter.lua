local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vim', 'python', 'html', 'vimdoc', 'tsx', 'typescript', 'yaml', 'sql', 'json', },
    sync_install = true,
  })
end

return M

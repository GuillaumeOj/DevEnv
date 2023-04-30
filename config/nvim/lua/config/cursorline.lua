local M = {}

function M.setup()
  require('nvim-cursorline').setup({
    cursorline = {
      enable = false,
    },
    cursorword = {
      enable = true,
      min_length = 2,
      h1 = {
        underline = true,
      },
    },
  })
end

return M

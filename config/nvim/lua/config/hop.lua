local utils = require('utils')
local map = utils.map
local M = {}

function M.setup()
  require('hop').setup()
  map('n', 's', '<cmd>HopWord<CR>')
end

return M

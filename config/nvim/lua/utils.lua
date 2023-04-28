local M = {}
local api = vim.api

function M.map(mode, lhs, rhs, extra_options)
  local default_options = { noremap = true, silent = true, nowait = false }
  options = vim.tbl_extend('keep', extra_options or {}, default_options)
  return api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.buf_map(buffnr, mode, lhs, rhs, extra_options)
  local default_options = { noremap = true, silent = true }
  options = vim.tbl_extend('keep', extra_options or {}, default_options)
  return api.nvim_buf_set_keymap(buffnbr, mode, lhs, rhs, options)
end

_G.guigui.utils = M

return M

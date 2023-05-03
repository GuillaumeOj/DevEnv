local M = {}
local api = vim.api
local notify = vim.notify
local log_levels = vim.log.levels

-- KeyMapping
function M.map(mode, lhs, rhs, extra_options)
	local default_options = { noremap = true, silent = true, nowait = false }
	local options = vim.tbl_extend('keep', extra_options or {}, default_options)
	return api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.buf_map(buffnr, mode, lhs, rhs, extra_options)
	local default_options = { noremap = true, silent = true }
	local options = vim.tbl_extend('keep', extra_options or {}, default_options)
	return api.nvim_buf_set_keymap(buffnr, mode, lhs, rhs, options)
end

-- Notifications
function M.error(message, name)
	notify(message, log_levels.ERROR, { title = name })
end

function M.info(message, name)
	notify(message, log_levels.INFO, { title = name })
end

function M.debug(message, name)
	notify(message, log_levels.DEBUG, { title = name })
end

_G.guigui.utils = M

return M

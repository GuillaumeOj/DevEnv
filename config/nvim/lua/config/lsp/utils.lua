local M = {}


function M.config_loader()
  local default_settings = {
    lua_ls = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
          },
        },
      },
    },
  }
  local project_settings = _G.guigui.lsp_project_settings or {}
  local config = vim.tbl_extend('keep', project_settings, default_settings)


  return config
end

_G.guigui.lsp = M

return M

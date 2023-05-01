local M = {}
local wich_key = require('which-key')

local function on_attach(client, bufnr)
  require('lsp-format').on_attach(client)
  local code_keymap = {
    l = {
      name = 'Code',
      r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
      a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostics' },
      i = { '<cmd>LspInfo<CR>', 'Lsp Info' },
    },
  }

  local goto_settings = {
    name = 'Goto',
    d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
    D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
    I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
  }

  code_keymap.l.g = goto_settings
  local goto_keymap = { g = goto_settings }

  wich_key.register(code_keymap, { buffer = bufnr, prefix = '<leader>' })
  wich_key.register(goto_keymap, { buffer = bufnr, prefix = '' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls' },
  })
  require('lsp-format').setup()

  require('mason-lspconfig').setup_handlers({
    function(server_name)
      require('lspconfig')[server_name].setup(
        {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      )
    end,
  })
end

return M

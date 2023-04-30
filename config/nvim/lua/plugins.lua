local o = vim.o
local cmd = vim.cmd
local fn = vim.fn

-- Bottstrap Lazy.nvim
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_settings = {
  ui = {
    border = 'rounded',
  }
}

local plugins = {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    lazy = false,
    config = function()
      require('config.telescope').setup()
    end
  },
  {
    'folke/which-key.nvim',
    lazy = false,
    config = function()
      o.timeout = true
      o.timeoutlen = 300
      require('config.whichkey').setup()
    end
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.pairs').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup()
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('bufferline').setup()
    end,

  },
  { 'ojroques/nvim-bufdel' },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('config.lsp').setup()
    end,
  },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
  },
  { 'hrsh7th/cmp-nvim-lsp', lazy = true, },
  { 'hrsh7th/cmp-buffer',   lazy = true, },
  { 'hrsh7th/cmp-path',     lazy = true, },
  { 'hrsh7th/cmp-cmdline',  lazy = true, },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
    event = { 'InsertEnter', 'CmdLineEnter' },
    config = function()
      require('config.cmp').setup()
    end,
  },
  { 'L3MON4D3/LuaSnip',         lazy = true },
  { 'saadparwaiz1/cmp_luasnip', lazy = true },
}

require('lazy').setup(plugins, lazy_settings)

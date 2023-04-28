-- Bottstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_settings = {
  ui = {
    border = "rounded",
  }
}

local plugins = {
  'wbthomason/packer.nvim',
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-fzf-native.nvim" },
    lazy = false,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("config.whichkey").setup {}
    end
  },
  {
    "echasnovski/mini.nvim",
    config = function ()
      require("mini.surround").setup()
      require("mini.pairs").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("bufferline").setup()
    end,

  },
  "ojroques/nvim-bufdel",
}

require('lazy').setup(plugins,lazy_settings)

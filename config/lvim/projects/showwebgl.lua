local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup {
  {
    command = "black",
    args = {
      "--config", "/Users/guillaume/dev/sketchfab/pyproject.toml",
    },
    filetype = {
      "python",
    }
  },
  {
    command = "isort",
    args = {
      "--settings", "/Users/guillaume/dev/sketchfab/pyproject.toml",
    },
    filetype = {
      "python",
    }
  }
}

lvim.format_on_save = true

local linters = require("lvim.lsp.null-ls.linters")

linters.setup {
  {
    command = "flake8",
    args = {
      "--config", "/Users/guillaume/dev/sketchfab/tox.ini",
    },
    filetype = {
      "python",
    }
  }
}

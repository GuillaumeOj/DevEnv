local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "black",
    {
      args = {
        "--config", "~/dev/emporium-fab/pyproject.toml",
      },
      filetype = { "python" }
    },
    {
      command = "isort",
      args = {
        "--settings-path", "~/dev/emporium-fab/pyproject.toml",
      },
      filetype = { "python" }
    }
  }
}
lvim.format_on_save = true

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "flake8",
    args = {
      "--config", "~/dev/emporium-fab/tox.ini",
    },
    filetype = { "python" }
  }
}

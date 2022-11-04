lvim.builtin.telescope.setup = {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  },
  defaults = {
    path_display = {
      shorten = { len = 10 }
    },
    file_ignore_patterns = {
      "%.git",
      "node_modules",
      "__pycache__",
    }
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
end

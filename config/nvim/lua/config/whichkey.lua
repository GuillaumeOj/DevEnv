local M = {}


function M.setup()
  local wk = require("which-key")

  local options = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }
  local mappings = {
    f = {
      name = "File",
      b = { "<cmd>Telescope buffers<CR>", "List open buffers" },
      f = { "<cmd>Telescope find_files<CR>", "Find file" },
      g = { "<cmd>Telescope git_files<CR>", "Find file within git dir" },
    },
    [ "w" ] = { "<cmd>w<CR>", "Save current buffer" },
    [ "q" ] = { "<cmd>q<CR>", "Close current window" },
    c = {
      name = "Configuration",
      r = { "<cmd>source %<CR>", "Reload current config file" },
    },
    b = {
      name = "Buffers",
      n = { "<cmd>BufferLineCycleNext<CR>", "Next" },
      p = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
      h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
      k = { "<cmd>BufferLineCloseRight<CR>", "Close all to the right" },
      c = { "<cmd>BufDel<CR>", "Close current buffer" },
    },
    g = {
      name = "Git",
      j = { "<cmd>Gitsigns next_hunk<CR>", "Next hunk" },
      k = { "<cmd>Gitsigns prev_hunk<CR>", "Previous hunk" },
      p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
      s = {
        name = "Stage",
        b = { "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer" },
        h = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
        u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo stage hunk" },
      },
      r = {
        name = "Reset",
        b = { "<cmd>Gitsigns reset_buffer<CR>", "Reset buffer" },
        h = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
      }
    },
    p = {
      name = "Plugins",
      i = { "<cmd>Lazy install<CR>", "Install" },
      s = { "<cmd>Lazy sync<CR>", "Sync" },
      S = { "<cmd>Lazy clear<CR>", "Status" },
      c = { "<cmd>Lazy clean<CR>", "Clean" },
      u = { "<cmd>Lazy update<CR>", "Update" },
      p = { "<cmd>Lazy profile<CR>", "Profile" },
    },
  }

  wk.register(mappings, options)
end

return M

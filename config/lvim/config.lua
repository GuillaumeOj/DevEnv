-- Load custom settings files here
require("plugins")
require("_gutentags")
require("_telescope")
require("_treestitter")
require("settings")
require("maps")

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.autopairs.active = false

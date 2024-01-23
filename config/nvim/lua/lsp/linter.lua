require("lint").linters_by_ft = {
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
}

local eslint = require("lint").linters.eslint
eslint.args = {
	"--no-ignore",
}

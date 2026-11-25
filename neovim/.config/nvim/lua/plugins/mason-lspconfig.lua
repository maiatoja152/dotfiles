return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- Find Mason packages using the :Mason command
		ensure_installed = require("config.lsp_server_list"),
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}

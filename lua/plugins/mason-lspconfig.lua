return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- Find Mason packages using the :Mason command
		ensure_installed = {
			"pyright",
			"ruff",
			"html",
			"cssls",
			"lua_ls",
			"yamlls",
			"docker_language_server",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}

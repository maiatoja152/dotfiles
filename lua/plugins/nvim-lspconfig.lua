return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },

	-- example using `opts` for defining servers
	-- opts = {
	-- 	servers = {
	-- 		lua_ls = {}
	-- 	}
	-- },
	-- config = function(_, opts)
	-- 	local lspconfig = require("lspconfig")
	-- 	for server, config in pairs(opts.servers) do
	-- 		-- passing config.capabilities to blink.cmp merges with the capabilities in your
	-- 		-- `opts[server].capabilities, if you"ve defined it
	-- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	-- 		lspconfig[server].setup(config)
	-- 	end
	-- end

	-- example calling setup directly for each LSP
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		for _, lsp_server in ipairs(require("config.lsp_server_list")) do
			vim.lsp.config(lsp_server, { capabilities = capabilities })
		end
	end
}

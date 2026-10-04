return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- nvim-treesitter supported languages: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
		require("nvim-treesitter").install({
			"lua",
			"python",
			"javascript",
			"html",
			"css",
			"htmldjango",
			"yaml",
		})
	end
}

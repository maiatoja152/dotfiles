return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install {
			"lua",
			"python",
			"javascript",
			"html",
			"css",
			"htmldjango",
		}
	end
}

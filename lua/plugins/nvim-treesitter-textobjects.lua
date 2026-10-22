return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
        vim.g.no_plugin_maps = true

        -- Or, disable per filetype (add as you like)
        -- vim.g.no_python_maps = true
        -- vim.g.no_ruby_maps = true
        -- vim.g.no_rust_maps = true
        -- vim.g.no_go_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup {
            select = {
                lookahead = true,
            }
        }

        -- Select
        vim.keymap.set({ "x", "o" }, "af", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@function.outer", "textobjects"
            )
            end,
            { desc = "Select around function" }
        )
        vim.keymap.set({ "x", "o" }, "if", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@function.inner", "textobjects"
            )
        	end,
			{ desc = "Select inner function" }
		)
        vim.keymap.set({ "x", "o" }, "ac", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@class.outer", "textobjects"
            )
        	end,
			{ desc = "Select around class" }
		)
        vim.keymap.set({ "x", "o" }, "ic", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@class.inner", "textobjects"
            )
        	end,
			{ desc = "Select inner class" }
		)
        vim.keymap.set({ "x", "o" }, "al", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@loop.outer", "textobjects"
            )
        	end,
			{ desc = "Select around loop" }
		)
        vim.keymap.set({ "x", "o" }, "il", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@loop.inner", "textobjects"
            )
        	end,
			{ desc = "Select inner loop" }
		)
        vim.keymap.set({ "x", "o" }, "ak", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@block.outer", "textobjects"
            )
        	end,
			{ desc = "Select around block" }
		)
        vim.keymap.set({ "x", "o" }, "ik", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@block.inner", "textobjects"
            )
        	end,
			{ desc = "Select inner block" }
		)
        vim.keymap.set({ "x", "o" }, "ai", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@parameter.outer", "textobjects"
            )
        	end,
			{ desc = "Select around parameter (input)" }
		)
        vim.keymap.set({ "x", "o" }, "ii", function()
            require "nvim-treesitter-textobjects.select".select_textobject(
                "@parameter.inner", "textobjects"
            )
        	end,
			{ desc = "Select inner parameter (input)" }
		)
    end,
}

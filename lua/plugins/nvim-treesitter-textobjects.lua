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
            select = { lookahead = true },
            move = { set_jumps = true },
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

        -- Swap
        vim.keymap.set("n", "<leader>ef", function()
            require("nvim-treesitter-textobjects.swap").swap_next "@function.outer"
            end,
            { desc = "Swap function with the next function" }
        )
        vim.keymap.set("n", "<leader>eF", function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@function.outer"
            end,
            { desc = "Swap function with the previous function" }
        )
        vim.keymap.set("n", "<leader>ec", function()
            require("nvim-treesitter-textobjects.swap").swap_next "@class.outer"
            end,
            { desc = "Swap class with the next class" }
        )
        vim.keymap.set("n", "<leader>eC", function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@class.outer"
            end,
            { desc = "Swap class with the previous class" }
        )
        vim.keymap.set("n", "<leader>ei", function()
            require("nvim-treesitter-textobjects.swap").swap_next "@parameter.outer"
            end,
            { desc = "Swap parameter with the next parameter" }
        )
        vim.keymap.set("n", "<leader>eI", function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
            end,
            { desc = "Swap parameter with the previous parameter" }
        )
    end,
}

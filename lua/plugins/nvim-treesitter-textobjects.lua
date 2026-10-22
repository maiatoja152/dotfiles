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
        local ts_select = require "nvim-treesitter-textobjects.select"
        vim.keymap.set({ "x", "o" }, "af", function()
            ts_select.select_textobject("@function.outer", "textobjects")
            end,
            { desc = "Select around function" }
        )
        vim.keymap.set({ "x", "o" }, "if", function()
            ts_select.select_textobject("@function.inner", "textobjects")
        	end,
			{ desc = "Select inner function" }
		)
        vim.keymap.set({ "x", "o" }, "ac", function()
            ts_select.select_textobject("@class.outer", "textobjects")
        	end,
			{ desc = "Select around class" }
		)
        vim.keymap.set({ "x", "o" }, "ic", function()
            ts_select.select_textobject("@class.inner", "textobjects")
        	end,
			{ desc = "Select inner class" }
		)
        vim.keymap.set({ "x", "o" }, "al", function()
            ts_select.select_textobject("@loop.outer", "textobjects")
        	end,
			{ desc = "Select around loop" }
		)
        vim.keymap.set({ "x", "o" }, "il", function()
            ts_select.select_textobject("@loop.inner", "textobjects")
        	end,
			{ desc = "Select inner loop" }
		)
        vim.keymap.set({ "x", "o" }, "ak", function()
            ts_select.select_textobject("@block.outer", "textobjects")
        	end,
			{ desc = "Select around block" }
		)
        vim.keymap.set({ "x", "o" }, "ik", function()
            ts_select.select_textobject("@block.inner", "textobjects")
        	end,
			{ desc = "Select inner block" }
		)
        vim.keymap.set({ "x", "o" }, "ai", function()
            ts_select.select_textobject("@parameter.outer", "textobjects")
        	end,
			{ desc = "Select around parameter (input)" }
		)
        vim.keymap.set({ "x", "o" }, "ii", function()
            ts_select.select_textobject("@parameter.inner", "textobjects")
        	end,
			{ desc = "Select inner parameter (input)" }
		)

        -- Swap
        local ts_swap = require "nvim-treesitter-textobjects.swap"
        vim.keymap.set("n", "<leader>ef", function()
            ts_swap.swap_next "@function.outer"
            end,
            { desc = "Swap function with the next function" }
        )
        vim.keymap.set("n", "<leader>eF", function()
            ts_swap.swap_previous "@function.outer"
            end,
            { desc = "Swap function with the previous function" }
        )
        vim.keymap.set("n", "<leader>ec", function()
            ts_swap.swap_next "@class.outer"
            end,
            { desc = "Swap class with the next class" }
        )
        vim.keymap.set("n", "<leader>eC", function()
            ts_swap.swap_previous "@class.outer"
            end,
            { desc = "Swap class with the previous class" }
        )
        vim.keymap.set("n", "<leader>ei", function()
            ts_swap.swap_next "@parameter.outer"
            end,
            { desc = "Swap parameter with the next parameter" }
        )
        vim.keymap.set("n", "<leader>eI", function()
            ts_swap.swap_previous "@parameter.outer"
            end,
            { desc = "Swap parameter with the previous parameter" }
        )

        -- Move
        local ts_move = require "nvim-treesitter-textobjects.move"
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
            ts_move.goto_next_start("@function.outer", "textobjects")
            end,
            { desc = "Move to next function" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]c", function()
            ts_move.goto_next_start("@class.outer", "textobjects")
            end,
            { desc = "Move to next class" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]l", function()
            ts_move.goto_next_start("@loop.outer", "textobjects")
            end,
            { desc = "Move to next loop" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]k", function()
            ts_move.goto_next_start("@block.outer", "textobjects")
            end,
            { desc = "Move to next block" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            ts_move.goto_previous_start("@function.outer", "textobjects")
            end,
            { desc = "Move to previous function" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[c", function()
            ts_move.goto_previous_start("@class.outer", "textobjects")
            end,
            { desc = "Move to previous class" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[l", function()
            ts_move.goto_previous_start("@loop.outer", "textobjects")
            end,
            { desc = "Move to previous loop" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[k", function()
            ts_move.goto_previous_start("@block.outer", "textobjects")
            end,
            { desc = "Move to previous block" }
        )
        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    end,
}

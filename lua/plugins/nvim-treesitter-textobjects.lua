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
        vim.keymap.set({ "x", "o" }, "am", function()
            ts_select.select_textobject("@function.outer", "textobjects")
            end,
            { desc = "Select around function" }
        )
        vim.keymap.set({ "x", "o" }, "im", function()
            ts_select.select_textobject("@function.inner", "textobjects")
        	end,
			{ desc = "Select inner function" }
		)
        vim.keymap.set({ "x", "o" }, "af", function()
            ts_select.select_textobject("@call.outer", "textobjects")
            end,
            { desc = "Select around function call" }
        )
        vim.keymap.set({ "x", "o" }, "if", function()
            ts_select.select_textobject("@call.inner", "textobjects")
            end,
            { desc = "Select inner function call" }
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
        vim.keymap.set({ "x", "o" }, "ao", function()
            ts_select.select_textobject("@loop.outer", "textobjects")
        	end,
			{ desc = "Select around loop" }
		)
        vim.keymap.set({ "x", "o" }, "io", function()
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
        vim.keymap.set({ "x", "o" }, "aa", function()
            ts_select.select_textobject("@assignment.outer", "textobjects")
        	end,
			{ desc = "Select around assignment" }
		)
        vim.keymap.set({ "x", "o" }, "iaa", function()
            ts_select.select_textobject("@assignment.inner", "textobjects")
        	end,
			{ desc = "Select inner assignment" }
		)
        vim.keymap.set({ "x", "o" }, "ial", function()
            ts_select.select_textobject("@assignment.lhs", "textobjects")
        	end,
			{ desc = "Select assignment left-hand side (LHS)" }
		)
        vim.keymap.set({ "x", "o" }, "iar", function()
            ts_select.select_textobject("@assignment.rhs", "textobjects")
        	end,
			{ desc = "Select assignment right-hand side (RHS)" }
		)
        vim.keymap.set({ "x", "o" }, "agc", function()
            ts_select.select_textobject("@comment.outer", "textobjects")
        	end,
			{ desc = "Select arround comment" }
		)
        vim.keymap.set({ "x", "o" }, "igc", function()
            ts_select.select_textobject("@comment.inner", "textobjects")
        	end,
			{ desc = "Select inner comment" }
		)

        -- Swap
        local ts_swap = require "nvim-treesitter-textobjects.swap"
        vim.keymap.set("n", "<leader>em", function()
            ts_swap.swap_next "@function.outer"
            end,
            { desc = "Swap function with the next function" }
        )
        vim.keymap.set("n", "<leader>eM", function()
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
        vim.keymap.set("n", "<leader>ea", function()
            ts_swap.swap_next "@assignment.outer"
            end,
            { desc = "Swap assignment with the next assignment" }
        )
        vim.keymap.set("n", "<leader>eA", function()
            ts_swap.swap_previous "@assignment.outer"
            end,
            { desc = "Swap assignment with the previous assignment" }
        )

        -- Move
        local ts_move = require "nvim-treesitter-textobjects.move"
        vim.keymap.set({ "n", "x", "o" }, "]m", function()
            ts_move.goto_next_start("@function.outer", "textobjects")
            end,
            { desc = "Move to next function" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
            ts_move.goto_next_start("@call.outer", "textobjects")
            end,
            { desc = "Move to next function call" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]c", function()
            ts_move.goto_next_start("@class.outer", "textobjects")
            end,
            { desc = "Move to next class" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]o", function()
            ts_move.goto_next_start("@loop.outer", "textobjects")
            end,
            { desc = "Move to next loop" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]k", function()
            ts_move.goto_next_start("@block.outer", "textobjects")
            end,
            { desc = "Move to next block" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]aa", function()
            ts_move.goto_next_start("@assignment.outer", "textobjects")
            end,
            { desc = "Move to next assignment" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]al", function()
            ts_move.goto_next_start("@assignment.lhs", "textobjects")
            end,
            { desc = "Move to next assignment LHS" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]ar", function()
            ts_move.goto_next_start("@assignment.rhs", "textobjects")
            end,
            { desc = "Move to next assignment RHS" }
        )
        vim.keymap.set({ "n", "x", "o" }, "]gc", function()
            ts_move.goto_next_start("@comment.outer", "textobjects")
            end,
            { desc = "Move to next comment" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[m", function()
            ts_move.goto_previous_start("@function.outer", "textobjects")
            end,
            { desc = "Move to previous function" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            ts_move.goto_previous_start("@call.outer", "textobjects")
            end,
            { desc = "Move to previous function call" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[c", function()
            ts_move.goto_previous_start("@class.outer", "textobjects")
            end,
            { desc = "Move to previous class" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[o", function()
            ts_move.goto_previous_start("@loop.outer", "textobjects")
            end,
            { desc = "Move to previous loop" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[k", function()
            ts_move.goto_previous_start("@block.outer", "textobjects")
            end,
            { desc = "Move to previous block" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[aa", function()
            ts_move.goto_previous_start("@assignment.outer", "textobjects")
            end,
            { desc = "Move to previous assignment" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[al", function()
            ts_move.goto_previous_start("@assignment.lhs", "textobjects")
            end,
            { desc = "Move to previous assignment LHS" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[ar", function()
            ts_move.goto_previous_start("@assignment.rhs", "textobjects")
            end,
            { desc = "Move to previous assignment RHS" }
        )
        vim.keymap.set({ "n", "x", "o" }, "[gc", function()
            ts_move.goto_previous_start("@comment.outer", "textobjects")
            end,
            { desc = "Move to previous comment" }
        )
        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    end,
}

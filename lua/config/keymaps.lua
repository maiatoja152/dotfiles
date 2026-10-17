vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Write and quit
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>W", "<cmd>wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>vsplit | term<CR>", { desc = "Split and open terminal" })

-- Windows
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { desc = "Split window" })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move up a window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move down a window" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move left a window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move right a window" })

-- LSP
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Surround (normal mode)
vim.keymap.set("n", "<leader>S\"", "ciw\"\"<Esc>P", { desc = "Wrap word in double quotes" })
vim.keymap.set("n", "<leader>S'", "ciw''<Esc>P", { desc = "Wrap word in single quotes" })
vim.keymap.set("n", "<leader>S(", "ciw()<Esc>P", { desc = "Wrap word in parentheses" })
vim.keymap.set("n", "<leader>S[", "ciw[]<Esc>P", { desc = "Wrap word in square brackets" })
vim.keymap.set("n", "<leader>S<", "ciw<><Esc>P", { desc = "Wrap word in angle brackets" })
vim.keymap.set("n", "<leader>S{", "ciw{}<Esc>P", { desc = "Wrap word in curly braces" })

-- Surround (visual mode)
vim.keymap.set("v", "<leader>S\"", "c\"\"<Esc>P", { desc = "Wrap selection in double quotes" })
vim.keymap.set("v", "<leader>S'", "c''<Esc>P", { desc = "Wrap selection in single quotes" })
vim.keymap.set("v", "<leader>S(", "c()<Esc>P", { desc = "Wrap selection in parentheses" })
vim.keymap.set("v", "<leader>S[", "c[]<Esc>P", { desc = "Wrap selection in square brackets" })
vim.keymap.set("v", "<leader>S<", "c<><Esc>P", { desc = "Wrap selection in angle brackets" })
vim.keymap.set("v", "<leader>S{", "c{}<Esc>P", { desc = "Wrap selection in curly braces" })

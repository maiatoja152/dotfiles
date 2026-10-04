vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>W", "<cmd>wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>t", "<cmd>vsplit | term<CR>", { desc = "Split and open terminal" })

vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { desc = "Split window" })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move up a window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move down a window" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move left a window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move right a window" })

vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Go to definition" })

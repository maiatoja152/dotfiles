require("config.options")
require("config.keymaps")
require("config.lazy")

-- Enable treesitter syntax highlighting on all files
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.cmd("colorscheme catppuccin")

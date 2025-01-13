-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Treesitter folding can cause performance issues
-- Should be fixed with neovim 0.11.0
--  See https://github.com/LazyVim/LazyVim/issues/1581
vim.g.foldexpression = "manual"

vim.g.snacks_animate = false

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"

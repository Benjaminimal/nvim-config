-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Don't break long lines automatically
vim.opt.formatoptions:remove("t")
-- Don't continue comments with o
vim.opt.formatoptions:remove("o")

vim.g.editorconfig = true

vim.g.snacks_animate = false

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"

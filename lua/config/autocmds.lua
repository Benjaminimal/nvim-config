-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    -- Don't break long lines automatically "t"
    -- Don't continue comments with o "o"
    vim.opt.formatoptions = "jcrqln"
  end,
})

-- Clear register 's' to avoid unintended macro execution
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.setreg("s", "")
  end,
})

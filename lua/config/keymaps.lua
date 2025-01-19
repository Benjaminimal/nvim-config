-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- center search results
map("n", "n", "nzz", { desc = "Next search result" })
map("n", "N", "Nzz", { desc = "Previous search result" })

map("n", "[l", vim.cmd.lprev, { desc = "Previous Loclist Item" })
map("n", "]l", vim.cmd.lnext, { desc = "Next Loclist Item" })

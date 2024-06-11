-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<C-\\>", ":vsplit<CR>")
vim.keymap.set("n", "<C-t>", ":tabnew %<CR>")
vim.keymap.set("n", "<C-q>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-e>", ":tabnext<CR>")

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

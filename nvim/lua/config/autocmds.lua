-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--

vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    vim.cmd("set nowrap")
    vim.cmd("set nonumber norelativenumber")
  end,
})

vim.api.nvim_create_autocmd({ "SwapExists" }, {
  callback = function()
    vim.cmd("let v:swapchoice = 'e'")
  end,
})

-- autocmd SwapExists * let v:swapchoice = "e"

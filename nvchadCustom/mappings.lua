---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-\\>"] = { ":vsplit<CR>", "vertical split" },
    ["<C-w>"] = { ":q<CR>", "close window" },
    ["<C-p>"] = { "<cmd> Telescope find_files<CR>", "find files" },
    ["<C-g>"] = { "<cmd> Telescope live_grep<CR>", "live grep" },
    ["<C-t>"] = { ":tabnew %<CR>", "new tab from buffer" },
    ["<C-q>"] = { ":tabprevious<CR>", "previous tab" },
    ["<C-e>"] = { ":tabnext<CR>", "next tab" },
  },
  v = {
    ["<"] = { "<gv", "indent left" },
    [">"] = { ">gv", "indent right" },
  },
}

-- more keybinds!

return M

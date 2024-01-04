local M = {}

M.disabled = {
  n = {
    ["<C-c>"] = "",
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

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
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover documentation" },
    ["gl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
  },
  i = {},
  v = {
    ["<"] = { "<gv", "indent left" },
    [">"] = { ">gv", "indent right" },
  },
}
return M

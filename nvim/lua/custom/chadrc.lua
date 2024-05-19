---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "spoonktheme",
  statusline = {
    theme = "vscode_colored",
  },
  nvdash = {
    load_on_startup = true,
  },
  telescope = { style = "bordered" }, -- borderless / bordered
  hl_override = {
    NvimTreeNormal = { bg = "#25273A" },
    NvimTreeNormalNC = { bg = "#25273A" },
    CursorLine = {

      bg = "#363a4f",
    },
  },

  cmp = {
    icons = true,
    lspkind_text = false,
    style = "default",            -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  hl_add = {
    HoverBorder = {
      fg = "grey",
      bg = "black",
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    vim.cmd "set nowrap"
    vim.cmd "set nonumber"
  end,
})

return M

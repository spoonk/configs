---@type ChadrcConfig
local M = {}
M.ui = { theme = 'aquarium', 
  statusline = {
    theme="vscode_colored",
  },
  nvdash = {
    load_on_startup = true
  },
  telescope = { style = "bordered" }, -- borderless / bordered


}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

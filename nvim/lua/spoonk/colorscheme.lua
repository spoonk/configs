local colorscheme = "catppuccin-macchiato"
--[[ local colorscheme = "embark" ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end



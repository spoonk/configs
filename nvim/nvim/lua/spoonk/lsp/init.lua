local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "spoonk.lsp.mason"
require("spoonk.lsp.handlers").setup()
require "spoonk.lsp.null-ls"

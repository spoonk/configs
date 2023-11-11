local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "graphql",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
    cli_options = {
      arrow_parens = "always",
      bracket_spacing = true,
      bracket_same_line = true,
      embedded_language_formatting = "auto",
      end_of_line = "lf",
      html_whitespace_sensitivity = "css",
      -- jsx_bracket_same_line = false,
      jsx_single_quote = true,
      print_width = 80,
      prose_wrap = "preserve",
      quote_props = "as-needed",
      semi = true,
      single_attribute_per_line = false,
      single_quote = true,
      tab_width = 2,
      trailing_comma = "es5",
      use_tabs = false,
      vue_indent_script_and_style = false,
    },
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = async }
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method "textDocument/rangeFormatting" then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
}

return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp_window = require("cmp.config.window")
    opts.window = {
      completion = cmp_window.bordered(),
      documentation = cmp_window.bordered(),
    }

    opts.formatting = {
      -- format = require("lspkind").cmp_format(),
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local cmp_kinds = {
          Text = " ",
          Method = " ",
          Function = " ",
          Constructor = " ",
          Field = " ",
          Variable = " ",
          Class = " ",
          Interface = " ",
          Module = " ",
          Property = " ",
          Unit = " ",
          Value = " ",
          Enum = " ",
          Keyword = " ",
          Snippet = " ",
          Color = " ",
          File = " ",
          Reference = " ",
          Folder = " ",
          EnumMember = " ",
          Constant = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        }

        vim_item.kind = (cmp_kinds[vim_item.kind] or "") -- .. vim_item.kind
        return vim_item

        -- if vim.tbl_contains({ "path" }, entry.source.name) then
        --   local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
        --   if icon then
        --     vim_item.kind = icon
        --     vim_item.kind_hl_group = hl_group
        --     return vim_item
        --   end
        -- end
        -- return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
      end,
    }

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}

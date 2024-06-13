return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<C-p>", LazyVim.pick(), desc = "Find Files" },
      {
        "<leader>th",
        LazyVim.pick("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with Preview",
      },
      {
        "<C-g>",
        LazyVim.pick("live_grep"),
        desc = "live grep",
      },
    }
  end,
}

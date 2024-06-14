return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "target",
      },
    },
  },
  keys = function()
    return {
      -- for some reason this would cause selecting a file to change
      -- the apparent cwd, leading to files being ignored by telescope
      -- { "<C-p>", LazyVim.pick(), desc = "Find Files" },
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" }, -- glad this is back to working
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

return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>th", LazyVim.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
    }
  end,
}

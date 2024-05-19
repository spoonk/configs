local plugins = {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "spoonk/lspsaga.nvim",
    lazy = false,
    config = function()
      require("lspsaga").setup {
        border_style = "round",
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "stylua",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "rust-analyzer",
        "jdtls",
        "google-java-format",
        "clangd",
        "clang-format",
        "lua-language-server",
        "isort",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
    config = function()
      vim.opt.statusline = ""
    end,
  },
  {
    "spoonk/base46",
    branch = "v2.0",
    lazy = false,
    config = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/twilight.nvim",
    lazy = false,
  },
  {
    "heavenshell/vim-jsdoc",
    lazy = false,
  },
  {
    "echasnovski/mini.animate",
    lazy = false,
    config = function(_, opts)
      -- require("mini.animate").setup()
    end,
  },
  -- require "custom.configs.lsp-inlayhints",
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "klen/nvim-test",
    lazy = false,
    config = function()
      require("nvim-test").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
          },
        },
      }
    end,
  },
}

return plugins

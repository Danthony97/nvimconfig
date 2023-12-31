-- In order to modify the `lspconfig` configuration:
local plugins = {
  { 'EtiamNullam/deferred-clipboard.nvim', lazy = false},
  { 'MunifTanjim/nui.nvim', lazy = false },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "pyright",
        "mypy",
        "ruff",
        "ansible-language-server",
        "ansible-lint",
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
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "alec-gibson/nvim-tetris", lazy = false },
  {
  'alanfortlink/blackjack.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  lazy = false,
  },
}

return plugins

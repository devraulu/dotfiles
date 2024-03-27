local utils = require "astronvim.utils"

return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart") end,
    },
  },
  config = true,
}

return {
  { "rcarriga/nvim-notify", enabled = false },
  {
    "j-hui/fidget.nvim",
    config = function()
      local fidget = require "fidget"
      vim.notify = fidget.notify
      fidget.setup {

        notification = {
          window = {
            winblend = 0,
          },
        },
      }
    end,
  },
}

vim.keymap.set('n', '<leader>qr', [[<cmd>lua require("persistence").load()<cr>]], { desc = '[R]estore last session' })

-- restore the last session
vim.keymap.set('n', '<leader>ql', [[<cmd>lua require("persistence").load({ last = true })<cr>]], { desc = '[L]oad last session' })

-- stop Persistence => session won't be saved on exit
vim.keymap.set('n', '<leader>qf', [[<cmd>lua require("persistence").stop()<cr>]], { desc = "[D]on't persist session" })

return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
}

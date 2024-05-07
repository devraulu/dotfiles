return {
  'sindrets/diffview.nvim',
  name = 'diffview',
  config = function()
    require('diffview').setup {}
    vim.keymap.set('n', '<leader>gdo', '<cmd>DiffviewOpen<CR>', { desc = '[D]iffview [O]pen' })
    vim.keymap.set('n', '<leader>gdc', '<cmd>DiffviewClose<CR>', { desc = '[D]iffview [C]lose' })
  end,
}

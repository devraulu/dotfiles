return {
  'sindrets/diffview.nvim',
  name = 'diffview',
  config = function()
    require('diffview').setup {}
    vim.keymap.set('n', '<leader>god', '<cmd>DiffviewOpen<CR>', { desc = '[D]iffview [O]pen' })
  end,
}

return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set('n', '<leader>tt', ':FloatermToggle<CR>', { desc = 'Toggle terminal' })
    vim.keymap.set('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle terminal' })
    vim.keymap.set('n', '<leader>ta', ':FloatermNew<CR>', { desc = 'New terminal' })
    vim.keymap.set('n', '<leader>tn', ':FloatermNext<CR>', { desc = 'Next terminal' })
    vim.keymap.set('n', '<leader>tp', ':FloatermPrev<CR>', { desc = 'Previous terminal' })
    vim.keymap.set('n', '<leader>tk', ':FloatermKill<CR>', { desc = 'Kill terminal' })
  end,
}

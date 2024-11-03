vim.keymap.set('n', '<leader>fe', ':Oil<CR>', { desc = '[F]ile [e]xplorer', silent = true })

return {
  'stevearc/oil.nvim',
  opts = { view_options = { show_hidden = false } },
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
}

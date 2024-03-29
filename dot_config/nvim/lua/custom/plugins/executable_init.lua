-- Relative numbers for focused editor and static for unfocused ones

vim.opt.relativenumber = true

vim.cmd 'augroup numbertoggle'
vim.cmd 'autocmd!'

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  callback = function()
    if vim.o.number and vim.api.nvim_get_mode().mode ~= 'i' then
      vim.o.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  pattern = '*',
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end,
})

vim.cmd 'augroup END'
--
--

-- Quit keymaps
vim.keymap.set('n', '<space>qq', '<cmd>qall!<CR>', { desc = '[Q]uit all' })
vim.keymap.set('n', '<space>qs', '<cmd>conf xall<CR>', { desc = 'Confirm [save] and [q]uit' })

require('ibl').setup {}

return {
  { 'lambdalisue/suda.vim' },

  -- Discord Rich Presence
  -- { 'andweeb/presence.nvim', lazy = false, event = 'VeryLazy', opts = { client_id = '1009122352916857003' } },
  -- { 'tpope/vim-surround' },
  {
    'itchyny/lightline.vim',
    config = function()
      -- vim.o.laststatus = 2
    end,
  },
  -- { 'm4xshen/autoclose.nvim', opts = {} },
  -- { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = {}, opts = { filters = {} } },

  { import = 'custom.plugins.themes.plugins' },
}

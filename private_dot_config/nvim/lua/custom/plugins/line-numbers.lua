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

return {}

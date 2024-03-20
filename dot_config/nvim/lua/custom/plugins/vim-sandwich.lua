return {
  'machakann/vim-sandwich',
  init = function()
    -- require('sandwich-vim').setup()
    vim.g.sandwich_no_default_key_mappings = 1
    --   vim.cmd [[nmap za <Plug>(sandwich-add)]]
    --   vim.cmd [[xmap za <Plug>(sandwich-add)]]
    --   vim.cmd [[omap za <Plug>(sandwich-add)]]
    --   vim.cmd [[nmap zd <Plug>(sandwich-delete)]]
    --   vim.cmd [[xmap zd <Plug>(sandwich-delete)]]
    --   vim.cmd [[nmap zdb <Plug>(sandwich-delete-auto)]]
    --   vim.cmd [[nmap zr <Plug>(sandwich-replace)]]
    --   vim.cmd [[xmap zr <Plug>(sandwich-replace)]]
    --   vim.cmd [[nmap zrb <Plug>(sandwich-replace-auto)]]
    vim.keymap.set('n', 'za', '<Plug>(sandwich-add)', { desc = 'add sandwich' })
    vim.keymap.set('x', 'za', '<Plug>(sandwich-add)', { desc = 'add sandwich' })
    vim.keymap.set('o', 'za', '<Plug>(sandwich-add)', { desc = 'add sandwich' })
    vim.keymap.set('n', 'zd', '<Plug>(sandwich-delete)', { desc = 'delete sandwich' })
    vim.keymap.set('x', 'zd', '<Plug>(sandwich-delete)', { desc = 'delete sandwich' })
    vim.keymap.set('n', 'zdb', '<Plug>(sandwich-delete-auto)', { desc = 'delete auto sandwich' })
    vim.keymap.set('n', 'zr', '<Plug>(sandwich-replace)', { desc = 'replace sandwich' })
    vim.keymap.set('x', 'zr', '<Plug>(sandwich-replace)', { desc = 'replace sandwich' })
    vim.keymap.set('n', 'zrb', '<Plug>(sandwich-replace-auto)', { desc = 'replace auto sandwich' })
  end,
}

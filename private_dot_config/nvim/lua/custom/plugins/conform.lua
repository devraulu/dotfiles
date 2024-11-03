return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {},
  config = function(_, opts)
    local conform = require 'conform'
    conform.setup {
      notify_on_error = false,
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        scss = { { 'prettierd', 'prettier' } },
        sass = { { 'prettierd', 'prettier' } },
        astro = { { 'prettierd', 'prettier' } },
        json = { 'prettierd' },
        rust = { 'rustfmt' },
        yaml = { 'yamlfix' },
        toml = { 'taplo' },
        sql = { 'sql_formatter' },
      },
    }

    vim.api.nvim_create_user_command('Format', function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ['end'] = { args.line2, end_line:len() },
        }
      end
      require('conform').format { async = true, lsp_fallback = true, range = range }
    end, { range = true })

    -- vim.keymap.set('v', '<leader>cf', conform.format, { desc = '[F]ormat selection' })
    -- vim.keymap.set('n', '<leader>cf', conform.format, { desc = '[F]ormat file' })
    vim.keymap.set('n', '<leader>cf', '<cmd>Format<CR>', { desc = '[F]ormat file' })
    vim.keymap.set('v', '<leader>cf', '<cmd>Format<CR>', { desc = '[F]ormat selection' })
  end,
}

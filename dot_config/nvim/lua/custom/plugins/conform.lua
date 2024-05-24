return { -- Autoformat
  'stevearc/conform.nvim',
  name = 'conform',
  opts = {
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
      css = { { 'prettied', 'prettier' } },
      astro = { { 'prettierd', 'prettier' } },
    },
  },
  config = function(_, opts)
    local conform = require 'conform'
    conform.setup(opts)

    vim.keymap.set('v', '<leader>cf', conform.format, { desc = '[F]ormat selection' })
    vim.keymap.set('n', '<leader>cf', conform.format, { desc = '[F]ormat file' })
  end,
}

return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        ignore_file_types = { rs = true },
        keymaps = {
          accept_suggestion = '<Tab>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        disable_inline_completion = true,
      }
    end,
  },
}

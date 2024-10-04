return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('lualine').setup {
      options = {

        icons_enabled = true,
        theme = 'auto',
      },
      extensions = {
        'fzf',
        'oil',
        'fugitive',
        'lazy',
        'mason',
        'man',
        'nvim-dap-ui',
      },
    }
  end,
}

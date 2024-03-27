return {
  { 'ellisonleao/gruvbox.nvim' },

  { 'catppuccin/nvim' },
  { 'dracula/vim', as = 'dracula' },
  { 'projekt0n/github-nvim-theme' },
  { 'marko-cerovac/material.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
  { 'edeneast/nightfox.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'folke/tokyonight.nvim' },
  {
    'talha-akram/noctis.nvim',
    config = function()
      -- vim.cmd.colorscheme 'noctis'
    end,
  },
  { 'catppuccin/nvim' },
  { 'mofiqul/dracula.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'hardhackerlabs/theme-vim' },
  { 'marko-cerovac/material.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
  { 'edeneast/nightfox.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'folke/tokyonight.nvim' },
  {
    'talha-akram/noctis.nvim',
    config = function()
      -- vim.cmd [[set background=light]]
      -- vim.cmd.colorscheme 'noctis'
    end,
  },
  {
    'ribru17/bamboo.nvim',
    config = function()
      local bamboo = require 'bamboo'
      bamboo.setup {
        term_colors = true,
        transparent = true,
      }
      bamboo.load()
      vim.cmd.colorscheme 'bamboo'
    end,
  },
}

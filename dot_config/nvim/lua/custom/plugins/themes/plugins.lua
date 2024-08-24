return {
  --
  -- --
  -- {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true, styles = { variables = 'italic' } },
        leap = true,
        indent_blankline = { enabled = true },
      },
    }
    vim.cmd [[colorscheme catppuccin]]
    vim.g.lightline = { colorscheme = 'catppuccin' }
  end,
  -- },
  -- -- { 'dracula/vim', as = 'dracula' },
  -- -- { 'projekt0n/github-nvim-theme' },
  -- -- { 'marko-cerovac/material.nvim' },
  -- -- { 'loctvl842/monokai-pro.nvim' },
  -- -- { 'edeneast/nightfox.nvim' },
  -- -- { 'navarasu/onedark.nvim' },
  -- {
  --   'romainl/Apprentice',
  --   config = function()
  --     vim.cmd [[colorscheme apprentice]]
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   as = 'tokyonight',
  --   config = function()
  --     require('tokyonight').setup { transparent = true, style = 'moon', light_style = 'night', comments = { italic = false }, lualine_bold = true }
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  -- -- { 'catppuccin/nvim' },
  -- -- { 'mofiqul/dracula.nvim' },
  -- -- { 'projekt0n/github-nvim-theme' },
  -- -- { 'ellisonleao/gruvbox.nvim' },
  -- --
  -- -- { 'marko-cerovac/material.nvim' },
  -- -- { 'loctvl842/monokai-pro.nvim' },
  -- -- { 'edeneast/nightfox.nvim' },
  -- -- { 'navarasu/onedark.nvim' },
  -- -- { 'folke/tokyonight.nvim' },
  -- -- {
  -- --   'talha-akram/noctis.nvim',
  -- --   config = function()
  -- --     -- vim.cmd [[set background=light]]
  -- --     -- vim.cmd.colorscheme 'noctis'
  -- --   end,
  -- -- },
  -- {
  --   'ribru17/bamboo.nvim',
  --   config = function()
  --     local bamboo = require 'bamboo'
  --     bamboo.setup {
  --       term_colors = true,
  --       transparent = true,
  --     }
  --     bamboo.load()
  --     vim.cmd.colorscheme 'bamboo'
  --   end,
  -- },
  -- {
  --   'hardhackerlabs/theme-vim',
  --   name = 'hardhacker',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.hardhacker_hide_tilde = 1
  --     vim.g.hardhacker_keyword_italic = 1
  --     -- custom highlights
  --     -- vim.g.hardhacker_custom_highlights = {}
  --     vim.cmd 'colorscheme hardhacker'
  --   end,
  -- },
  --
  -- {
  --   'jaredgorski/SpaceCamp',
  --   config = function()
  --     vim.cmd.colorscheme 'SpaceCamp'
  --   end,
  -- },
  -- {
  --   'sainnhe/sonokai',
  --   config = function()
  --     vim.g.sonokai_style = 'shusia'
  --     vim.g.sonokai_better_performance = 1
  --     vim.g.sonokai_transparent_background = 2
  --     vim.cmd.colorscheme 'sonokai'
  --   end,
  -- },
  -- {
  --   'ajmwagar/vim-deus',
  --   config = function()
  --     vim.cmd [[colorscheme deus]]
  --   end,
  -- },
  -- {
  --   'whatyouhide/vim-gotham',
  --   config = function()
  --     vim.cmd [[colorscheme gotham]]
  --   end,
  -- },
  -- {
  --   'craftzdog/solarized-osaka.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('solarized-osaka').setup { transparent = true }
  --     vim.cmd [[colorscheme solarized-osaka]]
  --   end,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   config = function()
  --     require('kanagawa').setup {
  --       -- compile = false, -- enable compiling the colorscheme
  --       -- undercurl = true, -- enable undercurls
  --       -- commentStyle = { italic = true },
  --       -- functionStyle = {},
  --       -- keywordStyle = { italic = true },
  --       -- statementStyle = { bold = true },
  --       -- typeStyle = {},
  --       -- transparent = false, -- do not set background color
  --       -- dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  --       -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
  --       -- colors = { -- add/modify theme and palette colors
  --       -- palette = {},
  --       -- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  --       -- },
  --       -- overrides = function(colors) -- add/modify highlights
  --       --   return {}
  --       -- end,
  --       -- theme = 'wave', -- Load "wave" theme when 'background' option is not set
  --       -- background = { -- map the value of 'background' option to a theme
  --       --   dark = 'wave', -- try "dragon" !
  --       --   light = 'lotus',
  --       -- },
  --     }
  --     vim.cmd [[colorscheme kanagawa]]
  --   end,
  -- },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   opts = {
  --     styles = {
  --       transparency = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require('rose-pine').setup {
  --       styles = { transparency = true },
  --     }
  --     vim.cmd [[colorscheme rose-pine]]
  --   end,
  -- },
}

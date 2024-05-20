-- {
--     'ellisonleao/gruvbox.nvim',
--     config = function()
--       require('gruvbox').setup { transparent_mode = true }
--       -- vim.cmd.colorscheme 'gruvbox'
--     end,
--   },
-- return {
--   'savq/melange-nvim',
--   lazy = false,
--   priority = 1000,
--   name = 'moonfly',
--   --
--   --
--   config = function()
--     require('melange').setup {
--       transparent_mode = true,
--     }
--     colorscheme 'melange'
--   end,
-- }
--
-- return {
--   'bluz71/vim-moonfly-colors',
--   name = 'moonfly',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.moonflyTransparent = true
--     vim.cmd.colorscheme 'moonfly'
--   end,
-- }

return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
      transparent = true,
      term_colors = true,
      -- style = 'multiplex',
    }
    require('bamboo').load()
  end,
}
--
-- return {
--   -- 'olivercederborg/poimandres.nvim',
--   -- lazy = false,
--   -- priority = 1000,
--   -- config = function()
--   --   require('poimandres').setup {
--   --     -- leave this setup function empty for default config
--   --     -- or refer to the configuration section
--   --     -- for configuration options
--   --   }
--   -- end,
--   --
--   -- -- optionally set the colorscheme within lazy config
--   -- init = function()
--   --   vim.cmd.colorscheme 'poimandres'
--   -- end,
-- }

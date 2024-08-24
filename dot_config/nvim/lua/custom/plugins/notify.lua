-- return {
--   'rcarriga/nvim-notify',
--   config = function()
--     require('notify').setup {
--       fps = 170,
--       stages = 'slide',
--       render = 'compact',
--       background_colour = '#2d2d2d',
--       timeout = 2000,
--       top_down = false,
--     }
--   end,
-- }
--
-- return {
--   'vigoux/notifier.nvim',
--   config = function()
--     require('notifier').setup {
--       -- You configuration here
--       notify = {
--         clear_time = 3000,
--       },
--     }
--   end,
-- }
return {
  'j-hui/fidget.nvim',
  opts = {
    -- options
  },
  config = function()
    require('fidget').setup {}
  end,
}

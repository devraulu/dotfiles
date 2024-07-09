return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      fps = 170,
      stages = 'fade_in_slide_out',
      render = 'minimal',
      background_colour = '#2d2d2d',
      timeout = 2000,
      top_down = false,
    }
  end,
}

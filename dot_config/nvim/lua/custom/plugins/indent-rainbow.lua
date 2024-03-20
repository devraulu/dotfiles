return {
  'lukas-reineke/indent-blankline.nvim',
  opts = function(_, opts)
    return require('indent-rainbowline').make_opts(opts, { color_transparency = 0.13 })
  end,
  dependencies = {
    'TheGLander/indent-rainbowline.nvim',
  },
}

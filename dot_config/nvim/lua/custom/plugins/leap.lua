return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function(_, opts)
    require('leap').create_default_mappings()
  end,
}

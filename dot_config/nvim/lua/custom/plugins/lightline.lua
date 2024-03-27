return {
  'itchyny/lightline.vim',
  dependencies = { 'tpope/vim-fugitive' },
  config = function()
    -- vim.o.laststatus = 2
    vim.g.lightline = {
      colorscheme = 'wombat',
      mode_map = {
        ['n'] = 'N',
        ['no'] = 'N·P',
        ['v'] = 'V',
        ['V'] = 'V·L',
        [''] = 'V·B',
        ['i'] = 'I',
        ['R'] = 'R',
        ['Rv'] = 'R·V',
        ['s'] = 'S',
        ['S'] = 'S·L',
        [''] = 'S·B',
        ['c'] = 'C',
        ['cv'] = 'E',
        ['ce'] = 'E',
        ['r'] = 'R',
        ['rm'] = 'R',
        ['r?'] = 'R',
        ['!'] = '!',
        ['t'] = 'T',
      },
      active = {
        left = {
          { 'mode', 'paste' },
          { 'readonly', 'filename', 'modified' },
        },
        right = {
          { 'lineinfo' },
          { 'percent' },
          { 'fileformat', 'fileencoding', 'filetype' },
          { 'gitbranch' },
        },
      },
      component_function = {
        gitbranch = 'FugitiveHead',
      },
      component_expand = {
        fileformat = 'lightline#fileformat#name',
      },
    }
  end,
}

local git = {}
local cfg = require('modules/git/config')

git['lewis6991/gitsigns.nvim'] = {
  config = cfg.gitsigns,
  requires = {
    'nvim-lua/plenary.nvim',
  },
}

git['tpope/vim-fugitive'] = {
  config = cfg.fugitive,
}

return git

local treesitter = {}
local cfg = require('modules.treesitter.config')

treesitter['nvim-treesitter/nvim-treesitter'] = {
  run = ':TSUpdate',
  config = cfg.treesitter
}
treesitter['windwp/nvim-ts-autotag'] = {}
treesitter['p00f/nvim-ts-rainbow'] = {}

return treesitter

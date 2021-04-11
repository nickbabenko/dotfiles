local nvimtree = {}
local conf = require('modules/nvim-tree/config')

nvimtree['kyazdani42/nvim-tree.lua'] = {
  config = conf.nvim_tree,
}
nvimtree['kyazdani42/nvim-web-devicons'] = {}

return nvimtree

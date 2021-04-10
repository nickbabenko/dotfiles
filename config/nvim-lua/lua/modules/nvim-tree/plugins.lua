local nvimtree = {}
local conf = require('modules/nvim-tree/config')

nvimtree['kyazdani42/nvim-tree.lua'] = {
  config = conf.nvim_tree,
}
nvimtree['ryanoasis/vim-devicons'] = {}

return nvimtree

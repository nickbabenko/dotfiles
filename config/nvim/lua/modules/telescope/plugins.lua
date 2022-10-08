local telescope = {}
local cfg = require('modules/telescope/config')

telescope['nvim-telescope/telescope.nvim'] = {
  requires = { {'nvim-lua/plenary.nvim'} },
  config = cfg.telescope
}

return telescope 


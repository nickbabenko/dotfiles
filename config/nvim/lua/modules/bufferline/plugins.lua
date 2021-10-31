local bufferline = {}
local cfg = require('modules/bufferline/config')

bufferline['akinsho/bufferline.nvim'] = {
  config = cfg.bufferline,
  requires = {
    'kyazdani42/nvim-web-devicons'
  } 
}

return bufferline

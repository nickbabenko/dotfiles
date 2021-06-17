local lualine = {}
local cfg = require('modules/lualine/config')

lualine['hoob3rt/lualine.nvim'] = {
  config = cfg.lualine,
  requires = {
    'kyazdani42/nvim-web-devicons'
  }
}

return lualine


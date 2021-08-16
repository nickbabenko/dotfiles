local theme = {}
local cfg = require('modules/theme/config')

-- theme['joshdick/onedark.vim'] = {
--   config = cfg.onedark,
-- }

theme['tjdevries/colorbuddy.nvim'] = {
  config = cfg.colorbuddy,
}

theme['marko-cerovac/material.nvim'] = {
  config = cfg.material,
}

return theme

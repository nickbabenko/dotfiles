local autocomplete = {}
local cfg = require('modules/autocomplete/config')

autocomplete['jiangmiao/auto-pairs'] = {}
autocomplete['numToStr/Comment.nvim'] = {
  config = cfg.comment
}

return autocomplete

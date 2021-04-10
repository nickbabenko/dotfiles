local coc = {}
local conf = require('modules.coc.config')

coc['neoclide/coc.nvim'] = {
  branch = 'release',
  config = conf.coc_nvim,
}

coc['rafcamlet/coc-nvim-lua'] = {}
coc['neoclide/coc-tsserver'] = {}
coc['neoclide/coc-json'] = {}
coc['neoclide/coc-prettier'] = {}
coc['neoclide/coc-eslint'] = {}
coc['marlonfan/coc-phpls'] = {}

return coc

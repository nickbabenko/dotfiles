local utils = require('lib.utils')

local autocmds = {
--  {
--    {
--      'BufWritePre',
--      '*',
--      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]]
--    }
--  }
}

utils.define_augroups(autocmds)


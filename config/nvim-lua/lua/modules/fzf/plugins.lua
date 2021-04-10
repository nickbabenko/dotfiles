local fzf = {}
local cfg = require('modules/fzf/config')

fzf['junegunn/fzf'] = {
  run = function()
    vim.fn['fzf#install']()
  end,
  config = cfg.fzf,
}
fzf['junegunn/fzf.vim'] = {}

return fzf

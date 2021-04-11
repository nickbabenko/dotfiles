local lsp = {}
local cfg = require('modules/lsp/config')

lsp['neovim/nvim-lspconfig'] = {
  config = cfg.lspconfig,
}
lsp['hrsh7th/nvim-compe'] = {
  config = cfg.compe,
}
lsp['sbdchd/neoformat'] = {}

return lsp


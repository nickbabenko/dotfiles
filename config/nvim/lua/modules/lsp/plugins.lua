local lsp = {}
local cfg = require('modules/lsp/config')

lsp['neovim/nvim-lspconfig'] = {
  config = cfg.lspconfig,
}
lsp['hrsh7th/nvim-cmp'] = {
  config = cfg.compe,
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'hrsh7th/cmp-nvim-lua',
    'octaltree/cmp-look', 
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'f3fora/cmp-spell',
    'hrsh7th/cmp-emoji',
  }
}
lsp['sbdchd/neoformat'] = {}
lsp['folke/lsp-trouble.nvim'] = {
  config = cfg.trouble,
}

return lsp


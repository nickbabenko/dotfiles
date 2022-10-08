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
    'octaltree/cmp-look', 
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'f3fora/cmp-spell',
    'hrsh7th/cmp-emoji',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip'
  }
}
lsp['sbdchd/neoformat'] = {}
-- lsp['folke/lsp-trouble.nvim'] = {
--   config = cfg.trouble,
-- }

return lsp


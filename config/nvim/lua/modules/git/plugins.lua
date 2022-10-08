local git = {}
local cfg = require('modules/git/config')

git['lewis6991/gitsigns.nvim'] = {
  config = cfg.gitsigns,
  requires = {
    'nvim-lua/plenary.nvim',
  },
}

-- git['tpope/vim-fugitive'] = {
--   config = cfg.fugitive,
-- }
git['f-person/git-blame.nvim'] = {}
git['kdheepak/lazygit.nvim'] = {
  config = cfg.lazygit,
}
git['sindrets/diffview.nvim'] = {
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = cfg.diffview,
}
git['tanvirtin/vgit.nvim'] = {
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = cfg.vgit,
}

return git

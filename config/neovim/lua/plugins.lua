local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope.nvim",   tag = "0.1.1" },
  "neovim/nvim-lspconfig",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  "sbdchd/neoformat",
  "nvim-telescope/telescope-file-browser.nvim",
  {
    "arsham/arshamiser.nvim",
    dependencies = {
      "arsham/arshlib.nvim",
      "famiu/feline.nvim",
      "rebelot/heirline.nvim",
      "nvim-tree/nvim-web-devicons",
    }
  },
  { "catppuccin/nvim",       name = "catppuccin" },
  { "numToStr/Comment.nvim", init = function() require('Comment').setup() end },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  "MunifTanjim/prettier.nvim",
})

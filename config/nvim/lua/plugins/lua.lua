local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require("packer").startup(
  function ()
    use {"wbthomason/packer.nvim", opt = true}
    use "norcalli/nvim-base16.lua"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/gitsigns.nvim"
    use "akinsho/nvim-bufferline.lua"
    use "glepnir/galaxyline.nvim"
    use "907th/vim-auto-save"
    use "nvim-treesitter/nvim-treesitter"
    use "norcalli/nvim-colorizer.lua"
    use "ryanoasis/vim-devicons"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-lua/popup.nvim"
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "hrsh7th/nvim-compe"
    use "karb94/neoscroll.nvim"
  end
)

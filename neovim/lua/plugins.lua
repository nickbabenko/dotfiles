vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use 'nvim-tree/nvim-web-devicons'
  use 'rebelot/heirline.nvim'

  use { "nvim-telescope/telescope-file-browser.nvim" }


use { 'sbdchd/neoformat' }

use({
	"arsham/arshamiser.nvim",
	requires = {
		"arsham/arshlib.nvim",
		"famiu/feline.nvim",
		"rebelot/heirline.nvim",
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		-- ignore any parts you don't want to use
		vim.cmd.colorscheme("arshamiser_light")
		require("arshamiser.feliniser")
		-- or:
		-- require("arshamiser.heirliniser")

		_G.custom_foldtext = require("arshamiser.folding").foldtext
		vim.opt.foldtext = "v:lua.custom_foldtext()"
		-- if you want to draw a tabline:
		vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
	end,
})

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
end)

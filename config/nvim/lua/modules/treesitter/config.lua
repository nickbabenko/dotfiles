local config = {}

config.treesitter = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = Treesitter.parsers,
    highlight = {
      enable = true, 
      use_languagetree = true
    },
    indent = {enable = true},
    rainbow = {enable = Treesitter.rainbow},
    autotag = {enable = Completion.autotag}
  }
end

return config

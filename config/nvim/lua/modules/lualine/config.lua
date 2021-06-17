local config = {}

config.lualine = function()
  require('lualine').setup {
    options = {
      theme = 'material-nvim'
    }
  }
end

return config

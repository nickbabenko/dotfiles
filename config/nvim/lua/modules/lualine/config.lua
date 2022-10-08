local config = {}

config.lualine = function()
  require('lualine').setup {
    options = {
      theme = 'material'
    }
  }
end

return config

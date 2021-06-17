local config = {}

function config.colorbuddy()
  require('colorbuddy').colorscheme('material')
end

function config.onedark()
  
end

function config.material()
  vim.g.material_style = 'deep ocean'
end

return config

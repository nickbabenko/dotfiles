local config = {}

function config.colorbuddy()
  vim.g.material_style = 'deep ocean'
  vim.g.material_borders = true 
  require('colorbuddy').colorscheme('material')
end

function config.onedark()
  
end

function config.material()
end

return config

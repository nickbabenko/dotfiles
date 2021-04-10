local config = {}

function config.onedark()
  vim.g.onedark_color_overrides = {
    black = {
      gui = '#000000',
      cterm = '0',
      cterm16 = '0'
    },
  }
  vim.cmd('highlight Normal ctermbg=Black')
  vim.cmd('colorscheme onedark')
  vim.cmd('set termguicolors')
end

return config

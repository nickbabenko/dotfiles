local config = {}

config.gitsigns = function()
  require('gitsigns').setup()
end

config.fugitive = function()
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>ga',
    ':Git add %:p<CR><CR>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gs',
    ':Git<CR>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gc',
    ':Git commit -v -q<CR>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gt',
    ':Git commit -v -q %:p<CR>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gd',
    ':Git diff<CR>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>ge',
    ':Gedit<CR>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gr',
    ':Gread<CR>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gw',
    ':Gwrite<CR>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gl',
    ':Git log<CR>:bot copen<CR>',
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gp',
    ':Ggrep<Space>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gm',
    ':Gmove<Space>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gb',
    ':Git branch<Space>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>go',
    ':Git checkout<Space>',
    {
      noremap = true,
    }
  ) 
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gps',
    ':Dispatch! git push<CR>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gpsv',
    ':Dispatch! git push --no-verify<CR>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>gpl',
    ':Dispatch! git pull<CR>',
    {
      noremap = true,
    }
  )
end

return config

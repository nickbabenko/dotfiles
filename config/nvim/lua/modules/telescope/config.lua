local config = {}

config.telescope = function()
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>ff',
    '<cmd>Telescope find_files theme=ivy<cr>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    '<cmd>Telescope find_files theme=ivy<cr>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>fg',
    '<cmd>Telescope live_grep theme=ivy<cr>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>fb',
    '<cmd>Telescope buffers theme=ivy<cr>',
    {
      noremap = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>fh',
    '<cmd>Telescope help_tags theme=ivy<cr>',
    {
      noremap = true,
    }
  )


end

return config

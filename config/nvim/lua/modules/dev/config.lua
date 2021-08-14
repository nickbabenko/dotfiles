local config = {}

config.test = function()
  vim.api.nvim_set_keymap(
    'n',
    't<C-n>',
    ':TestNearest<CR>',
    {
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    't<C-f>',
    ':TestFile<CR>',
    {
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    't<C-s>',
    ':TestSuite<CR>',
    {
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    't<C-l>',
    ':TestLast<CR>',
    {
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    't<C-v>',
    ':TestVisit<CR>',
    {
      silent = true,
    }
  )
  vim.g['test#strategy'] = 'neovim'
end

return config

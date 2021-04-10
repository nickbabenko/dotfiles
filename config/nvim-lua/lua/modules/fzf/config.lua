local config = {}

function config.fzf()
  vim.g.fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
  }
  vim.g.fzf_layout = {
    down = '25%',
  }
  vim.g.fzf_tags_command = 'ctags -R'

  vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
  vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden -uu --glob \'!.git/**\' --glob \'!build/**\''

  vim.api.nvim_set_keymap('n', '<C-p>', ':Files<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Rg<cr>', { noremap = true, silent = true })
end

return config


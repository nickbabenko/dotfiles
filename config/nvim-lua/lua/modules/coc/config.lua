local config = {}

function config.coc_nvim()
  vim.g.coc_global_extensions = {
    'coc-tsserver',
  }
  if vim.fn.isdirectory('./node_modules') then
    if vim.fn.isdirectory('./node_modules/prettier') then
      table.insert(vim.g.coc_global_extensions, 'coc-prettier')
    end
    if vim.fn.isdirectory('./node_modules/eslint') then
      table.insert(vim.g.coc_global_extensions, 'coc-eslint')
    end
  end
  if vim.fn.isdirectory('./vendor') then
    table.insert(vim.g.coc_global_extensions, 'coc-phpls')
  end

  vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
  vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
  vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
  vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
  vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
  vim.api.nvim_set_keymap('n', '<space>d', ':<C-u>CocList diagnostics<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>do', '<Plug>(coc-codeaction)', {})
  vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})
end

return config

local config = {}

function config.startify()
  vim.cmd('autocmd BufEnter * if line2byte(\'.\') == -1 && len(tabpagebuflist()) == 1 | Startify | endif')
  vim.g.startify_change_to_dir = 0 
end

return config

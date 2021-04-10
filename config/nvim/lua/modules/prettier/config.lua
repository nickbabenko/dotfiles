local config = {}

config.prettier = function()
  vim.g['prettier#autoformat'] = 1
  vim.g['prettier#autoformat_require_pragma'] = 0
  vim.g['prettier#autoformat_config_files'] = '~/.prettierrc.js'
end

return config

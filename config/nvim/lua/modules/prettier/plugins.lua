local prettier = {}
local conf = require('modules/prettier/config')

prettier['prettier/vim-prettier'] = {
  branch = 'master',
  run = 'npm install',
  config = conf.prettier,
}

return prettier

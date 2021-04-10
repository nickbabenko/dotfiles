local syntax = {}
  
syntax['pangloss/vim-javascript'] = {}
syntax['leafgarland/typescript-vim'] = {}
syntax['peitalin/vim-jsx-typescript'] = {}
syntax['styled-components/vim-styled-components'] = {
  branch = 'main',
}
syntax['jparise/vim-graphql'] = {}
syntax['luochen1990/rainbow'] = {
  config = function()
    vim.g.rainbow_active = 1
  end
}

return syntax

local config = {}

config.lspconfig = function()
  local nvim_lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local servers = {
    bash = 'bashls',
    css = 'cssls',
    json = 'jsonls',
    html = 'html',
    ts = 'tsserver',
    terraform = 'terraformls',
    php = 'intelephense',
    c = 'clangd',
    eslint = 'eslint',
    docker = 'dockerls',
    graphql = 'graphql',
    json = 'jsonls',
    java = 'java_language_server',
    lua = 'sumneko_lua',
  }

  for config_key, server_ref in pairs(servers) do
    nvim_lsp[server_ref].setup {
      autostart = LSP[config_key],
      capabilities = capabilities,
    }
  end

  vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-k>", ":lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true })
  --vim.api.nvim_set_keymap("n", "<c-p>", ":lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
  --vim.api.nvim_set_keymap("n", "<c-n>", ":lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
end

config.compe = function()
  require('cmp').setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  }
end

config.trouble = function()
  vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>",
    {silent = true, noremap = true}
  )
end

return config

local config = {}

config.lspconfig = function()
  local nvim_lsp = require('lspconfig')

  local servers = {
    bash = 'bashls',
    css = 'cssls',
    json = 'jsonls',
    html = 'html',
    ts = 'tsserver',
    php = 'intelephense',
  }

  for config_key, server_ref in pairs(servers) do
    nvim_lsp[server_ref].setup {
     autostart = LSP[config_key],
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
  --vim.api.nvim_set_keymap("n", "<c-p>", ":lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
  --vim.api.nvim_set_keymap("n", "<c-n>", ":lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
end

config.compe = function()
  require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = true,
      buffer = true,
      calc = true,
      vsnip = true,
      nvim_lsp = true,
      nvim_lua = {kind = "  "},
      spell = true,
      tags = false,
      -- treesitter = true,
      emoji = {kind = " ﲃ "}
    }
  }
end

return config

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
    print('lsp', config_key, server_ref, LSP[config_key])
    nvim_lsp[server_ref].setup {
     autostart = LSP[config_key],
    }
  end
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

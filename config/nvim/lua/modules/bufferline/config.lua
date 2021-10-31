local config = {}

config.bufferline = function()
  require('bufferline').setup {
    options = {
      numbers = function(opts)
        return string.format('%s', opts.id)
      end,
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Eplorer',
          highlight = 'Directory',
          text_align = 'left'
        },
        {
          filetype = 'vista',
          text = 'LspTags',
        }
      }
    }
  }

  for i=1,10 do vim.api.nvim_set_keymap(
    'n',
    string.format('<Leader>%d', i),
    string.format(':%db<CR>', i),
    {
        noremap = true,
    }
  ) end
end

return config

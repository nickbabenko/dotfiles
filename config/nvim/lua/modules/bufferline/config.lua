local config = {}

config.bufferline = function()
  require('bufferline').setup {
    options = {
      numbers = function(opts)
        return string.format('%s', opts.id)
      end,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
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

  vim.api.nvim_set_keymap(
    'n',
    '<Leader>[',
    ':BufferLineCyclePrev<CR>',
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<Leader>]',
    ':BufferLineCycleNext<CR>',
    {
      noremap = true,
      silent = true,
    }
  )
end

return config

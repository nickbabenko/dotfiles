local global = require('lib.global')

local createdir = function ()
  local data_dir = {
    global.join_paths(global.cache_dir, 'backup'),
    global.join_paths(global.cache_dir, 'session'),
    global.join_paths(global.cache_dir, 'tags'),
    global.join_paths(global.cache_dir, 'undo'),
  }
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    vim.fn.mkdir(global.cache_dir, 'p')
    for _, path in ipairs(data_dir) do
      if vim.fn.isdirectory(path) == 0 then
        vim.fn.mkdir(path, 'p')
      end
    end
  end
end

local disable_distribution_plugins = function ()
  -- disable vim compress file support(preview)
  vim.g.loaded_gzip               = 1
  vim.g.loaded_tar                = 1
  vim.g.loaded_tarPlugin          = 1
  vim.g.loaded_zip                = 1
  vim.g.loaded_zipPlugin          = 1
  -- disable vim archiver: build extract and preview
  vim.g.loaded_getscript          = 1
  vim.g.loaded_getscriptPlugin    = 1
  vim.g.loaded_vimball            = 1
  vim.g.loaded_vimballPlugin      = 1
  vim.g.loaded_matchit            = 1
  vim.g.loaded_matchparen         = 1
  vim.g.loaded_2html_plugin       = 1
  vim.g.loaded_logiPat            = 1
  vim.g.loaded_rrhelper           = 1
  -- https://www.vim.org/scripts/ script.php?script_id=1075
  vim.g.loaded_netrw              = 1
  vim.g.loaded_netrwPlugin        = 1
  vim.g.loaded_netrwSettings      = 1
  vim.g.loaded_netrwFileHandlers  = 1
end

local leader_map = function ()
  vim.g.mapleader = ";"
  --vim.api.nvim_set_keymap('n',' ','',{noremap = true})
  --vim.api.nvim_set_keymap('x',' ','',{noremap = true})
end

local basic_map = function ()
  vim.api.nvim_set_keymap('i', '<Leader>s', '<Esc>:w<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('', '<Leader>s', '<Esc>:w<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', '<Leader>x', '<Esc>:x<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('', '<Leader>x', '<Esc>:x<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', '<Leader>q', '<Esc>:q<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('', '<Leader>q', '<Esc>:q<CR>', { noremap = true, silent = true })
end

local core_init = function ()
  createdir()
  disable_distribution_plugins()
  leader_map()
  basic_map()

  require('lib.plugins').ensure_plugins()
end

core_init()

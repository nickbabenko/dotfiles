local global = {}
global.os_name = vim.loop.os_uname().sysname
global.path_sep = '/'

local function load_options()
  local options = {
    o = {
      hidden = true,
      ignorecase = true,
      splitbelow = true,
      splitright = true,
      termguicolors = true,
      number = true,
      mouse = 'a',
      updatetime = 250,
      clipboard = 'unnamedplus',
    },
    wo = {
      numberwidth = 2,
      signcolumn = 'yes',
    },
    bo = {
      shiftwidth = 2,
      softtabstop = 2,
      tabstop = 2,
      expandtab = true,
    },
  }

  for scope, scopeOptions in pairs(options) do
    for key, value in pairs(scopeOptions) do
      vim[scope][key] = value
      if scope ~= "o" then
        vim.o[key] = value
      end
    end
  end
end

global.join_paths = function (...)
  return table.concat({...}, global.path_sep)
end

function global:load_variables()
  -- ~/.cache/nvim/
  self.cache_dir = self.join_paths(os.getenv('HOME'), '.cache', 'nvim')
  -- ~/.config/nvim/lua/modules
  self.plugin_modules_dir = self.join_paths(vim.fn.stdpath('config'), 'lua', 'modules')
  -- ~/.local/share/nvim/site/
  self.data_dir = self.join_paths(vim.fn.stdpath('data'), 'site')
  -- ~/.local/share/nvim/site/plugin/packer_compiled.vim
  self.packer_compiled_path = self.join_paths(self.data_dir, 'plugin', 'packer_compiled.vim')
  -- ~/.loca/share/nvim/site/pack/packer/opt/packer.vim
  self.packer_dir = self.join_paths(self.data_dir, 'pack', 'packer', 'opt', 'packer.vim')
  load_options()
end

global:load_variables()

return global

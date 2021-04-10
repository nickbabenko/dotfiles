local global = require('lib.global')
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  self.repos = {}

  local get_plugins_list = function ()
    local list = {}
    local tmp = vim.split(vim.fn.globpath(global.plugin_modules_dir,'*/plugins.lua'),'\n')
    for _,f in ipairs(tmp) do
      list[#list+1] = f:sub(#global.plugin_modules_dir - 6,-1)
    end
    return list
  end

  local plugins_file = get_plugins_list()
  for _,m in ipairs(plugins_file) do
    local repos = require(m:sub(0,#m-4))
    for repo,conf in pairs(repos) do
      self.repos[#self.repos+1] = vim.tbl_extend('force',{repo},conf)
    end
  end
end

function Packer:load_packer()
  if not packer then
    vim.api.nvim_command('packadd packer.nvim')
    packer = require('packer')
  end
  packer.init({
    compile_path = global.packer_compiled_path,
    git = { clone_timeout = 120 }
  })
  packer.reset()
  local use = packer.use
  self:load_plugins()
  use {"wbthomason/packer.nvim", opt = true}
  for _,repo in ipairs(self.repos) do
    use(repo)
  end
end

function Packer:init_ensure_plugins()
  local state = vim.fn.isdirectory(global.join_paths(global.data_dir, 'plugin'))
  if state == 0 then
    local cmd = "!git clone https://github.com/wbthomason/packer.nvim " ..global.packer_dir
    vim.api.nvim_command(cmd)
    vim.fn.mkdir(global.join_paths(global.data_dir, 'plugin'))
    self:load_packer()
    packer.install()
    packer.compile()
  else
    self:load_packer()
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end
})

-- entry of load packer plugin
function plugins.ensure_plugins()
  Packer:init_ensure_plugins()
end

-- auto clean and compile when plugin config file change
function plugins.auto_compile()
  local file = vim.fn.expand('%:p')
  if file:match(global.plugin_modules_dir) then
    plugins.clean()
    plugins.compile()
  end
end

return plugins


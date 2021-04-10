require("plugins.lua")
require("file-icons.lua")
require("settings.lua")
require("nvim-tree.lua")
require("bufferline.lua")
require("telescope.lua")
require("mappings.lua")
require("statusline.lua")
require("treesitter.lua")
require("lspconfig.lua")
require("prettier.lua")

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 1

cmd "syntax enable"
cmd "syntax on"

local base16 = require "base16"
base16(base16.themes["material-darker"], true)

g.shiftwidth = 2
g.softtabstop = 2
g.tabstop = 2
g.expandtab = true

vim.cmd 'autocmd Filetype php setlocal ts=4 sw=4 expandtab'
vim.cmd 'autocmd Filetype vcl setlocal ts=4 sw=4 expandtab'

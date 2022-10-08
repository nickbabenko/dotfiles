local config = {}

function config.nvim_tree()
  vim.o.termguicolors = true

  vim.g.nvim_tree_git_hl = 1

  local g = vim.g
  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }
  g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
    },
    folder = {
        default = "",
        open = "",
        symlink = ""
    }
  }

  require('nvim-tree').setup {
    open_on_tab = true,
    hijack_cursor = true,
    update_to_buf_dir = {
      auto_open = false,
    },
    view = {
      side = 'left',
      width = 30,
    },
    filters = {
      dotfiles = false,
      custom = {
        '.node_modules'
      }
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
  }

  -- Mappings for nvimtree

  vim.api.nvim_set_keymap(
    "n",
    "<C-f>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
  )
  end

return config

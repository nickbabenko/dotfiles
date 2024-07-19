require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "typescript", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  enable = true,
  disable = function(lang, bufnr) -- Disable in large C++ buffers
    return api.nvim_buf_line_count(bufnr) > 50000
  end,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    is_supported = function ()
      if vim.fn.strwidth(vim.fn.getline('.')) > 300
        or vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024 then
        return false
      else
        return true
      end
    end
  },
}

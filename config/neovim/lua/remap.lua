local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>q", ":q<CR>", { silent = true })
map("i", "<Leader>q", "<Esc>:q<CR>", { silent = true })

map("n", "<Leader>w", ":w<CR>", { silent = true })
map("i", "<Leader>w", "<Esc>:w<CR>", { silent = true })
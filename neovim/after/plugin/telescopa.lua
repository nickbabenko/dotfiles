
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>pg', function() builtin.live_grep() end, {})
vim.keymap.set('n', '<C-p>', function() builtin.git_files({ hidden=true }) end, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser",
  { noremap = true }
)

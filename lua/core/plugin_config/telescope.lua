require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fs', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>fz', ':Telescope live_grep<CR>')
--vim.keymap.set('n', '<leader>fp', ':Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

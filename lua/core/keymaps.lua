-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- yank to clipboard
vim.keymap.set({'n', 'v'}, "<leader>y", [["+y]])

-- buffers
vim.keymap.set('n', '<leader>n', ':bn<CR>') -- switch to the next buffer
vim.keymap.set('n', '<leader>p', ':bp<CR>') -- switch to the previous buffer
vim.keymap.set('n', '<leader>x', ':bd<CR>') -- close the buffer

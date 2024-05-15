require('telescope').setup({ 
  pickers = {
    find_files = {
      file_ignore_patterns = {
        ".git"
      },
      hidden = true
    }
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fz', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

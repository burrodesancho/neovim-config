require('bufferline').setup{
  options = {
    mode = 'buffers',
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        separator = true,
      },
    },
  },
}

vim.keymap.set('n', '<leader>bl', ':BufferLinePick<CR>')

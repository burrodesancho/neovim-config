require("neo-tree").setup({
  popup_border_style = "rounded",
  window = {
    position = "left",
    width = 30,
  },
})

vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
